cmake_minimum_required(VERSION 3.19)
project(parallel_programming Fortran)

enable_language(Fortran)
add_executable(main lab01_new/main.f90)

add_executable(ex2 lab01_new/ex2/ex2.f90)
add_executable(main_ex2 lab01_new/ex2/main.f90)
add_executable(test_ex2 lab01_new/ex2/test.f90)

add_executable(ex3 lab01_new/ex3/ex3.f90)
add_executable(test_ex3 lab01_new/ex3/speed_test.f90)
add_executable(main_ex3 lab01_new/ex3/main.f90)

add_executable(ex4 lab01_new/ex4/ex4.f90)
add_executable(test_ex4 lab01_new/ex4/test.f90)
add_executable(main_ex4 lab01_new/ex4/main.f90)

set (CMAKE_Fortran_FLAGS_RELEASE "-fopenmp")
set (CMAKE_Fortran_FLAGS_DEBUG "-fopenmp")
add_compile_options("-fopenmp")