program main

    implicit none
    include "omp_lib.h"

    ! CODE FOR POINTS 1-2.
    !    real(kind=8) :: t1, t2
    !    integer :: i
    !
    !    do i=1, 10, 1
    !        t1 = omp_get_wtime()
    !        call sleep(1)
    !        t2 = omp_get_wtime()
    !        print *, "Спали ", t2 - t1, " сек."
    !        print *, "Точность таймера: ", omp_get_wtick()
    !
    !        ! results_array(i) = t2 - t1
    !    end do

    ! CODE FOR POINT 3
    double precision :: t1, t2, result
    real(kind=4), dimension(1:10**6) :: results_array
    real(kind=4) :: dummy_var1
    real(kind=4), parameter :: dummy_var2 = 3.141516
    integer i, j, k

    do i = 1, 10**6, 1
        t1 = omp_get_wtime()
        do j = 1, 10**2, 1
            dummy_var1 = sinh(dummy_var2)
            dummy_var1 = dummy_var1 / cosh(dummy_var2)
            dummy_var1 = dummy_var1 / tanh(dummy_var2)
            dummy_var1 = dummy_var1 / log(dummy_var1)
        end do
        t2 = omp_get_wtime()
        ! Multiply the difference by 10**4 for simplicity. In this way it'll be easier to plot the data
        ! further in Python and calculate dispersion + average.
        results_array(i) = 10**4 * (t2 - t1)
    end do


    open(5, file="../lab01_new/out.txt", action="write")
    write(5, "(2x, f24.17)"), results_array
    close(5, status="keep")
end program main