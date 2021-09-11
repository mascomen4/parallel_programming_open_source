! Created by ivan on 11.09.2021.

module ex3
    use omp_lib
    use iso_fortran_env
    implicit none
    private
    public :: my_function_vector, my_function_scalar
    contains

    function my_function_vector(array) result(res)
        implicit none
        real(real32), dimension(1:), intent(in) :: array
        real(real32), dimension(1:size(array, 1)) :: res
        !integer :: array_length

        !array_length = size(array, 1)
        !allocate(res(1:array_length))
        res = asinh(sqrt(log(exp((sin(array)**2 + cos(array)**2) / (sin(array**2) + cos(array**2)))))) &
            / asinh(sqrt(log(exp((sin(array)**3 + cos(array)**5) / (sin(array**2) + cos(array**3))))))
    end function my_function_vector

    function my_function_scalar(scalar) result(res)
        real(real32), intent(in) :: scalar
        real(real32) :: res

        res = asinh(sqrt(log(exp((sin(scalar)**2 + cos(scalar)**2) / (sin(scalar**2) + cos(scalar**2)))))) &
            / asinh(sqrt(log(exp((sin(scalar)**3 + cos(scalar)**5) / (sin(scalar**2) + cos(scalar**3))))))
    end function my_function_scalar
end module ex3