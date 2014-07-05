#ifndef MESHTOOLS_H
#define MESHTOOLS_H

#include <iostream>
// -------------------- OpenMesh
#include <OpenMesh/Core/IO/MeshIO.hh>
#include <OpenMesh/Core/Mesh/TriMesh_ArrayKernelT.hh>
#include <OpenMesh/Core/Mesh/TriConnectivity.hh>

#include <OpenMesh/Tools/Subdivider/Uniform/LongestEdgeT.hh>
#include <OpenMesh/Tools/Subdivider/Uniform/LoopT.hh>
#include <OpenMesh/Tools/Subdivider/Uniform/Sqrt3T.hh>
#include <OpenMesh/Tools/Subdivider/Uniform/Composite/CompositeT.hh>
#include <OpenMesh/Tools/Subdivider/Uniform/CompositeLoopT.hh>
#include <OpenMesh/Tools/Subdivider/Uniform/CatmullClarkT.hh>

typedef OpenMesh::TriMesh_ArrayKernelT<> MeshT;

/**
   Mesh generation and modification tools.
*/
class MeshTools
{
MeshT mesh;

public:
MeshTools(){MeshT mesh;};
~MeshTools(){};

std::vector<float> getVertices();
std::vector<std::array<int, 3>> getFaces();

MeshT ctor_cube(); /** Make this mesh a cube */
MeshT subdivide(float maxEdgeLen); /** Subdivide this mesh */
};

#endif
