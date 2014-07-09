#include "TickCallbacks.h"


void TickCallbacks::addCallback(void (*function)(btDynamicsWorld *world, btScalar timeStep))
{
  m_callbacks.push_back(function);
}

void TickCallbacks::runCallbacks(btDynamicsWorld *world, btScalar timeStep)
{
  for(int i = 0; i < m_callbacks.size(); i++)
    {
      (*m_callbacks[i])(world, timeStep);
    }
}

std::vector<void (*)(btDynamicsWorld *world, btScalar timeStep)> TickCallbacks::m_callbacks;
