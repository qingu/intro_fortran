subroutine swap(x,y)
  implicit none
  integer :: x,y
  integer :: tmp

  tmp = x
  x   = y
  y   = tmp
end subroutine swap

program main
  implicit none
  integer :: a,b

  a = 3
  b = 4
  call swap(a,b)
  write(*,*) 'a =',a,'b=',b
end




