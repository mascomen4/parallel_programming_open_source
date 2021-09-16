program main

    implicit none
    include "omp_lib.h"

    ! CODE FOR POINTS 1-2.
    ! Since we didn't write "use iso_fortran_env" we have to write "kind=8" instead of "real64".
    ! "kind=1" is 8bit number.
        real(kind=8) :: t1, t2
        integer :: i

        do i=1, 10, 1
            t1 = omp_get_wtime()
            call sleep(1)
            t2 = omp_get_wtime()
            print *, "Спали ", t2 - t1, " сек."
            print *, "Точность таймера: ", omp_get_wtick()

            ! results_array(i) = t2 - t1
        end do
end program main