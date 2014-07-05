#include "VertexJoint.h"

btSoftBody::Joint::eType::_ myJoint::Type() const{
   return btSoftBody::Joint::eType::Linear;
}

void myJoint::Solve(btScalar dt,btScalar sor){

   for(size_t i=0; i<this->attachments.size(); i++){
      
      Attach& at = this->attachments[i];
      
      const unsigned long *index = &this->main_soft_body->getTetraMeshData()->indices[at.attached_to_tetrahedra_id*4];

      const btVector3 &ta = this->main_soft_body->m_tetras[at.attached_to_tetrahedra_id].m_n[0]->m_x;
      const btVector3 &tb = this->main_soft_body->m_tetras[at.attached_to_tetrahedra_id].m_n[1]->m_x;
      const btVector3 &tc = this->main_soft_body->m_tetras[at.attached_to_tetrahedra_id].m_n[2]->m_x;
      const btVector3 &td = this->main_soft_body->m_tetras[at.attached_to_tetrahedra_id].m_n[3]->m_x;

      this->attached_soft_body->m_nodes[ at.attached_vertex_id ].m_q = Utils::TetrahedraBarycentricToWorld(at.barycentric_coordinates, ta, tb, tc, td);
      this->attached_soft_body->m_nodes[ at.attached_vertex_id ].m_v = btVector3(0,0,0);
      this->attached_soft_body->m_nodes[ at.attached_vertex_id ].m_f = btVector3(0,0,0);

   }
   
}
