! Created by ivan on 10.09.2021.

module ex2_point1
    use omp_lib
    use iso_fortran_env
    implicit none

    private
    public :: proc_ex2_point1
    contains

    subroutine proc_ex2_point1(threads_num)
        implicit none
        integer(int32), intent(in) :: threads_num

        ! FOR POINT 1
                call omp_set_num_threads(threads_num)
                !$omp parallel
                write(*, *) "Hi! This is thread number:", omp_get_thread_num()
                    !$omp single
                        write(*, *) "There are ", omp_get_num_threads(), " total number of threads"
                    !$omp end single
                !$omp end parallel

    end subroutine proc_ex2_point1

end module ex2_point1