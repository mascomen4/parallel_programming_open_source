!include "lab03/lab03-stud/src/random.f90"

module support
    use iso_fortran_env
    use random
    implicit none

    contains
    function birthdays(n)
        implicit none
        integer(int64), intent(in) :: n
        integer :: birthdays
        integer(int64) :: i, j
        integer(int64), dimension(n) :: birthdays_dates

        birthdays_dates = 0
        birthdays = 0
        do i = 1,n,1
            birthdays_dates(i) = randomint(365)
        end do

        do i = 1,n-1,1
            if (birthdays == 1) then
                exit
            end if
            do j = i+1,n,1
                if (birthdays_dates(i) == birthdays_dates(j)) then
                    birthdays = 1
                    exit
                end if
            end do
        end do
    end function birthdays

end module support


program test_birthdays
    use iso_fortran_env
    use random
    use support
    implicit none
    include "omp_lib.h"



    integer(int64) :: i,j
    integer(int64), parameter :: number_of_persons = 100
    integer(int64), parameter :: number_of_turns = 10**6
    integer(int64) :: coincidence_amount
    real(real64) :: coincidence_rate
!    integer, dimension(1:number_of_persons) :: birthdays
    integer :: optimal_threads_num

    optimal_threads_num = omp_get_max_threads()

    do i = 2,number_of_persons,1
        coincidence_amount = 0
        !$omp parallel num_threads(optimal_threads_num)
        !$omp do reduction(+ : coincidence_amount)
        do j = 1,number_of_turns,1
            coincidence_amount = coincidence_amount + birthdays(i)
        end do
        !$omp end do
        !$omp end parallel
        coincidence_rate = dble(coincidence_amount)/dble(number_of_turns)
        print '(i4,",",G0)', i, coincidence_rate
    end do

end program test_birthdays