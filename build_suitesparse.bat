call "%VC_ROOT%\vcvarsall.bat" x64
mkdir ..\build\suitesparse_OpenBLAS
cd ..\build\suitesparse_OpenBLAS
set PMLS_DIR=%PMLS_INSTALL_DIR:\=/%

cmake -A x64 -T v141 -DSUITESPARSE_INSTALL_PREFIX:PATH="%PMLS_DIR%/suitesparse"^
 -DCMAKE_CONFIGURATION_TYPES:STRING="Release"^
 -DSUITESPARSE_CUSTOM_LAPACK_LIB:STRING="%PMLS_DIR%/OpenBLAS/lib/libopenblas.dll.a"^
 -DOPENMP:BOOL="1"^
 -DHAVE_COMPLEX:BOOL="0"^
 -DSUITESPARSE_CUSTOM_BLAS_LIB:STRING="%PMLS_DIR%/OpenBLAS/lib/libopenblas.dll.a"^
 -DSUITESPARSE_USE_CUSTOM_BLAS_LAPACK_LIBS:BOOL="1"^
 ..\..\iso2mesh_bin\suitesparse-metis-for-windows

devenv /build "Release|x64" /project ALL_BUILD SuiteSparseProject.sln
devenv /build "Release|x64" /project INSTALL SuiteSparseProject.sln
REM devenv /build "Release|x64" /project examples CGAL.sln

   

