#ifndef MUSCLE_CONSTRAINT_H
#define MUSCLE_CONSTRAINT_H

#include "BulletSoftBody/btSoftBody.h"

class MuscleConstraint: public btSoftBody::Joint {
 public:
  MuscleConstraint(btSoftBody* psb){
    m_main_soft_body = psb;
  };
  
  // ### Overriden from btSoftBody::Joint #####
  void Prepare(btScalar dt,int iterations){}; // I don't need this
  void Solve(btScalar dt, btScalar sor);
  void Terminate(btScalar dt){}; // I don't need this
  btSoftBody::Joint::eType::_ Type() const;
  // ##########################################

  ~MuscleConstraint(){};
 private:
  btSoftBody* m_main_soft_body;
};

#endif
