! Created by ivan on 10.09.2021.
module ex2
    use omp_lib
    use iso_fortran_env
    implicit none
    private
    public :: proc_ex2
    contains

    function proc_ex2(array, threads_num) result(res)
        implicit none
        real(real64), dimension(1:), intent(in) :: array
        integer(int32), intent(in) :: threads_num
        real(real64) :: res

        call omp_set_num_threads(1)
        !$omp parallel
        write(*, *) "Hi! This is thread number:", omp_get_thread_num()
            !$omp single
                write(*, *) "There are ", omp_get_num_threads(), " total number of threads"
            !$omp end single
        !$omp end parallel


        res = 1
    end function proc_ex2

end module ex2