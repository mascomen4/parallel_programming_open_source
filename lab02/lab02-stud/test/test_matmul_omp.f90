include "../src/matrix_multiplication.f90"
include '../../stats.f90'

program test_matmul_omp
  use iso_fortran_env, only: int32, int64, real32, real64
  use matrix_multiplication
  use stats
  implicit none
  include "omp_lib.h"
  
  real(real32), dimension(:, :), allocatable :: A, B, C
  integer(int64) :: n, m, p
  
  ! Максимальное число нитей
  integer(int32), parameter :: max_threads_num = 16
  integer(int32), parameter :: test_num = 10
  ! Для вычисления среднего времени
  real (real64) :: avg_T
  real (real64) :: t1, t2
  integer(int32) :: tn, i
  
  n = 1000
  m = 1000
  p = 1000

  allocate(A(1:n, 1:m), B(1:m, 1:p), C(1:n, 1:p))

  do tn = 1,max_threads_num,1
    ! Повторяем вычисления несколько раз и находим среднее
    do i = 1,test_num,1
      t1 = omp_get_wtime(t1)
      C = block_matmul(A, B, tn)
      t2 = omp_get_wtime(t2)
      call online_average(i, t2 - t1, avg_T)
    end do
    print '(i4,",",G0)', tn, avg_T
    ! call sleep(1)
  end do

  deallocate(A, B, C)
end program test_matmul_omp