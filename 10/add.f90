!!! add.f90
integer function add(a,b)
  implicit none
  integer,intent(in) :: a,b

  add = a + b
end function add

