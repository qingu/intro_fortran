program main
  implicit none
  type complex_t
    real :: re
    real :: im
  end type complex_t

  type(complex_t) :: v1,v2,v3

  v1 = complex_t(1.0,2.0)

  print*, 'real part of v1',v1%re
  print*, 'image part of v1 ',v1%im

  v2%re = 7.0
  v2%im = 8.0

  v3 = complex_add(v1,v2)
  print*, 'V3 real= ',v3%re,' image= ',v3%im

contains
  function complex_add(a, b) result(c)
    implicit none
    type(complex_t),intent(in) :: a,b
    type(complex_t)            :: c

    c%re = a%re + b%re
    c%im = a%im + a%im
  end function complex_add
end
