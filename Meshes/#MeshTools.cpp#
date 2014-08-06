#include "MeshTools.h"

std::vector<float> MeshTools::getVertices()
{
  std::vector<float> verts;

  for (MeshT::VertexIter v_it = mesh.vertices_sbegin(); v_it != mesh.vertices_end(); ++v_it)
    {
      verts.push_back(mesh.point(*v_it)[0]);
      verts.push_back(mesh.point(*v_it)[1]);
      verts.push_back(mesh.point(*v_it)[2]);
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

MeshT MeshTools::subdivide(float maxEdgeLen)
{
  // Initialize subdivider
  
  OpenMesh::Subdivider::Uniform::LongestEdgeT<MeshT> subdivider;
  subdivider.set_max_edge_length(maxEdgeLen);

  // Execute subdivision
  subdivider.attach(mesh);
  subdivider(0);
  subdivider.detach();
  
  return mesh;
}

std::vector<std::pair<int, int>>* MeshTools::findVertJoints()
{
  //assumption: mesh is aligned with axes and centered at the origin. Find extents:
  float maxX = 0, maxY = 0, maxZ = 0;
  std::vector<std::pair<int, int>>* vertPairs = new std::vector<std::pair<int, int>>[3];

  for (MeshT::VertexIter v_it = mesh.vertices_sbegin(); v_it != mesh.vertices_end(); ++v_it)
    {
      maxX = mesh.point(*v_it)[0] > maxX ? mesh.point(*v_it)[0] : maxX;
      maxY = mesh.point(*v_it)[1] > maxY ? mesh.point(*v_it)[1] : maxY;
      maxZ = mesh.point(*v_it)[2] > maxZ ? mesh.point(*v_it)[2] : maxZ;
    }
  
  int v_itCnt = 0;
  for (MeshT::VertexIter v_it = mesh.vertices_sbegin(); v_it != mesh.vertices_end(); ++v_it)
    {
      int v_itCnt2 = 0;
      for (MeshT::VertexIter v_it2 = mesh.vertices_sbegin(); v_it2 != mesh.vertices_end(); ++v_it2)
        {
          //shift on x
          if(
             mesh.point(*v_it)[0] == mesh.point(*v_it2)[0] + maxX * 2
             && mesh.point(*v_it)[1] == mesh.point(*v_it2)[1]
             && mesh.point(*v_it)[2] == mesh.point(*v_it2)[2]
             ) vertPairs[0].push_back(std::pair<int, int>(v_itCnt, v_itCnt2));
          
          //shift on y
          if(
             mesh.point(*v_it)[0] == mesh.point(*v_it2)[0]
             && mesh.point(*v_it)[1] == mesh.point(*v_it2)[1] + maxY * 2
             && mesh.point(*v_it)[2] == mesh.point(*v_it2)[2]
             ) vertPairs[1].push_back(std::pair<int, int>(v_itCnt, v_itCnt2));

          //shift on z
          if(
             mesh.point(*v_it)[0] == mesh.point(*v_it2)[0]
             && mesh.point(*v_it)[1] == mesh.point(*v_it2)[1]
             && mesh.point(*v_it)[2] == mesh.point(*v_it2)[2] + maxZ * 2
             ) vertPairs[2].push_back(std::pair<int, int>(v_itCnt, v_itCnt2));


          v_itCnt2++;
        }
      v_itCnt++;
    }
  return vertPairs;
}
