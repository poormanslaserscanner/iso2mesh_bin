call "%VC_ROOT%\vcvarsall.bat" x64
mkdir ..\build\suitesparse_OpenBLAS
cd ..\build\suitesparse_OpenBLAS
echo %BLAS_LIB_DIR%

cmake -A x64 -T v141 -DSUITESPARSE_INSTALL_PREFIX:PATH="d:/pmlsgit/git_iso2mesh_bin/install/suitesparse"^
 -DSUITESPARSE_CUSTOM_LAPACK_LIB:STRING="d:/pmlsgit/git_iso2mesh_bin/install/OpenBLAS/lib/libopenblas.dll.a"^
 -DOPENMP:BOOL="1"^
 -DHAVE_COMPLEX:BOOL="0"^
 -DSUITESPARSE_CUSTOM_BLAS_LIB:STRING="d:/pmlsgit/git_iso2mesh_bin/install/OpenBLAS/lib/libopenblas.dll.a"^
 -DSUITESPARSE_USE_CUSTOM_BLAS_LAPACK_LIBS:BOOL="1"^
 ..\..\iso2mesh_bin\suitesparse-metis-for-windows

cmake-gui .
goto :eof

devenv /build "Release|x64" /project ALL_BUILD CGAL.sln
devenv /build "Release|x64" /project INSTALL CGAL.sln
REM devenv /build "Release|x64" /project examples CGAL.sln

   

