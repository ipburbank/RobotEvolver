#ifndef TICK_CALLBACKS_H
#define TICK_CALLBACKS_H

#include <vector>
#include "BulletSoftBody/btSoftBody.h"
#include "btBulletDynamicsCommon.h"

/**
   Callback handler for stepPhysics
*/
class TickCallbacks
{
 public:
  static void addCallback(void (*function)(btDynamicsWorld *world, btScalar timeStep));

  static void runCallbacks(btDynamicsWorld *world, btScalar timeStep);

 private:
  static std::vector<void (*)(btDynamicsWorld *world, btScalar timeStep)> m_callbacks;
};

#endif
