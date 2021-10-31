program testing
use iso_fortran_env
implicit none

complex :: z = (-1.e0, .5e0)
write (*,*) abs(z)
end program testing
