program main
  implicit none
  integer,dimension(:,:),allocatable,target :: alloc_array
  integer,dimension(:,:),pointer            :: ptr_array => NULL()
  integer :: m,n

  m = 10
  n = 20

  print*,'bf allocating status',allocated(alloc_array)
  allocate(alloc_array(m,n))
  print*,'af allocating status',allocated(alloc_array)

  alloc_array = 1
  print*, 'alloc_array(1,1) = ',alloc_array(1,1)


  print*, 'bf pointer to target', associated(ptr_array)
  ptr_array => alloc_array
  print*, 'af pointer to target', associated(ptr_array)

  ptr_array(1,1) = 0
  print*, 'ptr_array(1,1) = ',ptr_array(1,1)
  print*, 'alloc_array(1,1) = ',alloc_array(1,1)

  nullify(ptr_array)
  print*, 'af nullify', associated(ptr_array)

  allocate(ptr_array(m,n))
  ptr_array = 4
  !指针必须显式释放空间
  deallocate(ptr_array)
end
