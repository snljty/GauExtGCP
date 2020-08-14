! this file outputs data to Gaussian External output file.

subroutine writeextspout(totalenergy, Xdipole, Ydipole, Zdipole)
  implicit none
  real(kind=8) :: totalenergy, Xdipole, Ydipole, Zdipole

  ! this line must be the first line to be written, so open a new file.
  open(11, file = "TmpExtOut.txt", status="replace")
  write(11, "(4D20.12)") totalenergy, Xdipole, Ydipole, Zdipole
  close(11)
  return
end subroutine writeextspout

subroutine writeextgradout(Xgrad, Ygrad, Zgrad)
  implicit none
  real(kind=8) :: Xgrad, Ygrad, Zgrad

  open(11, position = "Append", file = "TmpExtOut.txt")
  write(11, "(3D20.12)") Xgrad, Ygrad, Zgrad
  close(11)
  return
end subroutine writeextgradout

subroutine write3Zeros(n)
  ! write 3 0D0 as a line, write n lines
  implicit none
  integer(kind=4) :: n
  integer(kind=4) :: j
  real(kind=8) :: num

  num = 0D0
  open(11, position = "Append", file = "TmpExtOut.txt")
  do j = 1, n
    write(11, "(3D20.12)") num, num, num
  end do
  close(11)
  return
end subroutine write3Zeros

