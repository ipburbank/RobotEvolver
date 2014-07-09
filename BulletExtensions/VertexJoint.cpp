#include "VertexJoint.h"

void VertexJoint::addVertex(btSoftBody* soft_body, size_t vertex_id)
{
  Attach attachment;
  attachment.soft_body = soft_body;
  attachment.vertex_id = vertex_id;

  this->m_attachments.push_back(attachment);
}

btSoftBody::Joint::eType::_ VertexJoint::Type() const{
  return btSoftBody::Joint::eType::Linear;
}

void VertexJoint::Solve(btScalar dt,btScalar sor)
{
  // FIND THE CENTER POINT FOR THE VERTS
  btVector3 averagePosition = btVector3(0,0,0);
  
  for(size_t i=0; i<this->m_attachments.size(); i++)
    {
      Attach& at = this->m_attachments[i];
      
      averagePosition += at.soft_body->m_nodes[at.vertex_id].m_x;
    }
  averagePosition /= this->m_attachments.size();
  

  // MOVE EACH VERTEX TO THE AVERAGE POSITION
  for(size_t i=0; i<this->m_attachments.size(); i++)
    {
      Attach& at = this->m_attachments[i];
      
      at.soft_body->m_nodes[ at.vertex_id ].m_x = averagePosition; //set position
      at.soft_body->m_nodes[ at.vertex_id ].m_v = btVector3(0,0,0); //no veclocity
      at.soft_body->m_nodes[ at.vertex_id ].m_f = btVector3(0,0,0); //no force
    }
}
