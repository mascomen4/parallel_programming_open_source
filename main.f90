include "lab01/src/quicksort.f90"

program test_quicksort
    use iso_fortran_env, only: int32, int64, real32, real64
    use quick_sort
    implicit none
    integer(int64), dimension(1:10) :: A

    A = [ 12, 15, 56, 25, 32, 17, 24, 14, 43, 85 ]

    print '(10(i10, "  "))', A

    call quicksort(A, 1_8, 10_8)

    print '(10(i10, "  "))', A

end program test_quicksort