include "../src/calc_array_bounds.f90"

program test_array_bounds
  use iso_fortran_env, only: int32, int64
  use calc_array_bounds
  implicit none
  
  integer :: max_threads_num
  integer :: thread_num
  
  integer(int64), dimension(1:2) :: vector_bounds
  integer(int64), dimension(1:2) :: vector_slice

  integer(int64), dimension(1:2,1:2) :: matrix_bounds
  integer(int64), dimension(1:2,1:2) :: matrix_slice
  
  integer(int64), dimension(:, :), allocatable :: test_bounds

  integer(int32) :: i, j
  !----------------------------------------------------------------
  !         Тест №1
  !----------------------------------------------------------------
  vector_bounds = [-100, 100]
  max_threads_num = 7

  allocate(test_bounds(0:max_threads_num,1:2))

  test_bounds(0,:) = [ -100, -73 ]
  test_bounds(1,:) = [ -72, -45 ]
  test_bounds(2,:) = [ -44, -17 ]
  test_bounds(3,:) = [ -16, 11 ]
  test_bounds(4,:) = [ 12, 39 ]
  test_bounds(5,:) = [ 40, 67 ]
  test_bounds(6,:) = [ 68, 100 ]

  do thread_num = 0,max_threads_num-1,1
    vector_slice = calc_vector_slice(thread_num, max_threads_num, vector_bounds)
    print *, vector_slice == test_bounds(thread_num, :)
  end do

  deallocate(test_bounds)

  !----------------------------------------------------------------
  !         Тест №2
  !----------------------------------------------------------------
  vector_bounds = [1, 10000]
  max_threads_num = 11

  allocate(test_bounds(0:max_threads_num,1:2))

  test_bounds(0,:) = [1, 909]
  test_bounds(1,:) = [910, 1818]
  test_bounds(2,:) = [1819, 2727]
  test_bounds(3,:) = [2728, 3636]
  test_bounds(4,:) = [3637, 4545]
  test_bounds(5,:) = [4546, 5454]
  test_bounds(6,:) = [5455, 6363]
  test_bounds(7,:) = [6364, 7272]
  test_bounds(8,:) = [7273, 8181]
  test_bounds(9,:) = [8182, 9090]
  test_bounds(10,:) = [9091, 10000]

  do thread_num = 0,max_threads_num-1,1
    vector_slice = calc_vector_slice(thread_num, max_threads_num, vector_bounds)
    print *, vector_slice == test_bounds(thread_num, :)
  end do

  deallocate(test_bounds)

  !----------------------------------------------------------------
  !         Тест №3
  !----------------------------------------------------------------
  vector_bounds = [-1546, 1161]
  max_threads_num = 13

  allocate(test_bounds(0:max_threads_num,1:2))

  test_bounds(0,:) = [-1546, -1339]
  test_bounds(1,:) = [-1338, -1131]
  test_bounds(2,:) = [-1130, -923]
  test_bounds(3,:) = [-922, -715]
  test_bounds(4,:) = [-714, -507]
  test_bounds(5,:) = [-506, -299]
  test_bounds(6,:) = [-298, -91]
  test_bounds(7,:) = [-90, 117]
  test_bounds(8,:) = [118, 325]
  test_bounds(9,:) = [326, 533]
  test_bounds(10,:) = [534, 741]
  test_bounds(11,:) = [742, 949]
  test_bounds(12,:) = [950, 1161]

  do thread_num = 0,max_threads_num-1,1
    vector_slice = calc_vector_slice(thread_num, max_threads_num, vector_bounds)
    print *, vector_slice == test_bounds(thread_num, :)
  end do

  deallocate(test_bounds)

  !-----------------------------------------------------------------------
  !     Границы блоков матрицы
  !-----------------------------------------------------------------------
  matrix_bounds(1, :) = [1, 7]
  matrix_bounds(2, :) = [1, 9]
  
  max_threads_num = 4
  
  10 format('[',i3, ':', i3,',', i3, ':', i3, '] ')
  ! 11 format('(matrix_slice(1,:) == ','[',i0,',',i0,']) &
             ! &.and. (matrix_slice(2,:) == ','[',i0,',',i0,'])')

  do i = 0,max_threads_num-1,1
    do j = 0,max_threads_num-1,1
      matrix_slice = calc_matrix_slice(i, j, max_threads_num, matrix_bounds)
      write(fmt=10, unit=*, advance='no') matrix_slice(1,:), matrix_slice(2,:)
    end do
    print *, ""
  end do
  
end program test_array_bounds
