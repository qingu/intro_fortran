subroutine external_proc()
  implicit none

  print*, "external_proc is a external procedure"
end subroutine external_proc

integer function add_int(x,y)
  implicit none
  integer,intent(in) :: x,y

  add_int = x + y
end function add_int

module mod_a
  implicit none
  abstract interface
    integer function simple_math(x,y)
      implicit none
      integer,intent(in) :: x,y
    end function simple_math
  end interface
contains
  subroutine mod_proc()
    print*, "mod_proc a module procedure"
  end subroutine mod_proc
  integer function do_math(a,b,op)
    implicit none
    integer,intent(in) :: a,b
    procedure(simple_math),pointer  :: op

    do_math = op(a,b)
  end function do_math
end module mod_a

program main
  use mod_a
  implicit none
  real :: a,b,c
  real :: minus,m,n
  minus(m,n) = (m-n)
  interface
    integer function add_int(x,y)
      implicit none
      integer,intent(in) :: x,y
    end function add_int
  end interface
  procedure(add_int),pointer :: funcp => null()


  a = 2.0

  ! internal procedure by host assoication using contains
  b = square(a)

  ! sqrt is a intrinsic procedure from Fortran Standard
  c = sqrt(b)

  ! external procedure
  call external_proc()

  ! module procedure
  call mod_proc()

  ! statement function, only one statement
  write(0,*) "statement function minus result",minus(3.0,2.0)

  ! dummy procedure
  funcp => add_int
  c = do_math(1, 2, funcp)

  print*,'c=',c
contains
  real function square(x)
    implicit none
    real,intent(in) :: x

    print*, "square is a internal procedure"
    square = x * x
  end function square
end
