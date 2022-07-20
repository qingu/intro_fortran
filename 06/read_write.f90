program main
  implicit none
  integer :: a,b
  real    :: c
  namelist /list/ a,b,c

  !与默认设备号I/O
  ! 0 - 标准错误
  ! 5 - 标准输入
  ! 6 - 标准输出

  !星号*代表的含义
  !method1
  !read *, a,b,c
  !print *, a,b,c

  !method2
  read(*,*) a,b,c
  write(*,*) a,b,c

  write(*,*) 'col1,col2,col3'

  !使用FMT表达式
  !write(*,fmt=100) a,b,c
  !100 FORMAT(1X,2(I4.4,','),F10.2) 
  
  write(*,'(1X,2(I4.4,","),F10.2)') a,b,c

  !write(0,*) vs write(6,*) vs print*

  write(6,*) 'standard output'
  write(*,*) 'Also standard output'
  print*, 'Also standard output'
  write(0,*) 'standard error'

  !设备号未和指定文件绑定
  write(99,*) 'output to unit 99 file'

  !read(unit, NML=list)
  write(*,NML=list)
end

