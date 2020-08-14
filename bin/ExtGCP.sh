#! /bin/dash

# Use External gCP

# You need to make sure the directory containing Gaussian executable 
# has been properly set to GAUSS_EXEDIR and within PATH environental variables.

# check http://gaussian.com/external/ for Gaussian External details
# $1 to $6 for layer InputFile OutputFile MsgFile FChkFile MatElFile

# get number of atoms
# natoms=`head -n 1 $2 | awk '{print $1}'`

# get number of gradient(s) needed
ngrad=`head -n 1 $2 | awk '{print $2}'`

# Generate Input file for Gaussian using External InputFile
./GeneExtInp $2

# Invoke Gaussian and gCP
gau_exe_name=`grep 'the executable program of Gaussian' -A 1 ExtGCP_settings.ini | tail -n 1`
gCP_exe_name=`grep 'the executable program of gcp' -A 1 ExtGCP_settings.ini | tail -n 1`
gCP_level=`grep 'the level of gCP' -A 1 ExtGCP_settings.ini | tail -n 1`
$gau_exe_name < useExtGau.gjf > useExtGau.out
if [ $ngrad -eq 0 ]
then
  $gCP_exe_name useExtgCP.xyz -level $gCP_level > useExtgCP.out
else
  if [ $ngrad -eq 1 ]
  then
    $gCP_exe_name useExtgCP.xyz -grad -level $gCP_level > useExtgCP.out
  else
    if [ $ngrad -eq 2 ]
    then
      $gCP_exe_name useExtgCP.xyz -hess -level $gCP_level > useExtgCP.out
    fi
  fi
fi

# Read and write data
# ReadExtOut will invoke some subroutines from ReadExtGCPGrad.f90 and WriteExtOut.f90
# The data will be written to TmpExtOut.txt
./ReadExtOut $2

# move TmpExtOut.txt to real Gaussian External output file
mv TmpExtOut.txt $3

# remove temporary files
rm .CP .CPC 2> /dev/null
rm useExtGau.gjf useExtGau.out useExtgCP.xyz useExtgCP.out gcp_gradient 2> /dev/null

