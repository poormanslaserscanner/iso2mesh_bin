call "%VC_ROOT%\vcvarsall.bat" x64
if %errorlevel% neq 0 exit /b %errorlevel%
cd boost
call bootstrap
b2 variant=release link=static threading=multi address-model=64 --build-dir="..\..\build\boost\build" --stagedir="..\..\build\boost\build\stage"  --prefix="..\..\install\boost" --build-type=minimal stage install headers


