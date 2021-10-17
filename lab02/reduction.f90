module reduction
  use iso_fortran_env, only: int32, int64, real32, real64
  implicit none
  private
! Доступные вовне функции и подпрограммы
  public :: omp_sum, omp_max, omp_min
  public :: omp_reduction
  
  abstract interface
    function omp_reduction(A, ths_num)
      double precision, dimension(1:), intent(in) :: A
      integer, intent(in) :: ths_num
      double precision :: omp_reduction
    end function omp_reduction
  end interface
  
  contains
    function omp_sum(A, ths_num) result(S)
      implicit none
      real(real64), dimension(1:), intent(in) :: A
      integer(int32), intent(in) :: ths_num
      integer(int32) :: i
      real(real64) S

      call omp_set_num_threads(ths_num)
      S = 0
      !$omp parallel
      !$omp do reduction(+ : S)
      do i=1, size(A), 1
        S = S + A(i)
      end do
      !$omp end do
      !$omp end parallel
    end function omp_sum

  function omp_max(A, ths_num) result(M)
    implicit none
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: M
    integer(int64) :: length, i
    ! Здесь должен быть ваш код
    M = 0
    !$omp parallel
    !$omp do reduction(max : M)
    do i=1, 10
      if (A(i) > M) then
        M = A(i)
      end if
    end do
    !$omp end do
    !$omp end parallel


  end function omp_max
  
  function omp_min(A, ths_num) result(M)
    implicit none
    real(real64), dimension(1:), intent(in) :: A
    integer(int32), intent(in) :: ths_num
    real(real64) :: M
    integer(int64) :: length, i
    ! Здесь должен быть ваш код
    M = 10**8
    length = size(A)
    !$omp parallel
    !$omp do reduction(min : M)
    do i=1, length, 1
      if (A(i) < M) then
        M = A(i)
      end if
    end do
    !$omp end do
    !$omp end parallel

  end function omp_min
end module reduction

