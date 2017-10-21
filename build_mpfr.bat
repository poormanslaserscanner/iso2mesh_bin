call "%VC_ROOT%\vcvarsall.bat" x64
cd win\mpfr\build.vc15
devenv /build "Release|x64" /project dll_mpfr dll_mpfr.sln
devenv /build "Release|x64" /project lib_tests dll_mpfr.sln
devenv /build "Release|x64" dll_mpfr.sln
 