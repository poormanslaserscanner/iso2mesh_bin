call "%VC_ROOT%\vcvarsall.bat" x64
cd ..
mkdir build\tetgen
cd build\tetgen

set PMLS_DIR=%PMLS_INSTALL_DIR:\=/%

cmake -A x64 -T v141 -DCMAKE_CONFIGURATION_TYPES:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH="%PMLS_DIR%/tetgen" ..\..\iso2mesh_bin\tetgen
devenv /build "Release|x64" /project ALL_BUILD Project.sln


