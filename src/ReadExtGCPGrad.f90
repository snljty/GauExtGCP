! this file reads gCP gradient.

subroutine ReadGCPGrad(readstr, xgrad, ygrad, zgrad)
  implicit none
  character(len=66) :: readstr
  real(kind=8) :: xgrad, ygrad, zgrad

  read(readstr, "(3D22.14)") xgrad, ygrad, zgrad
  return
end subroutine ReadGCPGrad

