call "%VC_ROOT%\vcvarsall.bat" x64
call "..\install\tbb\bin\tbbvars.bat" intel64
set GMP_DIR=%CD%\win\mpir\dll\x64\Release
set MPFR_DIR=%CD%\win\mpfr\dll\x64\Release
set BOOST_ROOT=%CD%\..\install\boost\include\boost-1_65_1
set EIGEN3_INC_DIR=%CD%\eigen
set BLAS_LIB_DIR=%CD%\..\install\OpenBLAS\lib
set OPENMESH_DIR=%CD%\..\install\OpenMesh
set CGAL_DIR=%CD%\..\build\cgal_OpenBLAS
mkdir ..\build\cgalsurf
cd ..\build\cgalsurf
echo %GMP_DIR%
echo %MPFR_DIR%
echo %BOOST_ROOT%
echo %EIGEN3_INC_DIR%
echo %BLAS_LIB_DIR%

cmake -A x64 -T v141  -DCMAKE_INSTALL_PREFIX:PATH="d:/pmlsgit/install/cgalsurf"^
 -DCGAL_Boost_USE_STATIC_LIBS:BOOL="1"^
 -DCMAKE_CONFIGURATION_TYPES:STRING="Release"^
 -DBUILD_SHARED_LIBS:BOOL="0"^
 -DWITH_ZLIB:BOOL="1" -DZLIB_INCLUDE_DIR:PATH="D:/pmlsgit/install/zlib/include"  -DZLIB_LIBRARY_RELEASE:FILEPATH="D:/pmlsgit/install/zlib/lib/zlib.lib"^
 -DWITH_BLAS:BOOL="1" -DWITH_LAPACK:BOOL="1"^
 -DLAPACK_LIBRARIES:FILEPATH="D:/pmlsgit/install/OpenBLAS/lib/libopenblas.dll.a" -DBLAS_LIBRARIES:FILEPATH="D:/pmlsgit/install/OpenBLAS/lib/libopenblas.dll.a"^
 -DWITH_Eigen3:BOOL="1"^
 -DTBB_RELEASE_LIBRARY:FILEPATH="D:/pmlsgit/install/tbb/lib/intel64/vc14/tbb.lib"^
 -DBoost_PROGRAM_OPTIONS_LIBRARY_RELEASE:FILEPATH="D:/pmlsgit/install/boost/lib/libboost_program_options-vc141-mt-1_65_1.lib"^
 -DACTIVATE_CONCURRENT_PSP3:BOOL="1"^
 -DACTIVATE_CONCURRENT_MESH_3:BOOL="1"^
 -DTBB_RELEASE_LIBRARY:FILEPATH="D:/pmlsgit/install/tbb/lib/intel64/vc14/tbb.lib"^
 -DOPENMESH_INCLUDE_DIR:PATH="D:/pmlsgit/install/OpenMesh/include"^
 ..\..\pmls\cgalsurf
cmake-gui .
goto :eof


devenv /build "Release|x64" /project ALL_BUILD CGAL.sln
devenv /build "Release|x64" CGAL.sln
devenv /build "Release|x64" /project INSTALL CGAL.sln

   

