! Created by ivan on 11.09.2021.
include "test.f90"

program main
    use omp_lib
    use iso_fortran_env
    use ex4
    use test
    implicit none

! TODO: Explain how to declare the pure and elemental functions. What is the difference between them.
! TODO: How to pass a function as an argument to the other function.

!    double precision, dimension(1:10) :: array, res
!    call random_number(array)
!    res = map(pure_qubic, array)
!    print *, "Array ", array
!    print *, "Res ", res

    double precision, dimension(1:10) :: array, res
    integer :: i
    array = [(i, i=1, 10)]

    call test1(array)
    call test2(array)

end program main