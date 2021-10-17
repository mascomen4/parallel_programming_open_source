include "../src/threads.f90"
program test_threads
  use iso_fortran_env, only: int32, int64, real32, real64
  use threads
  implicit none
  
  integer(int32) :: array_size
  integer(int32) :: max_threads_num
  integer(int32) :: i, j
  integer(int32), allocatable, dimension(:) :: array
  integer(int32), allocatable, dimension(:) :: test_array
  
  !------------------------------------------------------------------------
  ! Test no 1
  !------------------------------------------------------------------------
  array_size = 50
  max_threads_num = 4
  allocate(array(array_size), test_array(array_size))
  
  j = 0
  do i = 1,48,12
    test_array(i:i+11) = j
    j = j + 1
  end do
  test_array(49:50) = 3
  
  ! test_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &
                ! 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, &
                ! 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, &
                ! 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
  
  call test_omp(array, max_threads_num)
  
  print *, all(array == test_array)
  
  deallocate(array, test_array)
  
  !------------------------------------------------------------------------
  ! Test no 2
  !------------------------------------------------------------------------
  array_size = 111
  max_threads_num = 14
  allocate(array(array_size), test_array(array_size))

  test_array(1:7) = 0
  test_array(8:14) = 1
  test_array(15:21) = 2
  test_array(22:28) = 3
  test_array(29:35) = 4
  test_array(36:42) = 5
  test_array(43:49) = 6
  test_array(50:56) = 7
  test_array(57:63) = 8
  test_array(64:70) = 9
  test_array(71:77) = 10
  test_array(78:84) = 11
  test_array(85:91) = 12
  test_array(92:111) = 13
  
  ! Более коротко, но менее наглядно с помощью цикла
  j = 0
  do i = 1,91,7
    test_array(i:i+6) = j
    j = j + 1
  end do
  test_array(92:111) = 13
  

  
  call test_omp(array, max_threads_num)
  
  print *, all(array == test_array)
  ! print '(12(i0,", ",1x))', array
  
  deallocate(array, test_array)
  
  !------------------------------------------------------------------------
  ! Test no 3
  !------------------------------------------------------------------------
  array_size = 100
  max_threads_num = 1
  allocate(array(array_size), test_array(array_size))
  
  test_array = 0
  
  call test_omp(array, max_threads_num)
  
  print *, all(array == test_array)
  ! print '(12(i0,", ",1x))', array
  
  deallocate(array, test_array)
  
  !------------------------------------------------------------------------
  ! Test no 4
  !------------------------------------------------------------------------
  array_size = 20
  max_threads_num = 20
  allocate(array(array_size), test_array(array_size))
  
  test_array = [(i, i=0,19,1)]
  
  call test_omp(array, max_threads_num)
  
  print *, all(array == test_array)
  
  deallocate(array, test_array)
  
end program test_threads