/*
  Bullet Continuous Collision Detection and Physics Library
  Copyright (c) 2003-2006 Erwin Coumans  http://continuousphysics.com/Bullet/

  This software is provided 'as-is', without any express or implied warranty.
  In no event will the authors be held liable for any damages arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose, 
  including commercial applications, and to alter it and redistribute it freely, 
  subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

///btSoftBody implementation by Nathanael Presson


#include "btBulletDynamicsCommon.h"
#include "BulletSoftBody/btSoftRigidDynamicsWorld.h"

#include "BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.h"
#include "BulletCollision/NarrowPhaseCollision/btGjkEpa2.h"
#include "LinearMath/btQuickprof.h"
#include "LinearMath/btIDebugDraw.h"

#include "Meshes/BunnyMesh.h"
#include "Meshes/TorusMesh.h"
#include <stdio.h> //printf debugging
#include "LinearMath/btConvexHull.h"
#include "BulletSoftBody/btSoftBodyRigidBodyCollisionConfiguration.h"
#include "BulletSoftBody/btSoftBodyHelpers.h"

#include "SoftDemo.h"
#include "BulletDemoFiles/GLDebugFont.h"
#include "BulletDemoFiles/GlutStuff.h"

extern float eye[3];
extern int glutScreenWidth;
extern int glutScreenHeight;

static bool sDemoMode = false;

const int maxProxies = 32766;
const int maxOverlap = 65535;

static btVector3*	gGroundVertices=0;
static int*	gGroundIndices=0;
static btBvhTriangleMeshShape* trimeshShape =0;
static btRigidBody* staticBody = 0;
static float waveheight = 5.f;

const float TRIANGLE_SIZE=8.f;
int		current_demo=20;
#define DEMO_MODE_TIMEOUT 15.f //15 seconds for each demo


#ifdef _DEBUG
const int gNumObjects = 1;
#else
const int gNumObjects = 1;//try this in release mode: 3000. never go above 16384, unless you increate maxNumObjects  value in DemoApplication.cp
#endif

const int maxNumObjects = 32760;

#define CUBE_HALF_EXTENTS 1.5
#define EXTRA_HEIGHT -10.f


#ifdef USE_AMD_OPENCL
#include "btOpenCLUtils.h"
#include "BulletMultiThreaded/GpuSoftBodySolvers/OpenCL/btSoftBodySolver_OpenCL.h"
#include "BulletMultiThreaded/GpuSoftBodySolvers/OpenCL/btSoftBodySolver_OpenCLSIMDAware.h"
#include "BulletMultiThreaded/GpuSoftBodySolvers/OpenCL/btSoftBodySolverVertexBuffer_OpenGL.h"

btOpenCLSoftBodySolver* g_openCLSIMDSolver=0;
btSoftBodySolverOutputCLtoCPU* g_softBodyOutput = 0;

cl_context			g_cxMainContext;
cl_device_id		g_cdDevice;
cl_command_queue	g_cqCommandQue;

void initCL( void* glCtx, void* glDC )
{
  int ciErrNum = 0;

#if defined(CL_PLATFORM_MINI_CL)
  cl_device_type deviceType = CL_DEVICE_TYPE_CPU;//or use CL_DEVICE_TYPE_DEBUG to debug MiniCL
#elif defined(CL_PLATFORM_INTEL)
  cl_device_type deviceType = CL_DEVICE_TYPE_CPU;
#elif defined(CL_PLATFORM_AMD)
  cl_device_type deviceType = CL_DEVICE_TYPE_GPU;
#elif defined(CL_PLATFORM_NVIDIA)
  cl_device_type deviceType = CL_DEVICE_TYPE_GPU;
#else
#ifdef __APPLE__
  cl_device_type deviceType = CL_DEVICE_TYPE_ALL;//GPU;
#else
  cl_device_type deviceType = CL_DEVICE_TYPE_CPU;//CL_DEVICE_TYPE_ALL
#endif//__APPLE__
#endif
	
  g_cxMainContext = btOpenCLUtils::createContextFromType(deviceType, &ciErrNum, glCtx, glDC);
  oclCHECKERROR(ciErrNum, CL_SUCCESS);

	
  int numDev = btOpenCLUtils::getNumDevices(g_cxMainContext);
  if (!numDev)
    {
      btAssert(0);
      exit(0);//this is just a demo, exit now
    }

  g_cdDevice = btOpenCLUtils::getDevice(g_cxMainContext,0);
  oclCHECKERROR(ciErrNum, CL_SUCCESS);

  btOpenCLDeviceInfo clInfo;
  btOpenCLUtils::getDeviceInfo(g_cdDevice,clInfo);
  btOpenCLUtils::printDeviceInfo(g_cdDevice);
	
  // create a command-queue
  g_cqCommandQue = clCreateCommandQueue(g_cxMainContext, g_cdDevice, 0, &ciErrNum);
  oclCHECKERROR(ciErrNum, CL_SUCCESS);
}

class CachingCLFunctions : public CLFunctions
{
protected:

  cl_device_id		m_device;

  const char* strip(const char* name, const char* pattern);

public:
  CachingCLFunctions(cl_command_queue cqCommandQue, cl_context cxMainContext) :
    CLFunctions(cqCommandQue,cxMainContext)
  {
    size_t actualSize;
    cl_int retval = clGetCommandQueueInfo (	cqCommandQue, CL_QUEUE_DEVICE, sizeof(cl_device_id),
                                                &m_device, &actualSize);
  }

  /**
   * Compile a compute shader kernel from a string and return the appropriate cl_kernel object.
   */	
  virtual cl_kernel compileCLKernelFromString( const char* kernelSource, const char* kernelName, const char* additionalMacros , const char* orgSrcFileNameForCaching)
  {
    char srcFileNameForCaching[1024];
    sprintf(srcFileNameForCaching,"%s/%s","../../src/BulletMultiThreaded/GpuSoftBodySolvers/OpenCL",orgSrcFileNameForCaching);

    btAssert(additionalMacros);
    btAssert(srcFileNameForCaching && strlen(srcFileNameForCaching));

    printf("compiling kernelName: %s ",kernelName);
    cl_kernel kernel=0;
    cl_int ciErrNum;


    size_t program_length = strlen(kernelSource);

    cl_program m_cpProgram = btOpenCLUtils::compileCLProgramFromString(m_cxMainContext, m_device, kernelSource,  &ciErrNum, additionalMacros);

		
    // Create the kernel
    kernel = clCreateKernel(m_cpProgram, kernelName, &ciErrNum);
    if (ciErrNum != CL_SUCCESS)
      {
        const char* msg = "";
        switch(ciErrNum)
          {
          case CL_INVALID_PROGRAM:
            msg = "Program is not a valid program object.";
            break;
          case CL_INVALID_PROGRAM_EXECUTABLE:
            msg = "There is no successfully built executable for program.";
            break;
          case CL_INVALID_KERNEL_NAME:
            msg = "kernel_name is not found in program.";
            break;
          case CL_INVALID_KERNEL_DEFINITION:
            msg = "the function definition for __kernel function given by kernel_name such as the number of arguments, the argument types are not the same for all devices for which the program executable has been built.";
            break;
          case CL_INVALID_VALUE:
            msg = "kernel_name is NULL.";
            break;
          case CL_OUT_OF_HOST_MEMORY:
            msg = "Failure to allocate resources required by the OpenCL implementation on the host.";
            break;
          default:
            {
            }
          }

        printf("Error in clCreateKernel for kernel '%s', error is \"%s\", Line %u in file %s !!!\n\n", kernelName, msg, __LINE__, __FILE__);

#ifndef BT_SUPPRESS_OPENCL_ASSERTS
        btAssert(0);
#endif //BT_SUPPRESS_OPENCL_ASSERTS
        m_kernelCompilationFailures++;
        return 0;
      }

    printf("ready. \n");
    if (!kernel)
      m_kernelCompilationFailures++;
    return kernel;
  }

};


