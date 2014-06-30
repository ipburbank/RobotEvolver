all:
	g++ -o bin/Native/softapp.app -Ofast -I/usr/local/include/bullet -I/usr/local/lib -IMeshes/OpenMesh/OpenMesh/src \
	-lglut -lGL -lGLU \
	BulletDemoFiles/DemoApplication.cpp \
	BulletDemoFiles/GLDebugFont.cpp BulletDemoFiles/GlutDemoApplication.cpp BulletDemoFiles/GL_ShapeDrawer.cpp  \
	BulletDemoFiles/RenderTexture.cpp BulletDemoFiles/GLDebugDrawer.cpp \
	BulletDemoFiles/GlutStuff.cpp \
	BulletDemoFiles/GL_DialogDynamicsWorld.cpp BulletDemoFiles/GL_DialogWindow.cpp main.cpp SoftDemo.cpp BulletDemoFiles/stb_image.cpp \
	Meshes/MeshTools.cpp Meshes/OpenMesh/BuildNative/Build/lib/OpenMesh/libOpenMeshCored.a Meshes/OpenMesh/BuildNative/Build/lib/OpenMesh/libOpenMeshToolsd.a \
	/usr/local/lib/libBulletSoftBody.a /usr/local/lib/libBulletDynamics.a /usr/local/lib/libBulletCollision.a /usr/local/lib/libLinearMath.a

.PHONY: docs
docs:
	doxygen docs/Doxyfile
