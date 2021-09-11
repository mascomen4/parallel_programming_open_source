! Created by ivan on 10.09.2021.
include "ex2.f90"
include 'different_threads_parse_ex2.f90'

module test
    use omp_lib
    use iso_fortran_env
    use ex2
    use different_threads_num_ex2
    implicit none
    private
    public :: test1
    contains

   subroutine test1()
        real(real64) res
        real(real64), dimension(:), allocatable :: array
        integer(int32):: threads_num, length, i
        threads_num = 4

        ! TEST CASE 1
        length = 30
        allocate(array(1:length))

        call random_number(array)
        res = proc_ex2(array, threads_num)
        print *, "Case 1, result: ", res == sum(array), "res: ", res, " sum: ", sum(array)

        deallocate(array)

        !TEST CASE 2
        length = 1
        allocate(array(1:length))

        array(1) = 0.0
        res = proc_ex2(array, threads_num)
        print *, "Case 2, result: ", res == sum(array), "res: ", res, " sum: ", sum(array)
        deallocate(array)

        !TEST CASE 3
        length = 10**4
        allocate(array(1:length))

        array = [(-i, i=1,length)]
        res = proc_ex2(array, threads_num)
        print *, "Case 3, result: ", res == sum(array), "res: ", res, " sum: ", sum(array)
        deallocate(array)

        !TEST CASE 4
        length = 10**6
        allocate(array(1:length))

        array = [(i, i=1,length)]
        res = proc_ex2(array, threads_num)
        print *, "Case 4, result: ", res == sum(array), "res: ", res, " sum: ", sum(array)
        deallocate(array)

        !TEST CASE 5
        length = 2
        allocate(array(1:length))

        array(:) = [0.0, 0.05]
        res = proc_ex2(array, threads_num)
        print *, "Case 5, result: ", res == sum(array), "res: ", res, " sum: ", sum(array)
        deallocate(array)

    end subroutine test1
end module test