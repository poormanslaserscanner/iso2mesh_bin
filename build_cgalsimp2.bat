call "%VC_ROOT%\vcvarsall.bat" x64
call call "%PMLS_INSTALL_DIR%\tbb\bin\tbbvars.bat" intel64

set GMP_DIR=%PMLS_INSTALL_DIR%\mpir
set MPFR_DIR=%PMLS_INSTALL_DIR%\mpfr
set BOOST_ROOT=%PMLS_INSTALL_DIR%\boost\include\boost-1_65_1
set EIGEN3_INC_DIR=%PMLS_INSTALL_DIR%\eigen\include\eigen3
set BLAS_LIB_DIR=%PMLS_INSTALL_DIR%\OpenBLAS\lib
set OPENMESH_DIR=%PMLS_INSTALL_DIR%\OpenMesh
set CGAL_DIR=%CD%\..\build\cgal_OpenBLAS

mkdir ..\build\cgalsimp2
cd ..\build\cgalsimp2

set PMLS_DIR=%PMLS_INSTALL_DIR:\=/%

echo %GMP_DIR%
echo %MPFR_DIR%
echo %BOOST_ROOT%
echo %EIGEN3_INC_DIR%
echo %BLAS_LIB_DIR%

cmake -A x64 -T v141  -DCMAKE_INSTALL_PREFIX:PATH="%PMLS_DIR%/cgalsimp2"^
 -DCGAL_Boost_USE_STATIC_LIBS:BOOL="1"^
 -DCMAKE_CONFIGURATION_TYPES:STRING="Release"^
 -DBUILD_SHARED_LIBS:BOOL="0"^
 -DWITH_ZLIB:BOOL="1"^
                          -DZLIB_INCLUDE_DIR:PATH="%PMLS_DIR%/zlib/include"^
                  -DZLIB_LIBRARY_RELEASE:FILEPATH="%PMLS_DIR%/zlib/lib/zlib.lib"^
 -DWITH_BLAS:BOOL="1" -DWITH_LAPACK:BOOL="1"^
                      -DLAPACK_LIBRARIES:FILEPATH="%PMLS_DIR%/OpenBLAS/lib/libopenblas.dll.a"^
                        -DBLAS_LIBRARIES:FILEPATH="%PMLS_DIR%/OpenBLAS/lib/libopenblas.dll.a"^
 -DWITH_Eigen3:BOOL="1"^
                   -DTBB_RELEASE_LIBRARY:FILEPATH="%PMLS_DIR%/tbb/lib/intel64/vc14/tbb.lib"^
 -DBoost_PROGRAM_OPTIONS_LIBRARY_RELEASE:FILEPATH="%PMLS_DIR%/boost/lib/libboost_program_options-vc141-mt-1_65_1.lib"^
 -DACTIVATE_CONCURRENT_PSP3:BOOL="1"^
 -DACTIVATE_CONCURRENT_MESH_3:BOOL="1"^
                   -DTBB_RELEASE_LIBRARY:FILEPATH="%PMLS_DIR%/tbb/lib/intel64/vc14/tbb.lib"^
                      -DOPENMESH_INCLUDE_DIR:PATH="%PMLS_DIR%/OpenMesh/include"^
 -DWITH_tests:BOOL="1"^
 -DWITH_demos:BOOL="1"^
                           -DSuiteSparse_DIR:PATH="%PMLS_DIR%/suitesparse"^
 -DACTIVATE_CONCURRENT_TRIANGULATION_3:BOOL="1"^
                        -DEIGEN3_INCLUDE_DIR:PATH="%PMLS_DIR%/eigen/include/eigen3"^
 -DWITH_examples:BOOL="1"^
 -DWITH_tests:BOOL="0"^
 ..\..\iso2mesh_bin\cgalsimp2
cmake-gui .
goto :eof


devenv /build "Release|x64" /project ALL_BUILD CGAL.sln
devenv /build "Release|x64" CGAL.sln
devenv /build "Release|x64" /project INSTALL CGAL.sln

   

