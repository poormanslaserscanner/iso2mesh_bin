call "%VC_ROOT%\vcvarsall.bat" x64
copy mpir_config_all.py win\mpir\build.vc\mpir_config_all.py
rem copy _msvc_project.py win\mpir\build.vc\_msvc_project.py
rem copy msbuild.bat win\mpir\build.vc15\msbuild.bat
for /d %%d in (win\mpir\build.vc15\lib_mpir_*) do rmdir %%d /s /q
for /d %%d in (win\mpir\build.vc15\dll_mpir_*) do rmdir %%d /s /q
rem del win\mpir\build.vc\vsyasm.*

cd win\mpir\build.vc
mpir_config_all.py 15
cd ..\build.vc15

rem goto End

for /d %%d in (.\dll_mpir_*) do (
call :FooDLL %%d 
)


goto End


:FooDLL
echo %1
	set _rres=%1 
echo rres is %_rres%
	set _resu=%_rres:~11%
echo resu is %_resu%
echo "%_rres:~0,-1%\dll_mpir_%_resu:~0,-1%.vcxproj"
	devenv /build "Release|x64" /project dll_mpir_%_resu% mpir.sln
	copy /b %_rres:~0,-1%\dll_mpir_%_resu:~0,-1%.vcxproj +,, %_rres:~0,-1%\dll_mpir_%_resu:~0,-1%.vcxproj
	devenv /build "Release|x64" /project dll_mpir_%_resu% mpir.sln
	move ..\dll\x64 ..\dll\x64_%_resu%
goto :eof

:End

