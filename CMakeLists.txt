project("RobotEvolver")

# The version number.
set (VERSION_MAJOR 0)
set (VERSION_MINOR 1)

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall -g")

#bullet
include_directories(SYSTEM Libraries/bullet/src) #to avoid errors from c++11
SET(BULLET_VERSION 2.82)
add_subdirectory(Libraries/bullet/src)

#bullet demo files
add_subdirectory(BulletDemoFiles)

#all compiles after this use c++11
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

#OpenMesh
include_directories(Libraries/OpenMesh/src)
add_subdirectory(Libraries/OpenMesh)

#libraries
add_subdirectory(BulletExtensions)

add_subdirectory(Meshes)


add_executable(softapp main.cpp SoftDemo.cpp)
#make shared
target_link_libraries(softapp MeshTools BulletDemoFiles BulletExtensions BulletSoftBody BulletDynamics BulletCollision LinearMath OpenMeshCore OpenMeshTools)

#system libraries
target_link_libraries(softapp -lglut)
target_link_libraries(softapp -lGL)
target_link_libraries(softapp -lGLU)

# add a target to generate API documentation with Doxygen
find_package(Doxygen)
if(DOXYGEN_FOUND)
	configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Docs/Doxyfile.in 
		${CMAKE_CURRENT_BINARY_DIR}/Docs/Doxyfile @ONLY
	)
	add_custom_target(docs
		${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Docs/Doxyfile
		WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/Docs
		COMMENT "Generating API documentation with Doxygen" VERBATIM
	)
endif(DOXYGEN_FOUND)