#endif //USE_AMD_OPENCL

//TICK CALLBACKS
TickCallbacks preTickCallbackHandler;

//
void SoftDemo::createStack( btCollisionShape* boxShape, float halfCubeSize, int size, float zPos )
{
  btTransform trans;
  trans.setIdentity();

  for(int i=0; i<size; i++)
    {
      // This constructs a row, from left to right
      int rowSize = size - i;
      for(int j=0; j< rowSize; j++)
        {
          btVector3 pos;
          pos.setValue(
                       -rowSize * halfCubeSize + halfCubeSize + j * 2.0f * halfCubeSize,
                       halfCubeSize + i * halfCubeSize * 2.0f,
                       zPos);

          trans.setOrigin(pos);
          btScalar mass = 1.f;

          btRigidBody* body = 0;
          body = localCreateRigidBody(mass,trans,boxShape);

        }
    }
}


////////////////////////////////////

extern int gNumManifold;
extern int gOverlappingPairs;


/**
   PRE TICK CALLBACKS
 */

///for mouse picking
void pickingPreTickCallback (btDynamicsWorld *world, btScalar timeStep)
{
  SoftDemo* softDemo = (SoftDemo*)world->getWorldUserInfo();

  if(softDemo->m_drag)
    {
      const int				x=softDemo->m_lastmousepos[0];
      const int				y=softDemo->m_lastmousepos[1];
      const btVector3			rayFrom=softDemo->getCameraPosition();
      const btVector3			rayTo=softDemo->getRayTo(x,y);
      const btVector3			rayDir=(rayTo-rayFrom).normalized();
      const btVector3			N=(softDemo->getCameraTargetPosition()-softDemo->getCameraPosition()).normalized();
      const btScalar			O=btDot(softDemo->m_impact,N);
      const btScalar			den=btDot(N,rayDir);
      if((den*den)>0)
        {
          const btScalar			num=O-btDot(N,rayFrom);
          const btScalar			hit=num/den;
          if((hit>0)&&(hit<1500))
            {				
              softDemo->m_goal=rayFrom+rayDir*hit;
            }				
        }		
      btVector3				delta=softDemo->m_goal-softDemo->m_node->m_x;
      static const btScalar	maxdrag=10;
      if(delta.length2()>(maxdrag*maxdrag))
        {
          delta=delta.normalized()*maxdrag;
        }
      softDemo->m_node->m_v+=delta/timeStep;
    }

}

std::vector<btSoftBody*> muscleBodys;

void musclePreTickCallback (btDynamicsWorld *world, btScalar timeStep)
{
  static float timer;
  timer += timeStep;
  for(int i = 0; i < muscleBodys.size(); i++)
    {
      muscleBodys[i]->m_pose.m_volume = 8 + 4*sinf(timer);
    }
}

void SoftDemo::displayCallback(void) {

  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); 


  renderme();

  glFlush();
  swapBuffers();
}


//
// ImplicitShape
//

//
struct	ImplicitSphere : btSoftBody::ImplicitFn
{
  btVector3	center;
  btScalar	sqradius;
  ImplicitSphere() {}
  ImplicitSphere(const btVector3& c,btScalar r) : center(c),sqradius(r*r) {}
  btScalar	Eval(const btVector3& x)
  {
    return((x-center).length2()-sqradius);
  }
};

