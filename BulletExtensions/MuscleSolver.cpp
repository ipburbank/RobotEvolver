#include "MuscleConstraint.h"

btSoftBody::Joint::eType::_ MuscleConstraint::Type() const{
  return btSoftBody::Joint::eType::Linear;
}

//sor may be "speed of reaction" and seems to always = 1
void MuscleConstraint::Solve(btScalar dt,btScalar sor)
{
  //this->m_main_soft_body->m_pose.m_volume = 2.5;
}
