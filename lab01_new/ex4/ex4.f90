! Created by ivan on 11.09.2021.

module ex4
    use omp_lib
    use iso_fortran_env
    implicit none

    abstract interface
        pure function f(x)
            double precision, intent(in) :: x
            double precision :: f
        end function f
    end interface

    private
    public :: map
    contains

    function map(func, array) result(res)
        double precision, dimension(1:), intent(in) :: array
        integer :: i
        double precision, dimension(1:size(array, 1)) :: res
        procedure(f) :: func

        do i = 1, size(array, 1)
            res(i) = func(array(i))
        end do

    end function map
end module ex4