static btSoftBody* OpenMeshCube(SoftDemo* pdemo, float divisions)
{
  MeshTools testCube;
  testCube.ctor_cube();
  if(divisions) testCube.subdivide(divisions);

  std::vector<float> verts = testCube.getVertices();
  std::vector<std::array<int, 3>> faces = testCube.getFaces();

  Real* gVerticesCube = (Real*) &verts[0];
  
  int (*gIndicesCube)[3] = (int(*)[3]) new int[faces.size()*3];

  //read the faces into the array
  for(int i = 0; i < faces.size(); i++)
    {
      for(int j = 0; j < 3; j++)
        {
          gIndicesCube[i][j] = faces[i][j];
        }
    }

  btSoftBody* psb=btSoftBodyHelpers::CreateFromTriMesh( pdemo->m_softBodyWorldInfo, gVerticesCube, &gIndicesCube[0][0], faces.size());

  delete [](int*)gIndicesCube;

  return psb;
}


static std::vector<std::pair<int, int>>* OpenMeshCubeJoints(float divisions)
{
  MeshTools testCube;
  testCube.ctor_cube();
  if(divisions) testCube.subdivide(divisions);

  std::vector<std::pair<int, int>>* joints = testCube.findVertJoints();

  return joints;
}

static void Init_TestRobot(SoftDemo* psim)
{
  //set up simulation params
  psim->m_autocam = true;
  
  int numCubes = 2;
  float divisions = 0.5;
  btSoftBody* pcubes [numCubes];
  for(int i = 0; i < numCubes; i++)
    {
      pcubes[i] = OpenMeshCube(psim, divisions);
	
      pcubes[i]->generateClusters(64);
      pcubes[i]->getCollisionShape()->setMargin(0.01);

      pcubes[i]->m_materials[0]->m_kLST	=	0.15;
      pcubes[i]->m_cfg.kVC		=	100;
      pcubes[i]->m_cfg.kDP	     	=	0.01;
      pcubes[i]->m_cfg.kMT	     	=	0;
      pcubes[i]->setTotalMass(50,true);
      pcubes[i]->setPose(true,true); 

      pcubes[i]->m_cfg.piterations  =       10;
      pcubes[i]->m_cfg.collisions   =       btSoftBody::fCollision::CL_SS+
        btSoftBody::fCollision::CL_RS;
      pcubes[i]->randomizeConstraints();

      muscleBodys.push_back(pcubes[i]);

      pcubes[i]->translate(btVector3(2*i, 0, 0));
      psim->getSoftDynamicsWorld()->addSoftBody(pcubes[i]);
    }

  std::vector<std::pair<int, int>>* joints = OpenMeshCubeJoints(divisions); //

  for(int i = 0; i < joints[0].size(); i++)
    {  
      VertexJoint* vj = new(btAlignedAlloc(sizeof(VertexJoint),16)) VertexJoint();
      vj->addVertex(pcubes[0], joints[0][i].first);
      vj->addVertex(pcubes[1], joints[0][i].second);
      pcubes[0]->m_joints.push_back(vj);
    }

  delete[] joints;
}

