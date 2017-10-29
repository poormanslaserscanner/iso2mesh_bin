call "%VC_ROOT%\vcvarsall.bat" x64
call "..\install\tbb\bin\tbbvars.bat" intel64
set GMPDIR=%CD%\win\mpir\dll\x64\Release
set MPFR_DIR=%CD%\win\mpfr\dll\x64\Release
set BOOST_ROOT=%CD%\..\install\boost\include\boost-1_65_1
set BLAS_LIB_DIR=%CD%\..\install\OpenBLAS\lib
set SuiteSparse_DIR=d:\pmlsgit\git_iso2mesh_bin\install\suitesparse
set METIS_INCDIR=d:\pmlsgit\git_iso2mesh_bin\install\suitesparse\include
set METIS_LIBDIR=d:\pmlsgit\git_iso2mesh_bin\install\suitesparse\lib64
mkdir ..\build\eigen_OpenBLAS
cd ..\build\eigen_OpenBLAS
echo %GMP_DIR%
echo %MPFR_DIR%
echo %BOOST_ROOT%
echo %EIGEN3_INC_DIR%
echo %BLAS_LIB_DIR%

cmake -A x64 -T v141 -DCMAKE_INSTALL_PREFIX:PATH="d:/pmlsgit/git_iso2mesh_bin/install/eigen"^
 -DBLAS_LIBRARIES:FILEPATH="d:/pmlsgit/git_iso2mesh_bin/install/OpenBLAS/lib/libopenblas.dll.a"^
 -DLAPACK_LIBRARIES:FILEPATH="d:/pmlsgit/git_iso2mesh_bin/install/OpenBLAS/lib/libopenblas.dll.a"^
 -DGMP_LIBRARIES:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/iso2mesh_bin/win/mpir/dll/x64/Release/mpir.lib"^
 -DMPFR_LIBRARIES:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/iso2mesh_bin/win/mpfr/dll/x64/Release/mpfr.lib"^
 -DMPFR_INCLUDES:PATH="D:/pmlsgit/git_iso2mesh_bin/iso2mesh_bin/win/mpfr/dll/x64/Release"^
 -DCHOLMOD_LIBRARIES:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libcholmod.lib"^
 -DSUITESPARSE_LIBRARY:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/suitesparseconfig.lib"^
 -DCCOLAMD_LIBRARY:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libccolamd.lib"^
 -DCHOLMOD_INCLUDES:PATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/include"^
 -DAMD_LIBRARY:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libamd.lib"^
 -DCOLAMD_LIBRARY:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libcolamd.lib"^
 -DCAMD_LIBRARY:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libcamd.lib"^
 -DUMFPACK_INCLUDES:PATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/include"^
 -DUMFPACK_LIBRARIES:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libumfpack.lib"^
 -DCHOLMOD_LIBRARY:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libcholmod.lib"^
 -DSPQR_LIBRARIES:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libspqr.lib"^
 -DSPQR_INCLUDES:PATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/include/suitesparse"^
 -DMETIS_metis.h_DIRS:PATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/include"^
 -DMETIS_metis_LIBRARY:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/metis.lib"^
 -DSPQR_LIBRARIES:FILEPATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/lib64/libspqr.lib"^
 -DSPQR_INCLUDES:PATH="D:/pmlsgit/git_iso2mesh_bin/install/suitesparse/include/suitesparse"^
 ..\..\iso2mesh_bin\eigen

cmake-gui .
goto :eof

