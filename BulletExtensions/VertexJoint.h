#ifndef VERTEX_JOINT_H
#define VERTEX_JOINT_H

class VertexJoint: public btSoftBody::Joint {
 public:
  VertexJoint(){};

  // ### Overriden from btSoftBody::Joint #####
  void Prepare(btScalar dt,int iterations){}; // I don't need this
  void Solve(btScalar dt,btScalar sor);
  void Terminate(btScalar dt){}; // I don't need this there
  btSoftBody::Joint::eType::_ Type() const;
  // ##########################################

  ~VertexJoint(){...};
 private:

  struct Attach
  {
    size_t attached_vertex_id;
    size_t attached_to_tetrahedra_id;
    btVector3 barycentric_coordinates;
  };
  std::vector<Attach> attachments;

  bool initJoint(){}; // generating Attach

  btSBObject* main_soft_body;
  btSBObject* attached_soft_body;
};

#endif
