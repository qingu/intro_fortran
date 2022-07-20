program main
  !变量隐式声明关闭
  implicit none
  !**************变量及常量声明区******************
  !常量使用parameter声明，程序运行过程中不会改变
  ! 常量名一般使用大写与普通变量区别开来
  real,parameter   :: PI = 3.14159265
  
  !变量声明type :: var ,如果初始化必须加上::
  integer          :: a1 
  integer          :: a2 = 1
  !integer b = 1   

  !变量命名规则：字母、数字、下划线
  integer          :: b1,b_1
  !下划线不能在最前面
  !integer          :: _b1
  !数字能在最前面
  !integer          :: 1b

  ! KIND
  integer(kind=1)  :: c1
  integer(kind=2)  :: c2
  integer(kind=4)  :: c3 !等价于integer :: c3
  integer(kind=8)  :: c4

  ! 实型
  real(kind=4)     :: c5 !等价于real :: c5
  real(kind=8)     :: c6
  real(kind=16)    :: c7
  !real(kind=32)    :: c8 !32位real不支持

  double precision :: c8  !等价于real*8

  logical          :: is_OK !.TRUE. .FALSE.

  !字符常量，长度可由编译器计算
  character(len=*),parameter :: str = "hello"
  !字符变量,64个字符长度
  character(len=64):: filename 

  !复数类型
  complex          :: comp

  !派生类型,和C语言struct很像
  type student_t
    character(len=128) :: name
    integer            :: age
    integer            :: id
  end type student_t

  !**************语句执行区*****************
  print*,'单字节整形最大可表示数',huge(c1)
  c1 = huge(c1) + 1
  !为什么127 + 1 = -128 ？
  print*, 'c1 = ',c1
  print*,'4字节整形最大可表示数',huge(c3)
  print*,'4字节实型最大可表示数',huge(c5)
  print*,'8字节实型最大可表示数',huge(c6)

  !常数加_kind 表明精度
  c4 = 10_8
  c7 = 1.0_16

  !数据类型隐式转换
  c3 = c4 * 100.0D0 / 3.0

  !数据类型显式转换
  ! int() real() dble() char()
  c3 = int(c4,4)  !等价于int(c4)

  !kind()返回变量精度
  print*, 'kind(c8)= ',kind(c8)
end
