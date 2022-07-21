module string_utils
  implicit none
contains
  function to_upper(str)
    implicit none
    character(len=*),intent(in)  :: str
    character(len=:),allocatable :: to_upper

  end function to_upper
  function to_lower(str)
    implicit none
    character(len=*),intent(in)  :: str
    character(len=:),allocatable :: to_lower

  end function to_lower
  function dirname(str)
    implicit none
    character(len=*),intent(in)  :: str
    character(len=:),allocatable :: dirname


  end function dirname
  function basename(str)
    implicit none
    character(len=*),intent(in)  :: str
    character(len=:),allocatable :: basename


  end function basename
  function add_suffix(str)
    implicit none
    character(len=*),intent(in)  :: str
    character(len=:),allocatable :: add_suffix


  end function add_suffix
  function remove_suffix(str)
    implicit none
    character(len=*),intent(in)  :: str
    character(len=:),allocatable :: remove_suffix


  end function remove_suffix
end module string_utils

program main
  implicit none
  character(len=5),parameter :: constr = 'Hello'
  character(len=*),parameter :: chinese_char = '你好'
  character :: ch    !单个字符变量
  character(len=10) :: str  !长度为10的字符（串）变量
  character*10  :: str1
  character*4   :: str2(10) !长度为10的字符数组变量，数组有10个元素
  character*128 :: str3
  character*10  :: cdate
  integer       :: iyear,imon,iday

  str = 'nice to'
  str1 = ' meet to'

  str2(1) = str
  print*, str(1:2)
  print*, str(3:3)
  print*, str(3:)
  print*, str2(1) 

  print*, len(str//str1)
  print*, len_trim(str//str1)
  print*, 'len(你好)=',len(chinese_char)

  print*, ''

  ! iachar() ichar()
  print*, "iachar('a')-iachar('A')=",iachar('a')-iachar('A')
  ! achar()  char()
  print*, "achar(0)=",achar(0)

  print*, ''

  str3 = '       hello, fortran     '
  print*, 'BEG',str3,'END'
  print*, 'BEG',trim(str3),'END'
  print*, 'BEG',adjustl(str3),'END'
  print*, 'BEG',adjustr(str3),'END'

  print*, 'index(str3, "fort")= ',index(str3,'fort')

  ! Internal file
  iyear =  2022
  imon  =  7
  iday  =  21
  write(cdate, '(I4.4,A1,I2.2,A1,I2.2)') iyear,'-',imon,'-',iday
  print*, 'cdate=',cdate
end
