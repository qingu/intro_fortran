program main
  implicit none
  integer   :: a
  real      :: b
  logical   :: bool

  !表达式 vs 赋值语句
  ! 1+1
  !算术表达式注意操作符优先级
  !复杂算术表达式建议用()区分
  !注意整除操作与浮点数除区别
  a = 1 + 2 * 3 / 4 ** 2 - 10
  b = 1 + 2 * 3.0 / 4 ** 2 - 10

  print*, 'a = ',a
  print*, 'b = ',b
  print*, '整数取余使用mod()函数',mod(9,2)

  !关系运算符与表达式
  print*, ' 1 <  or .LT. 5', 1 < 5
  print*, ' 1 <= or .LE. 5', 1 <= 5
  print*, ' 1 == or .EQ. 5', 1 == 5
  print*, ' 1 /= or .NE. 5', 1 /= 5
  print*, ' 1 >  or .GT. 5', 1 >  5
  print*, ' 1 >= or .GE. 5', 1 >= 5

  !算术运算符优先级高于关系运算符
  print*, ' 1 + 2 < 3 - 1', 1 + 2 < 3 -1

  !逻辑运算符
  !   .AND.      与      A .AND. B
  !   .OR.       或      A .OR.  B
  !   .NOT.      非      .NOT. A
  !   .EQV.      等于    A .EQV. B
  !   .NEQV.     不等    A .NEQV. B

  !逻辑运算符操作数可以是关系表达式
  !逻辑表达式返回值为.TRUE. 或 .FALSE.

  !关系运算符优先级高于逻辑运算符
  print*, 5 > 4 .and. 7 <= 9
end
