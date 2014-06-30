# Install script for directory: /home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Core

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/OpenMesh" TYPE SHARED_LIBRARY FILES
    "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/BuildEmscripten/Build/lib/OpenMesh/libOpenMeshCored.so.3.1"
    "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/BuildEmscripten/Build/lib/OpenMesh/libOpenMeshCored.so"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/OpenMesh" TYPE FILE PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE RENAME "libOpenMeshCored.a" FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/BuildEmscripten/src/OpenMesh/Core/./libOpenMeshCoreStaticd.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenMesh/Core" TYPE DIRECTORY FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Core/." FILES_MATCHING REGEX "/[^/]*\\.hh$" REGEX "/CVS$" EXCLUDE REGEX "/\\.svn$" EXCLUDE REGEX "/tmp$" EXCLUDE REGEX "/Templates$" EXCLUDE REGEX "/Debian[^/]*$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenMesh/Core" TYPE DIRECTORY FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Core/." FILES_MATCHING REGEX "/[^/]*T\\.cc$" REGEX "/CVS$" EXCLUDE REGEX "/\\.svn$" EXCLUDE REGEX "/tmp$" EXCLUDE REGEX "/Templates$" EXCLUDE REGEX "/Debian[^/]*$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenMesh/Core/System" TYPE FILE FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Core/System/config.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenMesh/Core/IO" TYPE DIRECTORY FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Core/IO/" FILES_MATCHING REGEX "/[^/]*\\.inl$" REGEX "/CVS$" EXCLUDE REGEX "/\\.svn$" EXCLUDE REGEX "/reader$" EXCLUDE REGEX "/writer$" EXCLUDE REGEX "/importer$" EXCLUDE REGEX "/exporter$" EXCLUDE REGEX "/tmp$" EXCLUDE REGEX "/Debian[^/]*$" EXCLUDE)
endif()

