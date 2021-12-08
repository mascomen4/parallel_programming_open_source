include 'lab03-stud/src/random.f90'
module games
    use iso_fortran_env
    use omp_lib
    use random
    implicit none

    contains

    function tokens_game(x, y, z, cycles) result(avg_length)
        implicit none
        integer, intent(in) :: x, y, z, cycles
        integer, dimension(1:cycles) :: rounds
        integer :: i, counter, tmp, copy_x, copy_y, copy_z
        real :: avg_length

        copy_x = x
        copy_y = y
        copy_z = z

        !$omp parallel
            !$omp do
            do i=1, cycles
                counter = 0
                do while (copy_x /= 0 .or. copy_y /= 0 .or. copy_z /= 0)
                    tmp = randomint(3)
                    if (tmp == 1) then
                        copy_x = copy_x + 2
                        copy_y = copy_y - 1
                        copy_z = copy_z - 1
                    else if (tmp == 2) then
                        copy_y = copy_y + 2
                        copy_x = copy_x - 1
                        copy_z = copy_z -1
                    else if (tmp == 3) then
                        copy_z = copy_z + 2
                        copy_y = copy_y - 1
                        copy_x = copy_x - 1
                    end if
                    counter = counter + 1
                end do
                rounds(i) = counter
            end do
            !$omp end do
        !$omp end parallel

        avg_length = sum(rounds) / size(rounds)

    end function tokens_game


end module games


program main
    use iso_fortran_env
    use omp_lib
    use games
    implicit none

    integer x, y, z, cycles
    real res

    write (*, *) "Задача о жетонах. Имеем 3 игрока, бросают кости &
            за более подробным условием обратитесь к заданию "
    write (*, *) "Исходом на вывод подается среднее число раундов для &
            прекращения игры"
    write(*, *)
    write(*, *) "Введите следующие параметры: x, y, z, cycles. x, y, z - &
            Изначальное количество жетонов у игроков 1, 2, 3 соотвественно &
            Cycles - желаемое количество повторений, например, 10**6..."
    write(*, *)
    read (*, *) x, y, z, cycles
    write (*, *) "Read success. Processing..."

    res = tokens_game(x, y, z, cycles)

    write(*, *) "Обработка произошла успешно."
    write(*, *) "Среднее количество раундов до конца игры: ", res

end program main