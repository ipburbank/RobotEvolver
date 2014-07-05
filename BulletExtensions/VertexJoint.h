#ifndef VERTEX_JOINT_H
#define VERTEX_JOINT_H

#include "BulletSoftBody/btSoftBody.h"
#include <vector>

class VertexJoint: public btSoftBody::Joint {
 public:
  VertexJoint(){};
  
  void addVertex(btSoftBody* soft_body, size_t vertex_id);
  
  // ### Overriden from btSoftBody::Joint #####
  void Prepare(btScalar dt,int iterations){}; // I don't need this
  void Solve(btScalar dt, btScalar sor);
  void Terminate(btScalar dt){}; // I don't need this
  btSoftBody::Joint::eType::_ Type() const;
  // ##########################################

  ~VertexJoint(){};
 private:

  struct Attach
  {
    btSoftBody* soft_body;
    size_t vertex_id;
  };
  std::vector<Attach> m_attachments;

  bool initJoint(){}; //generating Attach

  btSoftBody* m_main_soft_body;
};

#endif
