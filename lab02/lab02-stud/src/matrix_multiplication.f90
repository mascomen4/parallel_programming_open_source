! Включаем модуль, который должен быть реализован в первой
! лабораторной работе. Если вы его разместили в ином месте,
! то изменить относительный путь до него.
include "../../lab01/src/calc_array_bounds.f90"
module matrix_multiplication
  use iso_fortran_env, only: int32, int64, real32, real64
  use calc_array_bounds, only: calc_matrix_slice
  implicit none
  include "omp_lib.h"  
  private
  public :: block_matmul
  
  !------------------------------------------------------------- 
  interface block_matmul
    module procedure :: block_matmul_r4, block_matmul_r8
  end interface block_matmul
  !-------------------------------------------------------------
  contains 

  !-------------------------------------------------------------
  ! Умножение матриц путем разбиения на блоки для real 32
  !-------------------------------------------------------------
  function block_matmul_r4(A, B, max_threads_num) result(C)
    implicit none
    real(real32), dimension(1:, 1:), intent(in) :: A, B
    integer(int32), intent(in)  :: max_threads_num
    real(real32), dimension(1:size(A, dim=1), 1:size(B, dim=2)) :: C
    
    ! здесь должен быть ваш код
    C = 0 ! удалите эту строку
  end function block_matmul_r4
  
  !-------------------------------------------------------------
  ! Умножение матриц путем разбиения на блоки для real 64
  !-------------------------------------------------------------
  function block_matmul_r8(A, B, max_threads_num) result(C)
    implicit none
    real(real64), dimension(1:, 1:), intent(in) :: A, B
    integer(int32), intent(in)  :: max_threads_num
    real(real64), dimension(1:size(A, dim=1), 1:size(B, dim=2)) :: C
    ! здесь должен быть ваш код
    C = 0 ! удалите эту строку
  end function block_matmul_r8
  
end module matrix_multiplication