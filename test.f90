program main
    real, parameter :: pi = 3.141593
    real :: a = 10.
    select case ( a * sqrt(pi) )
    case (0:)
        write (*,*) 'a > 0'
    case (:0)
        write (*,*) 'a < 0'
    case default
        write (*,*) 'a = 0'
    end select
end program main