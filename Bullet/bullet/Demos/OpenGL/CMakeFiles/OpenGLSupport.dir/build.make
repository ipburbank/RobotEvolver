# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL

# Include any dependencies generated for this target.
include CMakeFiles/OpenGLSupport.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/OpenGLSupport.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/OpenGLSupport.dir/flags.make

CMakeFiles/OpenGLSupport.dir/GLDebugFont.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/GLDebugFont.o: GLDebugFont.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/GLDebugFont.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/GLDebugFont.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GLDebugFont.cpp

CMakeFiles/OpenGLSupport.dir/GLDebugFont.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/GLDebugFont.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GLDebugFont.cpp > CMakeFiles/OpenGLSupport.dir/GLDebugFont.i

CMakeFiles/OpenGLSupport.dir/GLDebugFont.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/GLDebugFont.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GLDebugFont.cpp -o CMakeFiles/OpenGLSupport.dir/GLDebugFont.s

CMakeFiles/OpenGLSupport.dir/GLDebugFont.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/GLDebugFont.o.requires

CMakeFiles/OpenGLSupport.dir/GLDebugFont.o.provides: CMakeFiles/OpenGLSupport.dir/GLDebugFont.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/GLDebugFont.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/GLDebugFont.o.provides

CMakeFiles/OpenGLSupport.dir/GLDebugFont.o.provides.build: CMakeFiles/OpenGLSupport.dir/GLDebugFont.o

CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o: GL_DialogDynamicsWorld.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_DialogDynamicsWorld.cpp

CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_DialogDynamicsWorld.cpp > CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.i

CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_DialogDynamicsWorld.cpp -o CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.s

CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o.requires

CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o.provides: CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o.provides

CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o.provides.build: CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o

CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o: GL_DialogWindow.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_DialogWindow.cpp

CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_DialogWindow.cpp > CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.i

CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_DialogWindow.cpp -o CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.s

CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o.requires

CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o.provides: CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o.provides

CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o.provides.build: CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o

CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o: GL_ShapeDrawer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_ShapeDrawer.cpp

CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_ShapeDrawer.cpp > CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.i

CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_ShapeDrawer.cpp -o CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.s

CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o.requires

CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o.provides: CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o.provides

CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o.provides.build: CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o

CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o: GL_Simplex1to4.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_Simplex1to4.cpp

CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_Simplex1to4.cpp > CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.i

CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GL_Simplex1to4.cpp -o CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.s

CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o.requires

CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o.provides: CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o.provides

CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o.provides.build: CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o

CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o: GLDebugDrawer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GLDebugDrawer.cpp

CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GLDebugDrawer.cpp > CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.i

CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GLDebugDrawer.cpp -o CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.s

CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o.requires

CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o.provides: CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o.provides

CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o.provides.build: CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o

CMakeFiles/OpenGLSupport.dir/RenderTexture.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/RenderTexture.o: RenderTexture.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/RenderTexture.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/RenderTexture.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/RenderTexture.cpp

CMakeFiles/OpenGLSupport.dir/RenderTexture.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/RenderTexture.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/RenderTexture.cpp > CMakeFiles/OpenGLSupport.dir/RenderTexture.i

CMakeFiles/OpenGLSupport.dir/RenderTexture.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/RenderTexture.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/RenderTexture.cpp -o CMakeFiles/OpenGLSupport.dir/RenderTexture.s

CMakeFiles/OpenGLSupport.dir/RenderTexture.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/RenderTexture.o.requires

CMakeFiles/OpenGLSupport.dir/RenderTexture.o.provides: CMakeFiles/OpenGLSupport.dir/RenderTexture.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/RenderTexture.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/RenderTexture.o.provides

CMakeFiles/OpenGLSupport.dir/RenderTexture.o.provides.build: CMakeFiles/OpenGLSupport.dir/RenderTexture.o

CMakeFiles/OpenGLSupport.dir/DemoApplication.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/DemoApplication.o: DemoApplication.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/DemoApplication.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/DemoApplication.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/DemoApplication.cpp

CMakeFiles/OpenGLSupport.dir/DemoApplication.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/DemoApplication.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/DemoApplication.cpp > CMakeFiles/OpenGLSupport.dir/DemoApplication.i

CMakeFiles/OpenGLSupport.dir/DemoApplication.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/DemoApplication.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/DemoApplication.cpp -o CMakeFiles/OpenGLSupport.dir/DemoApplication.s

CMakeFiles/OpenGLSupport.dir/DemoApplication.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/DemoApplication.o.requires

CMakeFiles/OpenGLSupport.dir/DemoApplication.o.provides: CMakeFiles/OpenGLSupport.dir/DemoApplication.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/DemoApplication.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/DemoApplication.o.provides

CMakeFiles/OpenGLSupport.dir/DemoApplication.o.provides.build: CMakeFiles/OpenGLSupport.dir/DemoApplication.o

CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o: GlutDemoApplication.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GlutDemoApplication.cpp

CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GlutDemoApplication.cpp > CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.i

CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GlutDemoApplication.cpp -o CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.s

CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o.requires

CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o.provides: CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o.provides

CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o.provides.build: CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o

CMakeFiles/OpenGLSupport.dir/GlutStuff.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/GlutStuff.o: GlutStuff.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/GlutStuff.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/GlutStuff.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GlutStuff.cpp

CMakeFiles/OpenGLSupport.dir/GlutStuff.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/GlutStuff.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GlutStuff.cpp > CMakeFiles/OpenGLSupport.dir/GlutStuff.i

CMakeFiles/OpenGLSupport.dir/GlutStuff.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/GlutStuff.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/GlutStuff.cpp -o CMakeFiles/OpenGLSupport.dir/GlutStuff.s

CMakeFiles/OpenGLSupport.dir/GlutStuff.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/GlutStuff.o.requires

CMakeFiles/OpenGLSupport.dir/GlutStuff.o.provides: CMakeFiles/OpenGLSupport.dir/GlutStuff.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/GlutStuff.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/GlutStuff.o.provides

CMakeFiles/OpenGLSupport.dir/GlutStuff.o.provides.build: CMakeFiles/OpenGLSupport.dir/GlutStuff.o

CMakeFiles/OpenGLSupport.dir/stb_image.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/stb_image.o: stb_image.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/stb_image.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/stb_image.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/stb_image.cpp

CMakeFiles/OpenGLSupport.dir/stb_image.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/stb_image.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/stb_image.cpp > CMakeFiles/OpenGLSupport.dir/stb_image.i

CMakeFiles/OpenGLSupport.dir/stb_image.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/stb_image.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/stb_image.cpp -o CMakeFiles/OpenGLSupport.dir/stb_image.s

CMakeFiles/OpenGLSupport.dir/stb_image.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/stb_image.o.requires

CMakeFiles/OpenGLSupport.dir/stb_image.o.provides: CMakeFiles/OpenGLSupport.dir/stb_image.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/stb_image.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/stb_image.o.provides

CMakeFiles/OpenGLSupport.dir/stb_image.o.provides.build: CMakeFiles/OpenGLSupport.dir/stb_image.o

CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o: CMakeFiles/OpenGLSupport.dir/flags.make
CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o: Win32DemoApplication.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o -c /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/Win32DemoApplication.cpp

CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/Win32DemoApplication.cpp > CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.i

CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/Win32DemoApplication.cpp -o CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.s

CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o.requires:
.PHONY : CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o.requires

CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o.provides: CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o.requires
	$(MAKE) -f CMakeFiles/OpenGLSupport.dir/build.make CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o.provides.build
.PHONY : CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o.provides

CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o.provides.build: CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o

# Object files for target OpenGLSupport
OpenGLSupport_OBJECTS = \
"CMakeFiles/OpenGLSupport.dir/GLDebugFont.o" \
"CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o" \
"CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o" \
"CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o" \
"CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o" \
"CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o" \
"CMakeFiles/OpenGLSupport.dir/RenderTexture.o" \
"CMakeFiles/OpenGLSupport.dir/DemoApplication.o" \
"CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o" \
"CMakeFiles/OpenGLSupport.dir/GlutStuff.o" \
"CMakeFiles/OpenGLSupport.dir/stb_image.o" \
"CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o"

# External object files for target OpenGLSupport
OpenGLSupport_EXTERNAL_OBJECTS =

libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/GLDebugFont.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/RenderTexture.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/DemoApplication.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/GlutStuff.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/stb_image.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/build.make
libOpenGLSupport.a: CMakeFiles/OpenGLSupport.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libOpenGLSupport.a"
	$(CMAKE_COMMAND) -P CMakeFiles/OpenGLSupport.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/OpenGLSupport.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/OpenGLSupport.dir/build: libOpenGLSupport.a
.PHONY : CMakeFiles/OpenGLSupport.dir/build

CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/GLDebugFont.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/GL_DialogDynamicsWorld.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/GL_DialogWindow.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/GL_ShapeDrawer.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/GL_Simplex1to4.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/GLDebugDrawer.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/RenderTexture.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/DemoApplication.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/GlutDemoApplication.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/GlutStuff.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/stb_image.o.requires
CMakeFiles/OpenGLSupport.dir/requires: CMakeFiles/OpenGLSupport.dir/Win32DemoApplication.o.requires
.PHONY : CMakeFiles/OpenGLSupport.dir/requires

CMakeFiles/OpenGLSupport.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/OpenGLSupport.dir/cmake_clean.cmake
.PHONY : CMakeFiles/OpenGLSupport.dir/clean

CMakeFiles/OpenGLSupport.dir/depend:
	cd /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL /home/istvan/Desktop/bullet-2.82-r2704/Demos/OpenGL/CMakeFiles/OpenGLSupport.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/OpenGLSupport.dir/depend

