project("RobotEvolver")

# The version number.
set (VERSION_MAJOR 0)
set (VERSION_MINOR 1)

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

#find bullet
include_directories(SYSTEM Libraries/bullet/src) #to avoid errors from c++11
SET(BULLET_VERSION 2.82)
add_subdirectory(Libraries/bullet/src)

#OpenMesh
include_directories(Libraries/OpenMesh/src)
add_subdirectory(Libraries/OpenMesh)

add_subdirectory(BulletDemoFiles)


#all compiles after this use c++11
set(CMAKE_CXX_FLAGS "-std=c++11 -g")

add_subdirectory(Meshes)


add_executable(softapp.app main.cpp SoftDemo.cpp)
target_link_libraries(softapp.app MeshTools  BulletDemoFiles BulletSoftBody BulletDynamics BulletCollision LinearMath OpenMeshCore OpenMeshTools)

#system libraries
target_link_libraries(softapp.app -lglut)
target_link_libraries(softapp.app -lGL)
target_link_libraries(softapp.app -lGLU)
