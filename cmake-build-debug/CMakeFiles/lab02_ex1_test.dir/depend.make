# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Note that incremental build could trigger a call to cmake_copy_f90_mod on each re-build
CMakeFiles/lab02_ex1_test.dir/lab02/test_reduction.f90.o: \
 ../lab02/reduction.f90 \
 ../lab02/stats.f90
CMakeFiles/lab02_ex1_test.dir/lab02/test_reduction.f90.o.provides.build: CMakeFiles/lab02_ex1_test.dir/reduction.mod.stamp
CMakeFiles/lab02_ex1_test.dir/reduction.mod.stamp: CMakeFiles/lab02_ex1_test.dir/lab02/test_reduction.f90.o
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod reduction.mod CMakeFiles/lab02_ex1_test.dir/reduction.mod.stamp GNU
CMakeFiles/lab02_ex1_test.dir/lab02/test_reduction.f90.o.provides.build: CMakeFiles/lab02_ex1_test.dir/stats.mod.stamp
CMakeFiles/lab02_ex1_test.dir/stats.mod.stamp: CMakeFiles/lab02_ex1_test.dir/lab02/test_reduction.f90.o
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod stats.mod CMakeFiles/lab02_ex1_test.dir/stats.mod.stamp GNU
CMakeFiles/lab02_ex1_test.dir/lab02/test_reduction.f90.o.provides.build:
	$(CMAKE_COMMAND) -E touch CMakeFiles/lab02_ex1_test.dir/lab02/test_reduction.f90.o.provides.build
CMakeFiles/lab02_ex1_test.dir/build: CMakeFiles/lab02_ex1_test.dir/lab02/test_reduction.f90.o.provides.build