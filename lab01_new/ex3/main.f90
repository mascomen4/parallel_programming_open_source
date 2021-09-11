! Created by ivan on 11.09.2021.
include "speed_test.f90"

program main
    use omp_lib
    use iso_fortran_env
    use ex3
    use speed_test
    implicit none

    call test()
end program main