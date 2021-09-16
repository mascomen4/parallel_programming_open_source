! Created by ivan on 16.09.2021.
include 'different_threads_parse_ex2.f90'

program main_point2
    use iso_fortran_env
    use omp_lib
    use different_threads_num_ex2
    implicit none

    real(real64) res
    real(real64), dimension(1:20) :: array
    integer(int32):: threads_num, i

    array = [(i, i=1, 20)]

    ! FOR POINT 2
    res = threads_ex2_env_parse(array)
    res = threads_ex2_std_read(array)
    res = threads_ex2_arg_parse(array)
end program main_point2