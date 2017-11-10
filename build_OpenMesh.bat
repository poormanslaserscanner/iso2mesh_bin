call "%VC_ROOT%\vcvarsall.bat" x64

mkdir ..\build\OpenMesh
cd ..\build\OpenMesh

set PMLS_DIR=%PMLS_INSTALL_DIR:\=/%

cmake -A x64 -T v141^
 -DCMAKE_INSTALL_PREFIX:PATH="%PMLS_DIR%/OpenMesh"^
 -DBoost_PYTHON3_LIBRARY_RELEASE:FILEPATH="%PMLS_DIR%/boost/lib/libboost_python3-vc141-mt-1_65_1.lib"^
 -DCMAKE_BUILD_TYPE:STRING="Release"^
 -DBUILD_APPS:BOOL="0"^
 -DOPENMESH_PYTHON_VERSION:STRING="3.6"^
 -DDISABLE_QMAKE_BUILD:BOOL="1"^
 -DBoost_INCLUDE_DIR:PATH="%PMLS_DIR%\boost\include\boost-1_65_1"^
 -DOPENMESH_BUILD_PYTHON_BINDINGS:BOOL="0" -DOPENMESH_BUILD_UNIT_TESTS:BOOL="0"^
 ..\..\iso2mesh_bin\OpenMesh 

devenv /build "Release|x64" /project ALL_BUILD OpenMesh.sln
devenv /build "Release|x64" /project INSTALL OpenMesh.sln
 
REM cmake-gui ..\..\pmls\cgal
REM cmake -DCMAKE_INSTALL_PREFIX:PATH="d:/pmls/install/CGAL" -DCGAL_Boost_USE_STATIC_LIBS:BOOL="1" -DCMAKE_CONFIGURATION_TYPES:STRING="Release" -DBUILD_SHARED_LIBS:BOOL="0" -DWITH_ZLIB:BOOL="1" -DZLIB_INCLUDE_DIR:PATH="D:/pmlsgit/install/zlib/include"  -DZLIB_LIBRARY_RELEASE:FILEPATH="D:/pmlsgit/install/zlib/lib/zlib.lib" -DWITH_LAPACK:BOOL="1" -DWITH_Eigen3:BOOL="1" .
REM cmake-gui .

   

