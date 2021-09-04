module quick_sort
  use iso_fortran_env, only: int32, int64
  implicit none
  private
  public :: quicksort
  contains
  ! Основная процедура
  recursive subroutine quicksort(A, left, right)
    implicit none
    integer(int64), intent(in) :: left, right
    integer(int64), dimension(1:), intent(inout) :: A
    integer(int64) :: q
    ! Здесь должен быть ваш код
    if (left < right) then
      q = partition(A, left, right)
      call quicksort(A, left, q - 1)
      call quicksort(A, q + 1, right)
    end if

  end subroutine quicksort
  
  ! Разбиение Ломуто
  function partition(A, left, right) result(i)
    implicit none
    integer(int64), intent(in) :: left, right
    integer(int64), dimension(1:), intent(inout) :: A
    ! Здесь должен быть ваш код
    real :: x
    integer(int64) ::  i, j
    x = A(right)
    i = left - 1
    j = 0

    do j = left, right - 1, 1
      if (A(j) <= x) then
        i = i + 1
        call swap(A(i), A(j))
      end if
    end do
    call swap(A(i+1), A(right))
    i = i + 1
  end function partition
  
  subroutine swap(a, b)
    implicit none
    integer(int64), intent(inout) :: a, b
    integer(int64) :: tmp
    ! Здесь должен быть ваш код
    tmp = a
    a = b
    b = tmp
  end subroutine swap
end module quick_sort