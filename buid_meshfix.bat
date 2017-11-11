call "%VC_ROOT%\vcvarsall.bat" x64
call "%PMLS_INSTALL_DIR%\tbb\bin\tbbvars.bat" intel64
cd MeshFix\vc12
devenv /build "Fast|x64" MeshFix_All.sln