//
// Custom Cube
//You need to call setPose(...,true) only when you want to use shape matching (kMT), and setPose(true,...) when you want to use pressure forces (kPR) and/or volume conservation forces (kVC).
static void Init_CustomCube(SoftDemo* pdemo)
{
  /*
  btSoftBody* psb1 = OpenMeshCube(pdemo);
  psb1->translate(btVector3(0,0,0));
  psb1->m_cfg.piterations=1;
	
  psb1->generateClusters(4);
  psb1->getCollisionShape()->setMargin(0.01);


  psb1->m_materials[0]->m_kLST	=	0.15;
  psb1->m_cfg.kVC			=	100;
  psb1->m_cfg.kMT			=	0.25;
  psb1->setTotalMass(50,true);
  psb1->setPose(true,true); //try to return to the 'lowest
  //energy state'

  //psb1->m_pose.m_volume -= 20.5;
  //psb1->m_cfg.kPR = 2000;
  pdemo->getSoftDynamicsWorld()->addSoftBody(psb1);
  */  
  /*
  btSoftBody* psb15 = OpenMeshCube(pdemo);
  psb15->translate(btVector3(0,0,0));
  psb15->m_cfg.piterations=1;
	
  psb15->generateClusters(4);
  psb15->getCollisionShape()->setMargin(0.01);


  psb15->m_materials[0]->m_kLST	=	0.15;
  psb15->m_cfg.kVC			=	100;
  psb15->m_cfg.kMT			=	0.25;
  psb15->setTotalMass(50,true);
  psb15->setPose(true,true); //try to return to the 'lowest
  //energy state'

  psb15->m_pose.m_volume = 2.5;
  //psb1->m_cfg.kPR = 2000;
  pdemo->getSoftDynamicsWorld()->addSoftBody(psb15);

  //testing joint stuff
  VertexJoint* vj = new(btAlignedAlloc(sizeof(VertexJoint),16)) VertexJoint();
  vj->addVertex(psb1, 0);
  vj->addVertex(psb15, 0);
  psb15->m_joints.push_back(vj);


  
  btSoftBody* psb2=OpenMeshCube(pdemo);
  psb2->translate(btVector3(1,0,0));
  psb2->m_cfg.piterations=1;
	
  psb2->generateClusters(4);
  psb2->getCollisionShape()->setMargin(0.01);


  psb2->m_materials[0]->m_kLST	=	0.15;
  psb2->m_cfg.kVC	       	=	100;
  psb2->setTotalMass(50,true);
  psb2->setPose(true,true); //try to return to the 'lowest
  //energy state'

  //psb2->m_pose.m_volume += 20.5;

  pdemo->getSoftDynamicsWorld()->addSoftBody(psb2);



      
  btSoftBody* psb3 = OpenMeshCube(pdemo);
  psb3->translate(btVector3(2,0,0));
  psb3->m_cfg.piterations=1;
	
  psb3->generateClusters(4);
  psb3->getCollisionShape()->setMargin(0.01);


  psb3->m_materials[0]->m_kLST	=	0.15;
  psb3->m_cfg.kVC			=	100;
  psb3->m_cfg.kMT			=	0;
  psb3->setTotalMass(50,true);
  psb3->setPose(true,true); //try to return to the 'lowest
  //energy state'

  //psb1->m_pose.m_volume -= 20.5;
  psb3->m_cfg.kPR = 2000;
  pdemo->getSoftDynamicsWorld()->addSoftBody(psb3);
  


  btSoftBody* psb4 = OpenMeshCube(pdemo);
  psb4->translate(btVector3(8,0,0));
  psb4->m_cfg.piterations=1;
	
  psb4->generateClusters(4);
  psb4->getCollisionShape()->setMargin(0.01);


  psb4->m_materials[0]->m_kLST	=	0.15;
  psb4->m_cfg.kVC			=	100;
  psb4->m_cfg.kMT			=	0;
  psb4->setTotalMass(50,true);
  psb4->setPose(true,true); //try to return to the 'lowest
  //energy state'
  psb4->m_pose.m_volume = .5;

  pdemo->getSoftDynamicsWorld()->addSoftBody(psb4);



  btSoftBody* psb5 = OpenMeshCube(pdemo);
  psb5->translate(btVector3(10,0,0));
  psb5->m_cfg.piterations=1;
	
  psb5->generateClusters(4);
  psb5->getCollisionShape()->setMargin(0.01);

  psb5->m_materials[0]->m_kLST	=	0.15;
  psb5->m_cfg.kVC			=	100;
  psb5->m_cfg.kMT			=	0;
  psb5->setTotalMass(50,true);
  psb5->setPose(true,true); //try to return to the 'lowest
  //energy state'

  pdemo->getSoftDynamicsWorld()->addSoftBody(psb5);


  //testmuscle
  btSoftBody* psb6 = OpenMeshCube(pdemo);
  psb6->translate(btVector3(13,0,0));
  psb6->m_cfg.piterations=1;
	
  psb6->generateClusters(4);
  psb6->getCollisionShape()->setMargin(0.01);

  psb6->m_materials[0]->m_kLST	=	0.15;
  psb6->m_cfg.kVC			=	100;
  psb6->m_cfg.kMT			=	0;
  psb6->setTotalMass(50,true);
  psb6->setPose(true,true); //try to return to the 'lowest
  //energy state

  muscleBodys.push_back(psb6);
  pdemo->getSoftDynamicsWorld()->addSoftBody(psb6);
  */
  pdemo->m_autocam=true;
}


/* Init		*/ 
void (*demofncs[])(SoftDemo*)=
{
  Init_TestRobot
};

void	SoftDemo::clientResetScene()
{
  m_azi = 0;
  m_cameraDistance = 30.f;
  m_cameraTargetPosition.setValue(0,0,0);

  DemoApplication::clientResetScene();
  /* Clean up	*/ 
  for(int i=m_dynamicsWorld->getNumCollisionObjects()-1;i>=0;i--)
    {
      btCollisionObject*	obj=m_dynamicsWorld->getCollisionObjectArray()[i];
      btRigidBody*		body=btRigidBody::upcast(obj);
      if(body&&body->getMotionState())
        {
          delete body->getMotionState();
        }
      while(m_dynamicsWorld->getNumConstraints())
        {
          btTypedConstraint*	pc=m_dynamicsWorld->getConstraint(0);
          m_dynamicsWorld->removeConstraint(pc);
          delete pc;
        }
      btSoftBody* softBody = btSoftBody::upcast(obj);
      if (softBody)
        {
          getSoftDynamicsWorld()->removeSoftBody(softBody);
        } else
        {
          btRigidBody* body = btRigidBody::upcast(obj);
          if (body)
            m_dynamicsWorld->removeRigidBody(body);
          else
            m_dynamicsWorld->removeCollisionObject(obj);
        }
      delete obj;
    }


  //create ground object
  btTransform tr;
  tr.setIdentity();
  tr.setOrigin(btVector3(0,-12,0));

  btCollisionObject* newOb = new btCollisionObject();
  newOb->setWorldTransform(tr);
  newOb->setInterpolationWorldTransform( tr);
  int lastDemo = (sizeof(demofncs)/sizeof(demofncs[0]))-1;

  if (current_demo<0)
    current_demo = lastDemo;
  if (current_demo > lastDemo)
    current_demo =0;
		

  if (current_demo>19)
    {
      newOb->setCollisionShape(m_collisionShapes[0]);
    } else
    {
      newOb->setCollisionShape(m_collisionShapes[1]);
    }

  m_dynamicsWorld->addCollisionObject(newOb);

  m_softBodyWorldInfo.m_sparsesdf.Reset();


  m_softBodyWorldInfo.air_density		=	(btScalar)1.2;
  m_softBodyWorldInfo.water_density	        =	0;
  m_softBodyWorldInfo.water_offset		=	0;
  m_softBodyWorldInfo.water_normal		=	btVector3(0,0,0);
  m_softBodyWorldInfo.m_gravity.setValue(0,-10,0);


  m_autocam						=	false;
  m_raycast						=	false;
  m_cutting						=	false;
  m_results.fraction				=	1.f;
  demofncs[current_demo](this);
}


