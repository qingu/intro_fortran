module mod_add
  implicit none
  private
  public :: add   !只提供公开的过程接口
  interface add
    module procedure :: iadd
    module procedure :: radd
  end interface add
contains
  integer function iadd(a,b)
    implicit none
    integer :: a,b

    iadd = a + b
  end function iadd

  real function radd(a,b)
    implicit none
    real :: a,b

    radd = a + b
  end function radd
end module mod_add

program main
  use mod_add
  implicit none

  integer :: x =3, y = 4
  real    :: m =3., n = 4.

  print*,add(x,y)
  print*,add(m,n)

 end
