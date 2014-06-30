# Install script for directory: /home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Tools

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
    "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/build/Build/lib/OpenMesh/libOpenMeshToolsd.so.3.1"
    "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/build/Build/lib/OpenMesh/libOpenMeshToolsd.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/OpenMesh/libOpenMeshToolsd.so.3.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/OpenMesh/libOpenMeshToolsd.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/OpenMesh" TYPE FILE PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE RENAME "libOpenMeshToolsd.a" FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/build/src/OpenMesh/Tools/./libOpenMeshToolsStaticd.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenMesh/Tools" TYPE DIRECTORY FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Tools/." FILES_MATCHING REGEX "/[^/]*\\.hh$" REGEX "/CVS$" EXCLUDE REGEX "/\\.svn$" EXCLUDE REGEX "/tmp$" EXCLUDE REGEX "/Templates$" EXCLUDE REGEX "/Debian[^/]*$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenMesh/Tools" TYPE DIRECTORY FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Tools/." FILES_MATCHING REGEX "/[^/]*T\\.cc$" REGEX "/CVS$" EXCLUDE REGEX "/\\.svn$" EXCLUDE REGEX "/tmp$" EXCLUDE REGEX "/Templates$" EXCLUDE REGEX "/Debian[^/]*$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenMesh/Tools/Utils" TYPE FILE FILES "/home/istvan/Desktop/RobotEvolver/master/Meshes/OpenMesh/src/OpenMesh/Tools/Utils/getopt.h")
endif()

