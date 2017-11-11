call "%VC_ROOT%\vcvarsall.bat" x64
call "%PMLS_INSTALL_DIR%\tbb\bin\tbbvars.bat" intel64
cd JMeshLib\vc9
devenv /build "Release|x64" minJMeshLib.sln
cd ..\..
mkdir %PMLS_INSTALL_DIR%\JMeshLib\include
xcopy JMeshLib\include %PMLS_INSTALL_DIR%\JMeshLib\include
mkdir %PMLS_INSTALL_DIR%\JMeshLib\lib
copy JMeshLib\vc9\x64\Release\minJmeshLib.lib %PMLS_INSTALL_DIR%\JMeshLib\lib\jmesh.lib


