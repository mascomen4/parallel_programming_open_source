! Created by ivan on 10.09.2021.

! TESTS FOR POINT 5

include 'ex2_point4.f90'
include 'different_threads_parse_ex2.f90'

module test
    use omp_lib
    use iso_fortran_env
    use different_threads_num_ex2
    use ex2_point4
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
        print *, "Starting test 1..."
        length = 30
        allocate(array(1:length))

        call random_number(array)
        res = proc_ex2_point4(array, threads_num)

        ! Проверим, что результаты отличаются не более чем на 0.001
        print *, "Case 1, result: ", (res <= sum(array) + 0.001 .and. res >= sum(array) - 0.001)
        print *, "res: ", res, " sum: ", sum(array)
        print *
        deallocate(array)

        !TEST CASE 2
        print *, "Starting test 2..."
        length = 1
        allocate(array(1:length))

        array(1) = 0.0
        res = proc_ex2_point4(array, threads_num)
        print *, "Case 2, result: ", (res <= sum(array) + 0.001 .and. res >= sum(array) - 0.001)
        print *, "res: ", res, " sum: ", sum(array)
        print *
        deallocate(array)

        !TEST CASE 3
        print *, "Starting test 3..."
        length = 10**4
        allocate(array(1:length))

        array = [(-i, i=1,length)]
        res = proc_ex2_point4(array, threads_num)
        print *, "Case 3, result: ", (res <= sum(array) + 0.001 .and. res >= sum(array) - 0.001)
        print *, "res: ", res, " sum: ", sum(array)
        print *
        deallocate(array)

        !TEST CASE 4
        print *, "Starting test 4..."
        length = 10**6
        allocate(array(1:length))

        array = [(i, i=1,length)]
        res = proc_ex2_point4(array, threads_num)
        print *, "Case 4, result: ", (res <= sum(array) + 0.001 .and. res >= sum(array) - 0.001)
        print *, "res: ", res, " sum: ", sum(array)
        print *
        deallocate(array)

        !TEST CASE 5
        print *, "Starting test 5..."
        length = 2
        allocate(array(1:length))

        array(:) = [0.0, 0.05]
        res = proc_ex2_point4(array, threads_num)
        print *, "Case 5, result: ", (res <= sum(array) + 0.001 .and. res >= sum(array) - 0.001)
        print *, "res: ", res, " sum: ", sum(array)
        print *
        deallocate(array)

    end subroutine test1
end module test