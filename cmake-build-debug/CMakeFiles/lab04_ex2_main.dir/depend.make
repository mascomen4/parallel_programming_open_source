# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Note that incremental build could trigger a call to cmake_copy_f90_mod on each re-build
CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o: \
 ../lab04/lab04-stud/src/class_area.f90 \
 ../lab04/lab04-stud/src/montecarlo.f90
CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o.provides.build: CMakeFiles/lab04_ex2_main.dir/class_area.mod.stamp
CMakeFiles/lab04_ex2_main.dir/class_area.mod.stamp: CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod class_area.mod CMakeFiles/lab04_ex2_main.dir/class_area.mod.stamp GNU
CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o.provides.build: CMakeFiles/lab04_ex2_main.dir/montecarlo.mod.stamp
CMakeFiles/lab04_ex2_main.dir/montecarlo.mod.stamp: CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod montecarlo.mod CMakeFiles/lab04_ex2_main.dir/montecarlo.mod.stamp GNU
CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o.provides.build: CMakeFiles/lab04_ex2_main.dir/support.mod.stamp
CMakeFiles/lab04_ex2_main.dir/support.mod.stamp: CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod support.mod CMakeFiles/lab04_ex2_main.dir/support.mod.stamp GNU
CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o.provides.build:
	$(CMAKE_COMMAND) -E touch CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o.provides.build
CMakeFiles/lab04_ex2_main.dir/build: CMakeFiles/lab04_ex2_main.dir/lab04/ex2.f90.o.provides.build
