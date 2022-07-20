program main
  implicit none
  logical :: isopen
  integer :: iunit
  real    :: temp
  integer :: mask(360,181)
  integer :: i,j


  !check available file unit
  do iunit = 100, 999
    inquire(unit = iunit, opened = isopen)
    if(.not. isopen) exit
  enddo
  !文本格式
  ! Write data to file
  open(unit=iunit,file="test.txt",form="formatted")
  write(iunit,'(F8.3)') 8.123456
  close(iunit)
  ! Read data from file
  open(unit=iunit,file="test.txt",form="formatted",status="old")
  read(iunit,'(F8.3)') temp
  close(iunit)

  write(*,*) 'value from file ',temp

  !二进制格式
  ! 顺序访问sequential
  ! ---------------------------------------------------------------
  ! |rec1_len | data | rec1_len | rec2_len | data | rec2_len |.....
  ! ---------------------------------------------------------------

  do j = 1, 181
    do i = 1, 360
      mask(i,j) = mod(i+j, 2)
    enddo
  enddo

  open(unit=iunit,file="seq.grd",form="unformatted",access="sequential")
  write(iunit) mask
  close(iunit)

  !read(inuit) mask

  ! 直接访问direct
  ! ---------------------------------------------------------------
  ! |   rec1_data | rec2_data  | ...   | recN_data | ...
  ! ---------------------------------------------------------------
  open(unit=iunit,file="direct.grd",form="unformatted",access="direct",recl=360*181*4)
  write(iunit,rec=1) mask
  close(iunit)

  ! 字节流访问stream
  ! ---------------------------------------------------------------
  ! |byte1|byte2|byte3|....|byteN|byteN+1|...
  ! ---------------------------------------------------------------
  open(unit=iunit,file="stream.grd",form="unformatted",access="stream")
  write(iunit) mask
  close(iunit)

  ! formatted vs unformatted
end
