#include "MeshTools.h"

std::vector<float> MeshTools::getVertices()
{
  std::vector<float> verts;

  for (MeshT::VertexIter v_it = mesh.vertices_sbegin(); v_it != mesh.vertices_end(); ++v_it)
    {
      verts.push_back(v_it->idx());
    }

  return verts;
}

std::vector<std::array<int, 3>> MeshTools::getFaces()
{
  std::vector<std::array<int, 3>> faces;

  // iterate over all faces
  for (MeshT::FaceIter f_it = mesh.faces_sbegin(); f_it != mesh.faces_end(); ++f_it)
    {
      // Get the face-vertex circulator of face _fh
      MeshT::FaceVertexIter fv_it=mesh.fv_iter (*f_it);

      //place to store the verts
      std::array<int, 3> verts;

      for(int i=0; i < 3; i++)
        {
          fv_it++;
          verts[i] = fv_it->idx();
        }

      //store the face in the vector
      faces.push_back(verts);
    }

  return faces;
}

MeshT MeshTools::ctor_cube()
{
  // generate vertices
  MeshT::VertexHandle vhandle[8];
  vhandle[0] = mesh.add_vertex(MeshT::Point(-1, -1,  1));
  vhandle[1] = mesh.add_vertex(MeshT::Point( 1, -1,  1));
  vhandle[2] = mesh.add_vertex(MeshT::Point( 1,  1,  1));
  vhandle[3] = mesh.add_vertex(MeshT::Point(-1,  1,  1));
  vhandle[4] = mesh.add_vertex(MeshT::Point(-1, -1, -1));
  vhandle[5] = mesh.add_vertex(MeshT::Point( 1, -1, -1));
  vhandle[6] = mesh.add_vertex(MeshT::Point( 1,  1, -1));
  vhandle[7] = mesh.add_vertex(MeshT::Point(-1,  1, -1));
  
  // generate (quadrilateral) faces
  std::vector<MeshT::VertexHandle> face_vhandles;
  
  face_vhandles.clear();
  face_vhandles.push_back(vhandle[0]);
  face_vhandles.push_back(vhandle[1]);
  face_vhandles.push_back(vhandle[2]);
  face_vhandles.push_back(vhandle[3]);
  mesh.add_face(face_vhandles);
  
  face_vhandles.clear();
  face_vhandles.push_back(vhandle[7]);
  face_vhandles.push_back(vhandle[6]);
  face_vhandles.push_back(vhandle[5]);
  face_vhandles.push_back(vhandle[4]);
  mesh.add_face(face_vhandles);
  
  face_vhandles.clear();
  face_vhandles.push_back(vhandle[1]);
  face_vhandles.push_back(vhandle[0]);
  face_vhandles.push_back(vhandle[4]);
  face_vhandles.push_back(vhandle[5]);
  mesh.add_face(face_vhandles);
  
  face_vhandles.clear();
  face_vhandles.push_back(vhandle[2]);
  face_vhandles.push_back(vhandle[1]);
  face_vhandles.push_back(vhandle[5]);
  face_vhandles.push_back(vhandle[6]);
  mesh.add_face(face_vhandles);
  
  face_vhandles.clear();
  face_vhandles.push_back(vhandle[3]);
  face_vhandles.push_back(vhandle[2]);
  face_vhandles.push_back(vhandle[6]);
  face_vhandles.push_back(vhandle[7]);
  mesh.add_face(face_vhandles);
  
  face_vhandles.clear();
  face_vhandles.push_back(vhandle[0]);
  face_vhandles.push_back(vhandle[3]);
  face_vhandles.push_back(vhandle[7]);
  face_vhandles.push_back(vhandle[4]);
  mesh.add_face(face_vhandles);
  
  return mesh;
}

MeshT MeshTools::subdivide(int divisions)
{
  // Initialize subdivider
  
  OpenMesh::Subdivider::Uniform::CatmullClarkT<MeshT> subdivider;
  
  // Execute subdivision
  subdivider.attach(mesh);
  subdivider( divisions );
  subdivider.detach();
  
  return mesh;
}
