#ifndef MESHTOOLS_H
#define MESHTOOLS_H

#include <iostream>
// -------------------- OpenMesh
#include <OpenMesh/Core/IO/MeshIO.hh>
#include <OpenMesh/Core/Mesh/PolyMesh_ArrayKernelT.hh>
#include <OpenMesh/Core/Mesh/PolyConnectivity.hh>
#include <OpenMesh/Tools/Subdivider/Uniform/CompositeLoopT.hh>

typedef OpenMesh::PolyMesh_ArrayKernelT<> MeshT;

class MeshTools {
 public:
  static MeshT ctor_cube();
  static MeshT subdivide(MeshT); 
};

#endif
