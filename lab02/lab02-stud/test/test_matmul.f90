include "../src/matrix_multiplication.f90"

program test_matmul
  use iso_fortran_env, only: int32, int64, real32, real64
  use matrix_multiplication
  implicit none
  
  integer(int64) :: n, m, p
  
  real(real32), dimension(:, :), allocatable :: A, B, C
  real(real64), dimension(:, :), allocatable :: X, Y, Z
  
  ! Размерность матриц из файлов
  n = 50; m = 40; p = 32
  
  allocate(A(1:n, 1:m), B(1:m, 1:p), C(1:n, 1:p))
  allocate(X(1:n, 1:m), Y(1:m, 1:p), Z(1:n, 1:p))
  
  ! Файлы с проверочными матрицами
  open(10, file='data/A.csv', access='sequential', form="formatted")
  open(11, file='data/B.csv', access='sequential', form="formatted")
  open(12, file='data/C.csv', access='sequential', form="formatted")
  
  ! Считаем проверочные матрицы
  ! real32
  read(10, *) A; rewind(10)
  read(11, *) B; rewind(11)
  read(12, *) C; rewind(12)
  ! real64  
  read(10, *) X; rewind(10)
  read(11, *) Y; rewind(11)
  read(12, *) Z; rewind(12)
  
  ! Файлы содержат целочисленные матрицы
  ! поэтому вычисления должны быть точны
  print * , all(C == block_matmul(A, B, 4))
  print * , all(Z == block_matmul(X, Y, 4))

  ! Закроем файлы
  close(10); close(11); close(12)
  
  deallocate(A, B, C)
  deallocate(X, Y, Z)
  
end program test_matmul