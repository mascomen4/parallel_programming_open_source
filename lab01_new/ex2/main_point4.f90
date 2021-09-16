include 'ex2_point4.f90'

program main_point4
    use iso_fortran_env
    use ex2_point4
    use omp_lib
    implicit none

    real(real64) res
    real(real64), dimension(1:20) :: array
    integer(int32):: threads_num, i


    ! FOR POINT 4
        call random_number(array)

        threads_num = 4
        res = proc_ex2_point4(array, threads_num)
        print *, "Total result is ", res
        print *, "Actual sum is ", sum(array)


end program main_point4