void SoftDemo::clientMoveAndDisplay()
{
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT|GL_STENCIL_BUFFER_BIT); 




  float ms = getDeltaTimeMicroseconds();
  float dt = ms / 1000000.f;//1.0/60.;	



  if (m_dynamicsWorld)
    {
		
      if (sDemoMode)
        {
          static float demoCounter = DEMO_MODE_TIMEOUT;
          demoCounter-= dt;
          if (demoCounter<0)
            {
				
              demoCounter=DEMO_MODE_TIMEOUT;
              current_demo++;
              current_demo=current_demo%(sizeof(demofncs)/sizeof(demofncs[0]));
              clientResetScene();
            }
        }
		

      //#define FIXED_STEP
#ifdef FIXED_STEP
      m_dynamicsWorld->stepSimulation(dt=1.0f/60.f,0);

#else
      //during idle mode, just run 1 simulation step maximum, otherwise 4 at max
      //	int maxSimSubSteps = m_idle ? 1 : 4;
      //if (m_idle)
      //	dt = 1.0/420.f;

      int numSimSteps;
      numSimSteps = m_dynamicsWorld->stepSimulation(dt);
      //numSimSteps = m_dynamicsWorld->stepSimulation(dt,10,1./240.f);

#ifdef VERBOSE_TIMESTEPPING_CONSOLEOUTPUT
      if (!numSimSteps)
        printf("Interpolated transforms\n");
      else
        {
          if (numSimSteps > maxSimSubSteps)
            {
              //detect dropping frames
              printf("Dropped (%i) simulation steps out of %i\n",numSimSteps - maxSimSubSteps,numSimSteps);
            } else
            {
              printf("Simulated (%i) steps\n",numSimSteps);
            }
        }
#endif //VERBOSE_TIMESTEPPING_CONSOLEOUTPUT

#endif		

#ifdef USE_AMD_OPENCL
      if (g_openCLSIMDSolver)
        g_openCLSIMDSolver->copyBackToSoftBodies();
#endif //USE_AMD_OPENCL

      if(m_drag)
        {
          m_node->m_v*=0;
        }

      m_softBodyWorldInfo.m_sparsesdf.GarbageCollect();

      //optional but useful: debug drawing

    }

#ifdef USE_QUICKPROF 
  btProfiler::beginBlock("render"); 
#endif //USE_QUICKPROF 

  renderme(); 

  //render the graphics objects, with center of mass shift

  updateCamera();



#ifdef USE_QUICKPROF 
  btProfiler::endBlock("render"); 
#endif 
  glFlush();
  //some additional debugging info
#ifdef PRINT_CONTACT_STATISTICS
  printf("num manifolds: %i\n",gNumManifold);
  printf("num gOverlappingPairs: %i\n",gOverlappingPairs);
	
#endif //PRINT_CONTACT_STATISTICS


  swapBuffers();

}



