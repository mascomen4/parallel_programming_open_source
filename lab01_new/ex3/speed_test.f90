! Created by ivan on 11.09.2021.
include "ex3.f90"

module speed_test
    use omp_lib
    use iso_fortran_env
    use ex3
    implicit none
    private
    public :: test
    contains

    subroutine test()
        real(real32), dimension(1:10**6) :: testing_array, resulting_array
        real(real64) :: t1, t2
        integer :: i

        call random_number(testing_array)

        ! TEST 1. VECTOR PROCESSING.
        t1 = omp_get_wtime()
        resulting_array = my_function_vector(testing_array)
        t2 = omp_get_wtime()
        print *, "Vector processing took ", t2 - t1, " seconds"


        ! TEST 2. PER ELEMENT PROCESSING.
        t1 = omp_get_wtime()
        do i = 1, size(testing_array, 1), 1
            resulting_array(i) = my_function_scalar(testing_array(i))
        end do
        t2 = omp_get_wtime()
        print *, "Per element processing took ", t2 - t1, " seconds"

    end subroutine test

end module speed_test