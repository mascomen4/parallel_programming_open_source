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
    ! Здесь должен быть ваш код
  end subroutine quicksort
  
  ! Разбиение Ломуто
  function partition(A, left, right)
    implicit none
    integer(int64), intent(in) :: left, right
    integer(int64), dimension(1:), intent(inout) :: A
    ! Здесь должен быть ваш код
  end function partition
  
  subroutine swap(a, b)
    implicit none
    integer(int64), intent(inout) :: a, b
    ! Здесь должен быть ваш код
  end subroutine swap
end module quick_sort