void	SoftDemo::renderme()
{
  btIDebugDraw*	idraw=m_dynamicsWorld->getDebugDrawer();

  glDisable(GL_TEXTURE_2D);
  glDisable(GL_LIGHTING);
  m_dynamicsWorld->debugDrawWorld();

  //int debugMode = m_dynamicsWorld->getDebugDrawer()? m_dynamicsWorld->getDebugDrawer()->getDebugMode() : -1;

  btSoftRigidDynamicsWorld* softWorld = (btSoftRigidDynamicsWorld*)m_dynamicsWorld;
  //btIDebugDraw*	sdraw = softWorld ->getDebugDrawer();


  for (  int i=0;i<softWorld->getSoftBodyArray().size();i++)
    {
      btSoftBody*	psb=(btSoftBody*)softWorld->getSoftBodyArray()[i];
      if (softWorld->getDebugDrawer() && !(softWorld->getDebugDrawer()->getDebugMode() & (btIDebugDraw::DBG_DrawWireframe)))
        {
          btSoftBodyHelpers::DrawFrame(psb,softWorld->getDebugDrawer());
          btSoftBodyHelpers::Draw(psb,softWorld->getDebugDrawer(),softWorld->getDrawFlags());
        }
    }

  /* Bodies		*/ 
  btVector3	ps(0,0,0);
  int			nps=0;

  btSoftBodyArray&	sbs=getSoftDynamicsWorld()->getSoftBodyArray();
  for(int ib=0;ib<sbs.size();++ib)
    {
      btSoftBody*	psb=sbs[ib];
      nps+=psb->m_nodes.size();
      for(int i=0;i<psb->m_nodes.size();++i)
        {
          ps+=psb->m_nodes[i].m_x;
        }		
    }
  ps/=nps;
  if(m_autocam)
    m_cameraTargetPosition+=(ps-m_cameraTargetPosition)*0.05;
  /* Anm			*/ 
  if(!isIdle())
    m_animtime=m_clock.getTimeMilliseconds()/1000.f;
  /* Ray cast		*/ 
  if(m_raycast)
    {		
      /* Prepare rays	*/ 
      const int		res=64;
      const btScalar	fres=res-1;
      const btScalar	size=8;
      const btScalar	dist=10;
      btTransform		trs;
      trs.setOrigin(ps);
      btScalar rayLength = 1000.f;

      const btScalar	angle=m_animtime*0.2;
      trs.setRotation(btQuaternion(angle,SIMD_PI/4,0));
      btVector3	dir=trs.getBasis()*btVector3(0,-1,0);
      trs.setOrigin(ps-dir*dist);
      btAlignedObjectArray<btVector3>	origins;
      btAlignedObjectArray<btScalar>	fractions;
      origins.resize(res*res);
      fractions.resize(res*res,1.f);
      for(int y=0;y<res;++y)
        {
          for(int x=0;x<res;++x)
            {
              const int	idx=y*res+x;
              origins[idx]=trs*btVector3(-size+size*2*x/fres,dist,-size+size*2*y/fres);
            }
        }
      /* Cast rays	*/ 		
      {
        m_clock.reset();
        if (sbs.size())
          {
            btVector3*		org=&origins[0];
            btScalar*				fraction=&fractions[0];
            btSoftBody**			psbs=&sbs[0];
            btSoftBody::sRayCast	results;
            for(int i=0,ni=origins.size(),nb=sbs.size();i<ni;++i)
              {
                for(int ib=0;ib<nb;++ib)
                  {
                    btVector3 rayFrom = *org;
                    btVector3 rayTo = rayFrom+dir*rayLength;
                    if(psbs[ib]->rayTest(rayFrom,rayTo,results))
                      {
                        *fraction=results.fraction;
                      }
                  }
                ++org;++fraction;
              }
            long	ms=btMax<long>(m_clock.getTimeMilliseconds(),1);
            long	rayperseconds=(1000*(origins.size()*sbs.size()))/ms;
            printf("%d ms (%d rays/s)\r\n",int(ms),int(rayperseconds));
          }
      }
      /* Draw rays	*/ 
      const btVector3	c[]={	origins[0],
                                origins[res-1],
                                origins[res*(res-1)],
                                origins[res*(res-1)+res-1]};
      idraw->drawLine(c[0],c[1],btVector3(0,0,0));
      idraw->drawLine(c[1],c[3],btVector3(0,0,0));
      idraw->drawLine(c[3],c[2],btVector3(0,0,0));
      idraw->drawLine(c[2],c[0],btVector3(0,0,0));
      for(int i=0,ni=origins.size();i<ni;++i)
        {
          const btScalar		fraction=fractions[i];
          const btVector3&	org=origins[i];
          if(fraction<1.f)
            {
              idraw->drawLine(org,org+dir*rayLength*fraction,btVector3(1,0,0));
            }
          else
            {
              idraw->drawLine(org,org-dir*rayLength*0.1,btVector3(0,0,0));
            }
        }
#undef RES
    }
  /* Water level	*/ 
  static const btVector3	axis[]={btVector3(1,0,0),
                                        btVector3(0,1,0),
                                        btVector3(0,0,1)};
  if(m_softBodyWorldInfo.water_density>0)
    {
      const btVector3	c=	btVector3((btScalar)0.25,(btScalar)0.25,1);
      const btScalar	a=	(btScalar)0.5;
      const btVector3	n=	m_softBodyWorldInfo.water_normal;
      const btVector3	o=	-n*m_softBodyWorldInfo.water_offset;
      const btVector3	x=	btCross(n,axis[n.minAxis()]).normalized();
      const btVector3	y=	btCross(x,n).normalized();
      const btScalar	s=	25;
      idraw->drawTriangle(o-x*s-y*s,o+x*s-y*s,o+x*s+y*s,c,a);
      idraw->drawTriangle(o-x*s-y*s,o+x*s+y*s,o-x*s+y*s,c,a);
    }
  //

  int lineWidth=280;
  int xStart = m_glutScreenWidth - lineWidth;
  int yStart = 20;

  if((getDebugMode() & btIDebugDraw::DBG_NoHelpText)==0)
    {
      setOrthographicProjection();
      glDisable(GL_LIGHTING);
      glColor3f(0, 0, 0);
      char buf[124];
		
      glRasterPos3f(xStart, yStart, 0);
      if (sDemoMode)
        {		
          sprintf(buf,"d to toggle demo mode (on)");
        } else
        {
          sprintf(buf,"d to toggle demo mode (off)");
        }
      GLDebugDrawString(xStart,20,buf);
      glRasterPos3f(xStart, yStart, 0);
      sprintf(buf,"] for next demo (%d)",current_demo);
      yStart+=20;
      GLDebugDrawString(xStart,yStart,buf);
      glRasterPos3f(xStart, yStart, 0);
      sprintf(buf,"c to visualize clusters");
      yStart+=20;
      GLDebugDrawString(xStart,yStart,buf);
      glRasterPos3f(xStart, yStart, 0);
      sprintf(buf,"; to toggle camera mode");
      yStart+=20;
      GLDebugDrawString(xStart,yStart,buf);
      glRasterPos3f(xStart, yStart, 0);
      sprintf(buf,"n,m,l,k for power and steering");
      yStart+=20;
      GLDebugDrawString(xStart,yStart,buf);


      resetPerspectiveProjection();
      glEnable(GL_LIGHTING);
    }

  DemoApplication::renderme();

}

void	SoftDemo::setDrawClusters(bool drawClusters)
{
  if (drawClusters)
    {
      getSoftDynamicsWorld()->setDrawFlags(getSoftDynamicsWorld()->getDrawFlags()|fDrawFlags::Clusters);
    } else
    {
      getSoftDynamicsWorld()->setDrawFlags(getSoftDynamicsWorld()->getDrawFlags()& (~fDrawFlags::Clusters));
    }
}



