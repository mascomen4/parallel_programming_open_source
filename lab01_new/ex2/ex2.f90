! Created by ivan on 10.09.2021.

! QUESTIONS:

!Сколько потоков эффективно поддерживает ваш процессор? 4
!Как можно узнать эту информацию? "sudo apt install htop"; in linux bash call "htop"
! Как в OpenMP можно автоматически создать такое количество потоков, которое процессор поддерживает
!оптимально? "n = omp_get_max_threads()", and then "call omp_set_num_threads(n)"

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
        integer thread_num, i, length
        real(real64), dimension(1:threads_num) :: threads_results

        ! TODO: Place the code for POINT 1 into the other file.
        ! TODO: Add the automated processing of the parameter threads_num through: std input, command arg, env variable
! FOR POINT 1
!        call omp_set_num_threads(threads_num)
!        !omp parallel
!        write(*, *) "Hi! This is thread number:", omp_get_thread_num()
!            !omp single
!                write(*, *) "There are ", omp_get_num_threads(), " total number of threads"
!            !omp end single
!        !omp end parallel

! FOR POINT 4
        call omp_set_num_threads(threads_num)
        length = size(array, 1)
        res = 0.0
        !$omp parallel shared(array, threads_results)
            ! Возможно, тот кто смотрит хочет поместить omp_get_thread_num() в переменную. Но я пробовал:
            ! по какой-то причине я получал непредсказемое поведение. Если хочешь, проверь)
            do i = omp_get_thread_num() + 1, length, 4
                !In the test cases it's not necessary
                !print *, "Summing el ", i
                res = res + array(i)
            end do

            ! Let's remember also the res of particular thread, not only the total sum.
            if (omp_get_thread_num() + 1 /= 1) then
                threads_results(omp_get_thread_num() + 1) = res - threads_results(omp_get_thread_num())
            else
                threads_results(omp_get_thread_num() + 1) = res
            end if

            write (*,*) "The thread number ", omp_get_thread_num(), " got the result", threads_results(omp_get_thread_num() + 1)
        !$omp end parallel

    end function proc_ex2

end module ex2