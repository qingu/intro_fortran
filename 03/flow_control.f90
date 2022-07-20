program main
  implicit none
  integer :: input
  integer :: a(10),b(10)
  integer :: c(10,10,10)
  integer :: i,j,k
  real    :: r


  !从键盘读入一个整型值
  read(*,*) input

  !多重IF分支及嵌套
  if (input < 0) then
     print*, 'input is negative'
  else if (input < 10) then
     print*, 'input is postive and < 10'
     if (mod(input,2) == 0) then
         print*, 'input is even'
     else
         print*, 'input is odd'
     endif
  else
     print*, 'input is >= 10 postive'
  endif

  ! SELECT CASE结构
  select case(input)
  case(0)
      print*, 'input = 0'
  case(1:9)
      print*, '1 <= input <= 9'
  case(10:)
      print*, 'input > 10'
  case default
      stop 'not allowed negative'
  end select

  !DO循环
  b = 1

  !(start,end,stride)
  do i = 1, 10, 2
    a(i) =  b(i) + i
  end do
  print*,a(:)

  !迭代变量是实型
  !编译器出现警告，但不会报错
  !不建议
  do r = 1.0, 10.0, 1.0
    print*, 'r=',r
  end do

  !stride=1时可以省略
  do i = 1, 10
    a(i) =  b(i) + i
  end do
  print*,a(:)

  !DO WHILE结构
  !下面循环代码块等价于上面DO循环
  i = 1
  do while (i <= 10)
    a(i) =  b(i) + i
    i = i + 1
  end do
  print*,a(:)

  ! DO ... END DO
  i = 1
  do 
    a(i) =  b(i) + i
    i = i + 1
    if (i > 10) exit
  end do
  print*,a(:)
  
  ! CYCLE
  do i = 1, 10
    if (mod(i,2) == 0) cycle
    a(i) =  b(i) + i
  end do
  print*,a(:)

  !多重DO循环嵌套
  loop_k:do k = 1, 10
    loop_j:do j = 1, 10
      loop_i:do i = 1, 10

        c(i,j,k) = i + j + k

      end do loop_i
    end do loop_j
  end do loop_k

    
end
