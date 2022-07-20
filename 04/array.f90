subroutine sub_array(arr1,arr2,n)
  implicit none
  integer,intent(in) :: n
  integer :: arr1(n)
  !assumed-shape arrays
  !下标可以缺省为1，也可以显式指定
  real,dimension(:) :: arr2
  !real,dimension(-4:) :: arr2

  !自动数组
  integer :: auto_arr(n)
  integer :: local_arr(10)

  auto_arr(:) = arr1(:)

  print*, '哑元数组arr1大小',size(arr1)

  print*, '假定形状哑元数组arr2特征'
  print*, 'lbound=',lbound(arr2)
  print*, 'ubound=',ubound(arr2)
  print*, 'shape=',shape(arr2)
end subroutine sub_array


program main
  implicit none
  !数组构造器初始化
  integer :: a(5) = (/1,2,3,4,5/)
  !使用dimension声明维数
  integer,dimension(2,2) :: b
  !Fortran数组下标默认从1开始，
  !但可以指定不从1开始
  real    :: c(-5:5)

  integer :: i,j,k
  interface 
    subroutine sub_array(arr1,arr2,n)
       implicit none
       integer,intent(in) :: n
       integer :: arr1(n)
       real,dimension(:) :: arr2
    end subroutine sub_array
  end interface

  print*, '数组名代表所有元素', a
  print*, '数组某个元素', a(3)
  print*, '连续数组片段',a(2:3)
  print*, '不连续数组片段',a(1:5:2)

  !Fortran数组是列主元存储方式，与C相反
  k = 0
  do j = 1, 2
    do i = 1, 2
      b(i,j) = k
      k = k + 1
    end do
  end do
  print*,b(:,:)

  !针对数组的内置函数
  print*, '数组元素个数size(b)=',size(b)
  print*, '数组下边界lbound(b)=',lbound(b)
  print*, '数组下边界lbound(b,2)=',lbound(b,2)
  print*, '数组上边界ubound(b)=',ubound(b)
  print*, '数组形状shape(c)',shape(c)

  print*, '数组求和sum()', sum(b)
  print*, '数组求最大值及其位置',maxval(b),maxloc(b)
  print*, '数组求最小值及其位置',minval(b),minloc(b)

  CALL sub_array(a,c,size(a))
  CALL sub_array(a,c,size(a)-1)

end
