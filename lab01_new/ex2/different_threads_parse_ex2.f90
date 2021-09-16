! Created by ivan on 11.09.2021.

! FOR POINT 2
! This module consists of the functions, which makes the same as the function proc_ex2 declared in ex2_point4.f90.
! These functions are just made to get the number of threads from different sources.

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
        integer(int32) :: threads_num, i, length
        real(real64) :: res

        write (*,*) "Standard read function starting..."
        print *, "Please, enter the desired number of threads: "
        read(*, *) threads_num
        call omp_set_num_threads(threads_num)
        length = size(array, 1)
        res = 0.0

        !$omp parallel shared(array) reduction(+ : res)
        do i = omp_get_thread_num() + 1, length, 4
            res = res + array(i)
        end do

        !$omp single
            write (*,*) "There are ", omp_get_num_threads(), " threads"
        !$omp end single

        write (*,*) "The thread number ", omp_get_thread_num(), " got the result", res
        !$omp end parallel

        print *, "Res is ", res
        print *
    end function threads_ex2_std_read



    function threads_ex2_arg_parse(array) result(res)
        ! Функция для парсинга аргументов командной строки для определения количества потоков.
        ! Если вы работаете с IDE Clion, то во вкладке "Edit configurations" вы можете найти пункт "Program agruments",
        ! где я вставил значение 3. Вы можете вставить собственное значение.
        implicit none

        real(real64), dimension(1:), intent(in) :: array
        integer, dimension(:), allocatable :: values
        character(len=30) :: argv
        integer(int32) :: threads_num, int, stat
        real(real64) :: res
        integer thread_num, i, length
        character(len=32) :: arg

        write (*,*) "Args parse function starting..."

        ! ----- Кусок кода заимствован у преподавателя -----

        ! Выделяем память по массив значений
        allocate(values(1:command_argument_count()))

        do i = 1,command_argument_count()
            call get_command_argument(i, argv)
            ! Конвертируем тип character в тип double precision
            read(argv, *) values(i)
        end do
        ! print *, values

        ! ----- Конец заимствования у преподавателя -----

        threads_num = values(1)
        call omp_set_num_threads(threads_num)
        length = size(array, 1)
        res = 0.0

        !$omp parallel shared(array) reduction(+ : res)
        do i = omp_get_thread_num() + 1, length, 4
            res = res + array(i)
        end do

        !$omp single
        write (*,*) "There are ", omp_get_num_threads(), " threads"
        !$omp end single

        write (*,*) "The thread number ", omp_get_thread_num(), " got the result", res
        !$omp end parallel

        print *, "Res is ", res
        print *
    end function threads_ex2_arg_parse



    function threads_ex2_env_parse(array) result(res)
        ! Функция для определения количества потоков с помощью переменной окружения. В IDE Clion во вкладке
        ! "Edit Configurations" вы можете найти строку "Environment Variables" где вы можете определить переменную
        ! PARALLEL или OMP_NUM_THREADS (это аналогичные переменные)

        implicit none
        real(real64), dimension(1:), intent(in) :: array
        integer(int32) :: threads_num
        real(real64) :: res
        integer thread_num, i, length, last_thread, iterator

        write (*,*) "Environment variable read function starting..."

        length = size(array, 1)
        res = 0.0
        !$omp parallel shared(array) reduction(+ : res)
        do i = omp_get_thread_num() + 1, length, 4
            res = res + array(i)
        end do

        !$omp single
        write (*,*) "There are ", omp_get_num_threads(), " threads"
        !$omp end single

        write (*,*) "The thread number ", omp_get_thread_num(), " got the result", res
        !$omp end parallel

        print *, "Res is ", res
        print *
    end function threads_ex2_env_parse
end module different_threads_num_ex2