# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative

# Include any dependencies generated for this target.
include Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/depend.make

# Include the progress variables for this target.
include Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/progress.make

# Include the compile flags for this target's objects.
include Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/flags.make

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/flags.make
Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o: /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo/SliderConstraintDemo.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o"
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o -c /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo/SliderConstraintDemo.cpp

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.i"
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo/SliderConstraintDemo.cpp > CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.i

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.s"
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo/SliderConstraintDemo.cpp -o CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.s

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o.requires:
.PHONY : Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o.requires

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o.provides: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o.requires
	$(MAKE) -f Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/build.make Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o.provides.build
.PHONY : Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o.provides

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o.provides.build: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/flags.make
Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o: /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o"
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/AppSliderConstraintDemo.dir/main.o -c /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo/main.cpp

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AppSliderConstraintDemo.dir/main.i"
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo/main.cpp > CMakeFiles/AppSliderConstraintDemo.dir/main.i

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AppSliderConstraintDemo.dir/main.s"
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo/main.cpp -o CMakeFiles/AppSliderConstraintDemo.dir/main.s

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o.requires:
.PHONY : Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o.requires

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o.provides: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o.requires
	$(MAKE) -f Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/build.make Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o.provides.build
.PHONY : Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o.provides

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o.provides.build: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o

# Object files for target AppSliderConstraintDemo
AppSliderConstraintDemo_OBJECTS = \
"CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o" \
"CMakeFiles/AppSliderConstraintDemo.dir/main.o"

# External object files for target AppSliderConstraintDemo
AppSliderConstraintDemo_EXTERNAL_OBJECTS =

Demos/SliderConstraintDemo/AppSliderConstraintDemo: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o
Demos/SliderConstraintDemo/AppSliderConstraintDemo: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o
Demos/SliderConstraintDemo/AppSliderConstraintDemo: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/build.make
Demos/SliderConstraintDemo/AppSliderConstraintDemo: Demos/OpenGL/libOpenGLSupport.a
Demos/SliderConstraintDemo/AppSliderConstraintDemo: src/BulletDynamics/libBulletDynamics.a
Demos/SliderConstraintDemo/AppSliderConstraintDemo: src/BulletCollision/libBulletCollision.a
Demos/SliderConstraintDemo/AppSliderConstraintDemo: src/LinearMath/libLinearMath.a
Demos/SliderConstraintDemo/AppSliderConstraintDemo: /usr/lib64/libglut.so
Demos/SliderConstraintDemo/AppSliderConstraintDemo: /usr/lib64/libGL.so
Demos/SliderConstraintDemo/AppSliderConstraintDemo: /usr/lib64/libGLU.so
Demos/SliderConstraintDemo/AppSliderConstraintDemo: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable AppSliderConstraintDemo"
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AppSliderConstraintDemo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/build: Demos/SliderConstraintDemo/AppSliderConstraintDemo
.PHONY : Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/build

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/requires: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/SliderConstraintDemo.o.requires
Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/requires: Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/main.o.requires
.PHONY : Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/requires

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/clean:
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo && $(CMAKE_COMMAND) -P CMakeFiles/AppSliderConstraintDemo.dir/cmake_clean.cmake
.PHONY : Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/clean

Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/depend:
	cd /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet /home/istvan/Desktop/RobotEvolver/master/Bullet/bullet/Demos/SliderConstraintDemo /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo /home/istvan/Desktop/RobotEvolver/master/Bullet/BuildNative/Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Demos/SliderConstraintDemo/CMakeFiles/AppSliderConstraintDemo.dir/depend

