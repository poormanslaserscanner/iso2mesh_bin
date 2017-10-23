call "%VC_ROOT%\vcvarsall.bat" x64
cd ..
mkdir build\tetgen
cd build\tetgen
cmake -A x64 -T v141 -DCMAKE_CONFIGURATION_TYPES:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=..\..\install\tetgen ..\..\pmls\tetgen
devenv /build "Release|x64" /project ALL_BUILD Project.sln


