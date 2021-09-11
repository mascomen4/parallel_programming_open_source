include "test.f90"
include 'different_threads_parse_ex2.f90'

program main
    use iso_fortran_env
    use ex2
    use omp_lib
    use test
    use different_threads_num_ex2
    implicit none

    real(real64) res
    real(real64), dimension(1:20) :: array
    integer(int32):: threads_num
    integer i

! FOR POINT 2
!    do i = 1, 4, 1
!        threads_num = i
!
!        res = proc_ex2(array, threads_num)
!    end do

!! FOR POINT 4
!    call random_number(array)
!
!    threads_num = 4
!    res = proc_ex2(array, threads_num)
!    print *, "Total result is ", res
!    print *, "Actual sum is ", sum(array)

! FOR TESTING. POINT 5
    call test1()

end program main