module calc_array_bounds
use iso_fortran_env, only: int32, int64
private
public :: calc_vector_slice, calc_matrix_slice
contains
! Функция вычисляет границы срезов одномерного массива,
! с которыми должен работать поток с номером thread_num
! Аргументы:
!   thread_num - номер потока
!   max_threads_num - общее число потоков
!   bounds - начальный и конечный индексы массива
!   slice - результат вычислений
 pure function calc_vector_slice(thread_num, max_threads_num, bounds) result (slice)
  implicit none
  integer(int32), intent(in) :: thread_num, max_threads_num
  integer(int64), intent(in), dimension(1:2) :: bounds
  integer(int64), dimension(1:2) :: slice
  ! Здесь должен быть ваш код
  integer(int32) :: slice_size
  integer(int32) :: slice_left
  integer(int32) :: slice_right
  real :: difference

  difference = (bounds(2) - bounds(1)) / max_threads_num
  ! write (*, *), "Difference ", difference
  slice_size = floor( difference )

  if (thread_num == max_threads_num - 1) then
    slice_left = bounds(1) + thread_num*(slice_size - 1)
    slice_right = slice_left + slice_size - 1
  else
    slice_left = bounds(1) + thread_num*(slice_size - 1)
    slice_right = max_threads_num
  end if

  slice = [slice_left, slice_right]
end function calc_vector_slice


! Функция вычисляет границы срезов двумерного массива,
! с которыми должен работать поток с номером thread_num
! Аргументы:
!   th_i, th_j - номер индексы блока, доставшегося потоку
!   max_threads_num - общее число потоков
!   bounds - начальный и конечный индексы массива по двум измерениям
!   slice - границы вырезки массива
pure function calc_matrix_slice(th_i, th_j, max_threads_num, bounds) result(slice)
  implicit none
  integer(int32), intent(in) :: th_i, th_j, max_threads_num
  integer(int64), dimension(1:2,1:2), intent(in) :: bounds
  integer(int64), dimension(1:2,1:2) :: slice
  ! Здесь должен быть ваш код
end function calc_matrix_slice

end module calc_array_bounds
