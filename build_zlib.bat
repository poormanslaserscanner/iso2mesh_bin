call "%VC_ROOT%\vcvarsall.bat" x64
cd ..
mkdir build\zlib
cd build\zlib
cmake -A x64 -T v141 -DCMAKE_CONFIGURATION_TYPES:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH="%PMLS_INSTALL_DIR%\zlib" ..\..\iso2mesh_bin\zlib
devenv /build "Release|x64" /project ALL_BUILD zlib.sln
devenv /build "Release|x64" /project INSTALL zlib.sln
 