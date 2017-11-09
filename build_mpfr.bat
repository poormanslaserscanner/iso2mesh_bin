call "%VC_ROOT%\vcvarsall.bat" x64
cd win\mpfr\build.vc15

for /d %%d in (..\..\mpir\dll\x64_*) do (
call :FooDLL %%d 
)


goto End


:FooDLL
echo %1
	set _rres=%1 
echo rres is %_rres%
	set _resu=%_rres:~19%
	rmdir ..\..\mpir\dll\x64 /s /q
	mkdir ..\..\mpir\dll\x64
	xcopy %_rres% %CD%\..\..\mpir\dll\x64 /e /i
	devenv dll_mpfr.sln /Clean
	devenv /build "Release|x64" /project dll_mpfr dll_mpfr.sln
	move ..\dll\x64 ..\dll\x64_%_resu%
	devenv dll_mpfr.sln /Clean
goto :eof

:End






 