void	SoftDemo::keyboardCallback(unsigned char key, int x, int y)
{
  switch(key)
    {
    case    'd':	sDemoMode = !sDemoMode; break;
    case	']':	++current_demo;clientResetScene();break;
    case	'[':	--current_demo;clientResetScene();break;
    case	',':	m_raycast=!m_raycast;break;
    case	';':	m_autocam=!m_autocam;break;
    case	'c':	getSoftDynamicsWorld()->setDrawFlags(getSoftDynamicsWorld()->getDrawFlags()^fDrawFlags::Clusters);break;
    case	'`':
      {
        btSoftBodyArray&	sbs=getSoftDynamicsWorld()->getSoftBodyArray();
        for(int ib=0;ib<sbs.size();++ib)
          {
            btSoftBody*	psb=sbs[ib];
            psb->staticSolve(128);
          }
      }
      break;
    default:		DemoApplication::keyboardCallback(key,x,y);
    }
}

//
void	SoftDemo::mouseMotionFunc(int x,int y)
{
  if(m_node&&(m_results.fraction<1.f))
    {
      if(!m_drag)
        {
#define SQ(_x_) (_x_)*(_x_)
          if((SQ(x-m_lastmousepos[0])+SQ(y-m_lastmousepos[1]))>6)
            {
              m_drag=true;
            }
#undef SQ
        }
      if(m_drag)
        {
          m_lastmousepos[0]	=	x;
          m_lastmousepos[1]	=	y;		
        }
    }
  else
    {
      DemoApplication::mouseMotionFunc(x,y);
    }
}

//
void	SoftDemo::mouseFunc(int button, int state, int x, int y)
{
  if(button==0)
    {
      switch(state)
        {
        case	0:
          {
            m_results.fraction=1.f;
            DemoApplication::mouseFunc(button,state,x,y);
            if(!m_pickConstraint)
              {
                const btVector3			rayFrom=m_cameraPosition;
                const btVector3			rayTo=getRayTo(x,y);
                const btVector3			rayDir=(rayTo-rayFrom).normalized();
                btSoftBodyArray&		sbs=getSoftDynamicsWorld()->getSoftBodyArray();
                for(int ib=0;ib<sbs.size();++ib)
                  {
                    btSoftBody*				psb=sbs[ib];
                    btSoftBody::sRayCast	res;
                    if(psb->rayTest(rayFrom,rayTo,res))
                      {
                        m_results=res;
                      }
                  }
                if(m_results.fraction<1.f)
                  {				
                    m_impact			=	rayFrom+(rayTo-rayFrom)*m_results.fraction;
                    m_drag				=	m_cutting ? false : true;
                    m_lastmousepos[0]	=	x;
                    m_lastmousepos[1]	=	y;
                    m_node				=	0;
                    switch(m_results.feature)
                      {
                      case btSoftBody::eFeature::Tetra:
                        {
                          btSoftBody::Tetra&	tet=m_results.body->m_tetras[m_results.index];
                          m_node=tet.m_n[0];
                          for(int i=1;i<4;++i)
                            {
                              if(	(m_node->m_x-m_impact).length2()>
                                        (tet.m_n[i]->m_x-m_impact).length2())
                                {
                                  m_node=tet.m_n[i];
                                }
                            }
                          break;
                        }
                      case	btSoftBody::eFeature::Face:
                        {
                          btSoftBody::Face&	f=m_results.body->m_faces[m_results.index];
                          m_node=f.m_n[0];
                          for(int i=1;i<3;++i)
                            {
                              if(	(m_node->m_x-m_impact).length2()>
                                        (f.m_n[i]->m_x-m_impact).length2())
                                {
                                  m_node=f.m_n[i];
                                }
                            }
                        }
                        break;
                      }
                    if(m_node) m_goal=m_node->m_x;
                    return;
                  }
              }
          }
          break;
        case	1:
          if((!m_drag)&&m_cutting&&(m_results.fraction<1.f))
            {
              ImplicitSphere	isphere(m_impact,1);
              printf("Mass before: %f\r\n",m_results.body->getTotalMass());
              m_results.body->refine(&isphere,0.0001,true);
              printf("Mass after: %f\r\n",m_results.body->getTotalMass());
            }
          m_results.fraction=1.f;
          m_drag=false;
          DemoApplication::mouseFunc(button,state,x,y);
          break;
        }
    }
  else
    {
      DemoApplication::mouseFunc(button,state,x,y);
    }
}

