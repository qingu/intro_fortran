subroutine args(a,b,c,d,e,f)
  implicit none
  !普通参数既可以用位置参数也可以
  !使用关键字参数传递
  integer :: a,b,c,d
  !可选参数使用optional说明
  integer,optional :: e,f

  print*,'a=',a
  print*,'b=',b
  print*,'c=',c
  print*,'d=',d

  !可选参数需要使用present()判断
  !直接使用可选参数会导致程序出错
  if (present(e)) then
      print*,'e=',e
  endif
  if (present(f)) then
      print*,'f=',f
  endif

end subroutine args

program main
  implicit none
  integer :: x,y,z,m,n
  interface
    subroutine args(a,b,c,d,e,f)
      implicit none
      integer :: a,b,c,d
      integer,optional :: e,f
    end subroutine args
  end interface

  x = 1; y = 2; z = 3; m = 4; n = 5

  ! x是位置参数方式传递
  ! y,z,m,n 是关键字参数传递方式
  ! 可选参数e没有实参传递
  call args(x, c=y, b=z, d=m, f=n)
end
