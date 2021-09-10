include "ex2.f90"
program main
    use iso_fortran_env
    use ex2
    use omp_lib
    implicit none

    real(real64) res
    real(real64), dimension(1:10) :: array
    integer(int32):: threads_num
    integer i

    do i = 1, 4, 1
        threads_num = i

        res = proc_ex2(array, threads_num)
    end do



end program main