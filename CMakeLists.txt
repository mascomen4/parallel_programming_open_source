cmake_minimum_required(VERSION 3.19)
project(parallel_programming Fortran)

enable_language(Fortran)
# add_executable(main lab01_new/ex1.f90)

add_executable(lab01_ex1_points12 lab01_new/ex1/ex1_points12.f90)
add_executable(lab01_ex1_point3 lab01_new/ex1/ex1_point3.f90)


# add_executable(ex2_point4 lab01_new/ex2/ex2_point4.f90)
# add_executable(ex2_point4 lab01_new/ex2/ex2_point4.f90)
add_executable(lab01_main_ex2_point5 lab01_new/ex2/main_point5.f90)
add_executable(lab01_main_ex2_point2 lab01_new/ex2/main_point2.f90)
add_executable(lab01_main_ex2_point4 lab01_new/ex2/main_point4.f90)
add_executable(lab01_main_ex2_point1 lab01_new/ex2/main_point1.f90)
# add_executable(test_ex2 lab01_new/ex2/test_point5.f90)

# add_executable(ex3 lab01_new/ex3/ex3.f90)
# add_executable(test_ex3 lab01_new/ex3/speed_test.f90)
add_executable(lab01_main_ex3 lab01_new/ex3/main.f90)

# add_executable(ex4 lab01_new/ex4/ex4.f90)
# add_executable(test_ex4 lab01_new/ex4/test.f90)
add_executable(lab01_main_ex4 lab01_new/ex4/main.f90)

add_executable(lab02_ex1_test lab02/test_reduction.f90)
add_executable(lab02_ex2_test lab02/test_trapezoidal.f90)

add_executable(lab03_ex1_main lab03/ex1.f90)
add_executable(lab03_ex2_main lab03/ex2.f90)
add_executable(lab03_ex3_main lab03/ex3.f90)
add_executable(lab03_ex4_main lab03/ex4.f90)
add_executable(lab03_ex5_main lab03/ex5.f90)

set (CMAKE_Fortran_FLAGS_RELEASE "-fopenmp")
set (CMAKE_Fortran_FLAGS_DEBUG "-fopenmp")
add_compile_options("-fopenmp")