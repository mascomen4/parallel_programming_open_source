# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/ivan/ivan/programs/clion-2021.1.2/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/ivan/ivan/programs/clion-2021.1.2/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ivan/CLionProjects/parallel_programming

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ivan/CLionProjects/parallel_programming/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/ex1_point3.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/ex1_point3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ex1_point3.dir/flags.make

CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.o: CMakeFiles/ex1_point3.dir/flags.make
CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.o: ../lab01_new/ex1/ex1_point3.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ivan/CLionProjects/parallel_programming/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.o"
	/usr/bin/f95 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/ivan/CLionProjects/parallel_programming/lab01_new/ex1/ex1_point3.f90 -o CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.o

CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.i"
	/usr/bin/f95 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/ivan/CLionProjects/parallel_programming/lab01_new/ex1/ex1_point3.f90 > CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.i

CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.s"
	/usr/bin/f95 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/ivan/CLionProjects/parallel_programming/lab01_new/ex1/ex1_point3.f90 -o CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.s

# Object files for target ex1_point3
ex1_point3_OBJECTS = \
"CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.o"

# External object files for target ex1_point3
ex1_point3_EXTERNAL_OBJECTS =

ex1_point3: CMakeFiles/ex1_point3.dir/lab01_new/ex1/ex1_point3.f90.o
ex1_point3: CMakeFiles/ex1_point3.dir/build.make
ex1_point3: CMakeFiles/ex1_point3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ivan/CLionProjects/parallel_programming/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking Fortran executable ex1_point3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ex1_point3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ex1_point3.dir/build: ex1_point3
.PHONY : CMakeFiles/ex1_point3.dir/build

CMakeFiles/ex1_point3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ex1_point3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ex1_point3.dir/clean

CMakeFiles/ex1_point3.dir/depend:
	cd /home/ivan/CLionProjects/parallel_programming/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ivan/CLionProjects/parallel_programming /home/ivan/CLionProjects/parallel_programming /home/ivan/CLionProjects/parallel_programming/cmake-build-debug /home/ivan/CLionProjects/parallel_programming/cmake-build-debug /home/ivan/CLionProjects/parallel_programming/cmake-build-debug/CMakeFiles/ex1_point3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ex1_point3.dir/depend
