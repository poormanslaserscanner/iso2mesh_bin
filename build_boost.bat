call "%VC_ROOT%\vcvarsall.bat" x64
if %errorlevel% neq 0 exit /b %errorlevel%
cd boost
call bootstrap
b2 -j8 variant=release link=static runtime-link=shared threading=multi address-model=64 --build-dir="..\..\build\boost\build" --stagedir="..\..\build\boost\build\stage"  --prefix="%PMLS_INSTALL_DIR%\boost" --build-type=minimal stage
b2 -j8 variant=release link=static runtime-link=shared threading=multi address-model=64 --build-dir="..\..\build\boost\build" --stagedir="..\..\build\boost\build\stage"  --prefix="%PMLS_INSTALL_DIR%\boost" --build-type=minimal install