void	SoftDemo::initPhysics()
{
  ///create concave ground mesh

	
  m_azi = 0;

  btCollisionShape* groundShape = 0;
  {
    int i;
    int j;

    const int NUM_VERTS_X = 30;
    const int NUM_VERTS_Y = 30;
    const int totalVerts = NUM_VERTS_X*NUM_VERTS_Y;
    const int totalTriangles = 2*(NUM_VERTS_X-1)*(NUM_VERTS_Y-1);

    gGroundVertices = new btVector3[totalVerts];
    gGroundIndices = new int[totalTriangles*3];

    btScalar offset(-50);

    for ( i=0;i<NUM_VERTS_X;i++)
      {
        for (j=0;j<NUM_VERTS_Y;j++)
          {
            gGroundVertices[i+j*NUM_VERTS_X].setValue((i-NUM_VERTS_X*0.5f)*TRIANGLE_SIZE,
                                                      //0.f,
                                                      waveheight*sinf((float)i)*cosf((float)j+offset),
                                                      (j-NUM_VERTS_Y*0.5f)*TRIANGLE_SIZE);
          }
      }

    int vertStride = sizeof(btVector3);
    int indexStride = 3*sizeof(int);

    int index=0;
    for ( i=0;i<NUM_VERTS_X-1;i++)
      {
        for (int j=0;j<NUM_VERTS_Y-1;j++)
          {
            gGroundIndices[index++] = j*NUM_VERTS_X+i;
            gGroundIndices[index++] = j*NUM_VERTS_X+i+1;
            gGroundIndices[index++] = (j+1)*NUM_VERTS_X+i+1;

            gGroundIndices[index++] = j*NUM_VERTS_X+i;
            gGroundIndices[index++] = (j+1)*NUM_VERTS_X+i+1;
            gGroundIndices[index++] = (j+1)*NUM_VERTS_X+i;
          }
      }

    btTriangleIndexVertexArray* indexVertexArrays = new btTriangleIndexVertexArray(totalTriangles,
                                                                                   gGroundIndices,
                                                                                   indexStride,
                                                                                   totalVerts,(btScalar*) &gGroundVertices[0].x(),vertStride);

    bool useQuantizedAabbCompression = true;

    groundShape = new btBvhTriangleMeshShape(indexVertexArrays,useQuantizedAabbCompression);
    groundShape->setMargin(0.5);
  }

  m_collisionShapes.push_back(groundShape);

  btCollisionShape* groundBox = new btBoxShape (btVector3(100,CUBE_HALF_EXTENTS,100));
  m_collisionShapes.push_back(groundBox);

  btCompoundShape* cylinderCompound = new btCompoundShape;
  btCollisionShape* cylinderShape = new btCylinderShape (btVector3(CUBE_HALF_EXTENTS,CUBE_HALF_EXTENTS,CUBE_HALF_EXTENTS));
  btTransform localTransform;
  localTransform.setIdentity();
  cylinderCompound->addChildShape(localTransform,cylinderShape);
  btQuaternion orn(btVector3(0,1,0),SIMD_PI);
  localTransform.setRotation(orn);
  cylinderCompound->addChildShape(localTransform,cylinderShape);

  m_collisionShapes.push_back(cylinderCompound);


  m_dispatcher=0;

  ///register some softbody collision algorithms on top of the default btDefaultCollisionConfiguration
  m_collisionConfiguration = new btSoftBodyRigidBodyCollisionConfiguration();


  m_dispatcher = new	btCollisionDispatcher(m_collisionConfiguration);
  m_softBodyWorldInfo.m_dispatcher = m_dispatcher;

  ////////////////////////////
  ///Register softbody versus softbody collision algorithm


  ///Register softbody versus rigidbody collision algorithm


  ////////////////////////////

  btVector3 worldAabbMin(-1000,-1000,-1000);
  btVector3 worldAabbMax(1000,1000,1000);

  m_broadphase = new btAxisSweep3(worldAabbMin,worldAabbMax,maxProxies);

  m_softBodyWorldInfo.m_broadphase = m_broadphase;

  btSequentialImpulseConstraintSolver* solver = new btSequentialImpulseConstraintSolver();

  m_solver = solver;

  btSoftBodySolver* softBodySolver = 0;
#ifdef USE_AMD_OPENCL

  static bool once = true;
  if (once)
    {
      once=false;
      initCL(0,0);
    }

  if( g_openCLSIMDSolver  )
    delete g_openCLSIMDSolver;
  if( g_softBodyOutput )
    delete g_softBodyOutput;

  if (1)
    {
      g_openCLSIMDSolver = new btOpenCLSoftBodySolverSIMDAware( g_cqCommandQue, g_cxMainContext);
      //	g_openCLSIMDSolver = new btOpenCLSoftBodySolver( g_cqCommandQue, g_cxMainContext);
      g_openCLSIMDSolver->setCLFunctions(new CachingCLFunctions(g_cqCommandQue, g_cxMainContext));
    }	



  softBodySolver = g_openCLSIMDSolver;
  g_softBodyOutput = new btSoftBodySolverOutputCLtoCPU;
#endif //USE_AMD_OPENCL

  btDiscreteDynamicsWorld* world = new btSoftRigidDynamicsWorld(m_dispatcher,m_broadphase,m_solver,m_collisionConfiguration,softBodySolver);
  m_dynamicsWorld = world;
  
  preTickCallbackHandler.addCallback(pickingPreTickCallback);
  preTickCallbackHandler.addCallback(musclePreTickCallback);

  m_dynamicsWorld->setInternalTickCallback(preTickCallbackHandler.runCallbacks,this,true);//pretick


  m_dynamicsWorld->getDispatchInfo().m_enableSPU = true;
  m_dynamicsWorld->setGravity(btVector3(0,-10,0));
  m_softBodyWorldInfo.m_gravity.setValue(0,-10,0);

  //	clientResetScene();

  m_softBodyWorldInfo.m_sparsesdf.Initialize();
  clientResetScene();
}






void	SoftDemo::exitPhysics()
{

  //cleanup in the reverse order of creation/initialization

  //remove the rigidbodies from the dynamics world and delete them
  int i;
  for (i=m_dynamicsWorld->getNumCollisionObjects()-1; i>=0 ;i--)
    {
      btCollisionObject* obj = m_dynamicsWorld->getCollisionObjectArray()[i];
      btRigidBody* body = btRigidBody::upcast(obj);
      if (body && body->getMotionState())
        {
          delete body->getMotionState();
        }
      m_dynamicsWorld->removeCollisionObject( obj );
      delete obj;
    }

  //delete collision shapes
  for (int j=0;j<m_collisionShapes.size();j++)
    {
      btCollisionShape* shape = m_collisionShapes[j];
      m_collisionShapes[j] = 0;
      delete shape;
    }

  //delete dynamics world
  delete m_dynamicsWorld;

  //delete solver
  delete m_solver;

  //delete broadphase
  delete m_broadphase;

  //delete dispatcher
  delete m_dispatcher;



  delete m_collisionConfiguration;


}

