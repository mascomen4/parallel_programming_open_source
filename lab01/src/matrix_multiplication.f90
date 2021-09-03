include "./src/calc_array_bounds.f90"
module matrix_multiplication
  use iso_fortran_env, only: int32, int64, real32, real64
  use calc_array_bounds, only: calc_matrix_slice
  implicit none
  
  private
  public :: naive_matmul, block_matmul
  
  !-------------------------------------------------------------
  interface naive_matmul
    module procedure :: naive_matmul_r4, naive_matmul_r8
  end interface naive_matmul
  
  interface block_matmul
    module procedure :: block_matmul_r4, block_matmul_r8
  end interface block_matmul
  !-------------------------------------------------------------
  contains
  
  !-------------------------------------------------------------
  ! Наивная реализация умножения для 4 байт float
  ! C = A * B
  !-------------------------------------------------------------
  pure function naive_matmul_r4(A, B) result(C)
    implicit none
    real(real32), dimension(1:, 1:), intent(in) :: A, B
    real(real32), dimension(1:size(A, dim=1), 1:size(B, dim=2)) :: C
    ! Здесь должен быть ваш код
  end function naive_matmul_r4
  
  !-------------------------------------------------------------
  ! Наивная реализация умножения для 8 байт float
  ! C = A * B
  !-------------------------------------------------------------
  pure function naive_matmul_r8(A, B) result(C)
    implicit none
    real(real64), dimension(1:, 1:), intent(in) :: A, B
    real(real64), dimension(1:size(A, dim=1), 1:size(B, dim=2)) :: C
    ! Здесь должен быть ваш код
  end function naive_matmul_r8
  
  !-------------------------------------------------------------
  ! Умножение матриц путем разбиения на блоки для real 32
  !-------------------------------------------------------------
  pure function block_matmul_r4(A, B) result(C)
    implicit none
    real(real32), dimension(1:, 1:), intent(in) :: A, B
    real(real32), dimension(1:size(A, dim=1), 1:size(B, dim=2)) :: C
    ! Здесь должен быть ваш код
  end function block_matmul_r4
  
  !-------------------------------------------------------------
  ! Умножение матриц путем разбиения на блоки для real 64
  !-------------------------------------------------------------
  pure function block_matmul_r8(A, B) result(C)
    implicit none
    real(real64), dimension(1:, 1:), intent(in) :: A, B
    real(real64), dimension(1:size(A, dim=1), 1:size(B, dim=2)) :: C
    ! Здесь должен быть ваш код
  end function block_matmul_r8
  
end module matrix_multiplication