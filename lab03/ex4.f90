include 'lab03-stud/src/random.f90'
module player
    use iso_fortran_env
    use omp_lib
    use random
    implicit none

    private
    public :: ruin_player

    contains
    ! multiplier - степень, в которую нужно возвести 10, чтобы при умножении 10^^multiplier на prob,
    !                               получилось целое число.
    ! cycles - количество повторений
    function ruin_player(prob, multiplier, n, total, cycles) result(res)
        implicit none
        real, intent(in) :: prob
        integer, intent(in) :: n, total, multiplier, cycles

        integer :: tmp, i, copy_n, counter, range
        integer, dimension(1:cycles) :: rounds
        logical, dimension(1:cycles) :: outcome

        real :: expect, win_prob
        ! expectation, win_prob
        real, dimension(1:2) :: res

        omp_set_num_threads(4)

        range = prob * (10 ** multiplier)

        !$omp parallel
            !$omp do
            do i=1, cycles
                copy_n = n
                counter = 0
                do while ( (copy_n /= 0) .or. (copy_n /= total) )
                    tmp = randomint(tmp)
                    if (tmp < range) then
                        copy_n = copy_n - 1
                    else
                        copy_n = copy_n + 1
                    end if
                    counter = counter + 1
                end do

                rounds(i) = counter
                if (copy_n == 0) then
                    outcome(i) = .false.
                else if (copy_n == total) then
                    outcome(i) = .true.
                end if

            end do
            !$omp end do
        !$omp end parallel

        expect = sum(rounds) / size(rounds)
        win_prob = count(outcome) / size(outcome)

        res(1) = expect
        res(2) = win_prob
    end function ruin_player

end module player


program main
    use iso_fortran_env
    use player
    implicit none

    real :: prob
    integer :: mult, n, total, cycles

    real, dimension(1:2) :: res

    write (*, *) "Задача о разорении игрока. Имеем общее количество рублей N, &
            и количество рублей у первого игрока n, ", &
            "и вероятность выйгрыша p. Реализация программы также &
            просит ввести параметр multiplicator - степень, в которую &
            нужно возвести 10, чтобы при умножении 10^^multiplier &
            на prob, получилось целое число."
    write (*, *) "Исходом на вывод подается вероятность выйгрыша &
            первого игрока, а также среднее число раундов для &
            прекращения игры"
    write(*, *)
    write(*, *) "Введите следующие параметры: probability, multiplier, &
            n, N, cycles. Cycles - желаемое количество &
            повторений, например, 10**6..."
    write(*, *)
    read (*, *) prob, mult, n, total, cycles
    write (*, *) "Read success. Processing..."

    res = ruin_player(prob, mult, n, total, cycles)

    write(*, *) "Обработка произошла успешно."
    write(*, *) "Вероятность выигрыша при заданных параметрах: ", res(2)
    write(*, *) "Среднее количество раундов до конца игры: ", res(1)

end program main