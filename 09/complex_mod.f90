module complex_mod
  implicit none
  !访问权限public vs private
  character(len=64),public :: version='v0.1'
  type complex_t
    real :: re
    real :: im
  end type complex_t
contains
  function complex_add(a, b) result(c)
    implicit none
    type(complex_t),intent(in) :: a,b
    type(complex_t)            :: c

    c%re = a%re + b%re
    c%im = a%im + a%im
  end function complex_add

  subroutine print_complex(a)
    implicit none
    type(complex_t),intent(in) :: a

    print *, '------------------------------'
    print *, 'Real  part =',a%re
    print *, 'Image part =',a%im
    print *, '------------------------------'
  end subroutine print_complex
end module complex_mod

program main
  !模块使用，only用法以及别名
  use complex_mod
  implicit none
  type(complex_t) :: v1,v2,v3

  print*, 'Verson= ',trim(version)

  v1 = complex_t(1.0,2.0)

  !v2%re = 7.0
  !v2%im = 8.0
  v2 = complex_t(7.0,8.0)

  v3 = complex_add(v1,v2)

  call print_complex(v3)
end
