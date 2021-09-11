! Created by ivan on 11.09.2021.
include "ex4.f90"

module test
    use ex4
    use iso_fortran_env
    implicit none
    private
    public :: el_qubic, pure_qubic, test1, test2
    contains

    elemental function el_qubic(x)
        implicit none
        double precision :: el_qubic
        double precision, intent(in) :: x
        el_qubic = x**3 + x**2 + x + 1.0
    end function el_qubic

    double precision pure function pure_qubic(x)
        implicit none
        double precision :: pure_cubic
        double precision, intent(in) :: x
        pure_cubic = x**3 + x**2 + x + 1.0
    end function pure_qubic

! TEST 1: map function testing.
    subroutine test1(array)
        double precision, dimension(1:10) :: array, res
        print *, "TEST 1. Map testing. Starting..."

        !call random_number(array)
        res = map(pure_qubic, array)

        print *, "Initial array: "
        write (*, "(10(2x, f10.5))"), array
        print *, "Resulting array: "
        write(*, "(10(2x, f10.5))"), res

        print *, "End of test 1."
        print *, " "
    end subroutine test1

! TEST 2 elemental function testing.
    subroutine test2(array)
        double precision, dimension(1:10) :: array, res
        print *, "TEST 2. Elemental function testing. Starting..."

        !call random_number(array)
        res = el_qubic(array)

        print *, "Initial array: "
        write (*, "(10(2x, f10.5))"), array
        print *, "Resulting array: "
        write(*, "(10(2x, f10.5))"), res

        print *, "End of test 2."
        print *, " "
    end subroutine test2
end module test
