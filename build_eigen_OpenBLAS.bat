call "%VC_ROOT%\vcvarsall.bat" x64
call "%PMLS_INSTALL_DIR%\tbb\bin\tbbvars.bat" intel64

set GMPDIR=%PMLS_INSTALL_DIR%\mpir
set MPFR_DIR=%PMLS_INSTALL_DIR%\mpfr
set BOOST_ROOT=%PMLS_INSTALL_DIR%\boost\include\boost-1_65_1
set BLAS_LIB_DIR=%PMLS_INSTALL_DIR%\OpenBLAS\lib
set SuiteSparse_DIR=%PMLS_INSTALL_DIR%\suitesparse
set METIS_INCDIR=%PMLS_INSTALL_DIR%\suitesparse\include
set METIS_LIBDIR=%PMLS_INSTALL_DIR%\suitesparse\lib64
mkdir ..\build\eigen_OpenBLAS
cd ..\build\eigen_OpenBLAS

set PMLS_DIR=%PMLS_INSTALL_DIR:\=/%

echo %GMP_DIR%
echo %MPFR_DIR%
echo %BOOST_ROOT%
echo %EIGEN3_INC_DIR%
echo %BLAS_LIB_DIR%

cmake -A x64 -T v141 -DCMAKE_INSTALL_PREFIX:PATH="%PMLS_DIR%/eigen"^
           -DBLAS_LIBRARIES:FILEPATH="%PMLS_DIR%/OpenBLAS/lib/libopenblas.dll.a"^
         -DLAPACK_LIBRARIES:FILEPATH="%PMLS_DIR%/OpenBLAS/lib/libopenblas.dll.a"^
            -DGMP_LIBRARIES:FILEPATH="%PMLS_DIR%/mpir/mpir.lib"^
           -DMPFR_LIBRARIES:FILEPATH="%PMLS_DIR%/mpfr/mpfr.lib"^
                -DMPFR_INCLUDES:PATH="%PMLS_DIR%/mpfr"^
        -DCHOLMOD_LIBRARIES:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libcholmod.lib"^
      -DSUITESPARSE_LIBRARY:FILEPATH="%PMLS_DIR%/suitesparse/lib64/suitesparseconfig.lib"^
          -DCCOLAMD_LIBRARY:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libccolamd.lib"^
             -DCHOLMOD_INCLUDES:PATH="%PMLS_DIR%/suitesparse/include"^
              -DAMD_LIBRARY:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libamd.lib"^
           -DCOLAMD_LIBRARY:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libcolamd.lib"^
             -DCAMD_LIBRARY:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libcamd.lib"^
             -DUMFPACK_INCLUDES:PATH="%PMLS_DIR%/suitesparse/include"^
        -DUMFPACK_LIBRARIES:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libumfpack.lib"^
          -DCHOLMOD_LIBRARY:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libcholmod.lib"^
           -DSPQR_LIBRARIES:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libspqr.lib"^
                -DSPQR_INCLUDES:PATH="%PMLS_DIR%/suitesparse/include/suitesparse"^
           -DMETIS_metis.h_DIRS:PATH="%PMLS_DIR%/suitesparse/include"^
      -DMETIS_metis_LIBRARY:FILEPATH="%PMLS_DIR%/suitesparse/lib64/metis.lib"^
           -DSPQR_LIBRARIES:FILEPATH="%PMLS_DIR%/suitesparse/lib64/libspqr.lib"^
                -DSPQR_INCLUDES:PATH="%PMLS_DIR%/suitesparse/include/suitesparse"^
 -DEIGEN_TEST_OPENMP:BOOL="1"^
 -DBLAS_VERBOSE:BOOL="1"^
 -DEIGEN_TEST_CXX11:BOOL="1"^
 -DEIGEN_TEST_SSE2:BOOL="1"^
 -DCMAKE_CONFIGURATION_TYPES:STRING="Release"^
 ..\..\iso2mesh_bin\eigen

devenv /build "Release|x64" /project ALL_BUILD Eigen3.sln
devenv /build "Release|x64" /project INSTALL Eigen3.sln
REM cmake-gui .

