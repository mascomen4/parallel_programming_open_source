! Created by ivan on 11.09.2021.

module different_threads_num_ex2
    use omp_lib
    use iso_fortran_env
    implicit none
    private
    public :: threads_ex2_std_read, threads_ex2_arg_parse, threads_ex2_env_parse
contains

    function threads_ex2_std_read(array) result(res)
        implicit none
        real(real64), dimension(1:), intent(in) :: array
        integer(int32) :: threads_num
        real(real64) :: res
        integer thread_num, i, length, last_thread, iterator

        read(*, *) thread_num
        call omp_set_num_threads(threads_num)
        length = size(array, 1)
        res = 0.0
        !$omp parallel shared(array, threads_results) reduction(+ : res)
        do i = omp_get_thread_num() + 1, length, 4
            res = res + array(i)
        end do

        write (*,*) "The thread number ", omp_get_thread_num(), " got the result", res
        !$omp end parallel
        print *, "Res is ", res
    end function threads_ex2_std_read

    elemental subroutine str2int(str,int,stat)
        implicit none
        ! Arguments
        character(len=*),intent(in) :: str
        integer,intent(out)         :: int
        integer,intent(out)         :: stat

        read(str,*,iostat=stat)  int
    end subroutine str2int

    function threads_ex2_arg_parse(array) result(res)
        implicit none
        real(real64), dimension(1:), intent(in) :: array
        integer(int32) :: threads_num, int, stat
        real(real64) :: res
        integer thread_num, i, length
        character(len=32) :: arg


        i=0
        call get_command_argument(i, arg)
        if (len_trim(arg) /= 0) then
            write (*,*) trim(arg)
            call str2int(arg, int, stat)
            print *, "The ", arg, " was converted to int ", int
        end if

        call omp_set_num_threads(threads_num)
        length = size(array, 1)
        res = 0.0
        !$omp parallel shared(array, threads_results) reduction(+ : res)
        do i = omp_get_thread_num() + 1, length, 4
            res = res + array(i)
        end do

        write (*,*) "The thread number ", omp_get_thread_num(), " got the result", res
        !$omp end parallel
        print *, "Res is ", res
    end function threads_ex2_arg_parse

    function threads_ex2_env_parse(array) result(res)
        implicit none
        real(real64), dimension(1:), intent(in) :: array
        integer(int32) :: threads_num
        real(real64) :: res
        integer thread_num, i, length, last_thread, iterator

        call omp_set_num_threads(threads_num)
        length = size(array, 1)
        res = 0.0
        !$omp parallel shared(array, threads_results) reduction(+ : res)
        do i = omp_get_thread_num() + 1, length, 4
            res = res + array(i)
        end do

        write (*,*) "The thread number ", omp_get_thread_num(), " got the result", res
        !$omp end parallel
        print *, "Res is ", res
    end function threads_ex2_env_parse
end module different_threads_num_ex2