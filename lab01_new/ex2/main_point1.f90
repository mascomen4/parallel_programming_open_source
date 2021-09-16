! Created by ivan on 16.09.2021.
include 'ex2_point1.f90'

program main_point1
    use iso_fortran_env
    use ex2_point1
    use omp_lib
    implicit none

    integer(int32):: threads_num

    ! Please, paste here the number of desired threads. Fast way to check the number of available threads in Ubuntu
    ! is to write "htop" in your bash.
    threads_num = 3
    ! FOR POINT 1
    call proc_ex2_point1(threads_num)
end program main_point1