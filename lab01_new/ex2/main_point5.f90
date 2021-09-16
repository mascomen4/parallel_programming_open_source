include 'test_point5.f90'

program main_point5
    use iso_fortran_env
    use omp_lib
    use test
    implicit none

    real(real64) res
    real(real64), dimension(1:20) :: array
    integer(int32):: threads_num
    integer i

    ! FOR TESTING. POINT 5
    call test1()

end program main_point5