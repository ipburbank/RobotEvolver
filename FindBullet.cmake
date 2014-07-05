# - Try to find Bullet
# Once done this will define
#
#  BULLET_FOUND - system has bullet
#  BULLET_INCLUDE_DIR - the bullet include directory
#  BULLET_Libraries - Link these to use Collada DOM
#

  SET(BULLETDYNAMICS "BulletDynamics")
  SET(BULLETCOLLISION "BulletCollision")
  SET(BULLETMATH "LinearMath")
  SET(BULLETSOFTBODY "BulletSoftBody")
  SET(BULLETMULTITHREADED "BulletMultiThreaded")

FIND_PATH(BULLET_INCLUDE_DIR NAMES btBulletCollisionCommon.h
  PATHS
  ${PROJECT_SOURCE_DIR}/Libraries/bullet/src
  NO_DEFAULT_PATH
)

FIND_LIBRARY(LIBBULLETDYNAMICS
  NAMES 
  ${BULLETDYNAMICS}
  PATHS
  ${BULLET_INCLUDE_DIR}/BulletDynamics
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETDYNAMICS)
    MESSAGE ("WARNING: Could not find Bullet Dynamics - depending targets will be disabled.")
ENDIF(NOT LIBBULLETDYNAMICS)


FIND_LIBRARY(LIBBULLETCOLLISION
  NAMES 
  ${BULLETCOLLISION}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/Libraries
  ${PROJECT_SOURCE_DIR}/Libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETCOLLISION)
    MESSAGE ("WARNING: Could not find Bullet Collision - depending targets will be disabled.")
ENDIF(NOT LIBBULLETCOLLISION)

FIND_LIBRARY(LIBBULLETMATH
  NAMES 
  ${BULLETMATH}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/Libraries
  ${PROJECT_SOURCE_DIR}/Libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETMATH)
    MESSAGE ("WARNING: Could not find Bullet Math - depending targets will be disabled.")
ENDIF(NOT LIBBULLETMATH)

FIND_LIBRARY(LIBBULLETSOFTBODY
  NAMES 
  ${BULLETSOFTBODY}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/Lib
  ${PROJECT_SOURCE_DIR}/Lib
  ${PROJECT_SOURCE_DIR}/Libraries
  ${PROJECT_SOURCE_DIR}/Libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETSOFTBODY)
    MESSAGE ("WARNING: Could not find Bullet SoftBody - depending targets will be disabled.")
ENDIF(NOT LIBBULLETSOFTBODY)


FIND_LIBRARY(LIBBULLETMULTITHREADED
  NAMES 
  ${BULLETMULTITHREADED}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/Libraries
  ${PROJECT_SOURCE_DIR}/Libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETMULTITHREADED)
    MESSAGE ("WARNING: Could not find Bullet MultiThreaded - depending targets will be disabled.")
ENDIF(NOT LIBBULLETMULTITHREADED)

SET(BULLET_Libraries ${LIBBULLETMULTITHREADED} ${LIBBULLETSOFTBODY} ${LIBBULLETDYNAMICS} ${LIBBULLETCOLLISION} ${LIBBULLETMATH})

IF(BULLET_INCLUDE_DIR AND BULLET_Libraries)
  SET(BULLET_FOUND TRUE)
ENDIF(BULLET_INCLUDE_DIR AND BULLET_Libraries)

# show the BULLET_INCLUDE_DIR and BULLET_Libraries variables only in the advanced view
IF(BULLET_FOUND)
  MARK_AS_ADVANCED(BULLET_INCLUDE_DIR BULLET_Libraries )
ENDIF(BULLET_FOUND)
