!!! main.f90
program main
  implicit none
  integer,external :: add
  !interface 
  !  integer function add(a,b)
  !    implicit none
  !    integer,intent(in) :: a,b
  !end interface


  print*,add(2.0,3.0)
end
