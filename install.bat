mkdir %PMLS_INSTALL_DIR%\bin
copy ..\build\cgalmesh\Release\mesh_3D_image.exe                      %PMLS_INSTALL_DIR%\bin\cgalmesh.exe
copy ..\build\cgalmesh\Release\mesh_polyhedral_domain.exe             %PMLS_INSTALL_DIR%\bin\cgalpoly.exe
copy ..\build\cgalsimp2\Release\edge_collapse_enriched_polyhedron.exe %PMLS_INSTALL_DIR%\bin\cgalsimp2.exe
copy ..\build\cgalsurf\Release\mesh_a_3d_gray_image.exe               %PMLS_INSTALL_DIR%\bin\cgalsurf.exe
copy cork\win\wincork\x64\Release\wincork.exe                %PMLS_INSTALL_DIR%\bin\cork.exe
copy JMeshFix\build\meshfix\x64\Release\meshfix.exe          %PMLS_INSTALL_DIR%\bin\jmeshlib.exe
copy MeshFix\bin64\MeshFix.exe                               %PMLS_INSTALL_DIR%\bin\meshfix.exe
copy ..\build\tetgen\Release\tetgen.exe                               %PMLS_INSTALL_DIR%\bin\tetgen.exe
copy %PMLS_INSTALL_DIR%\mpir\mpir.dll                                 %PMLS_INSTALL_DIR%\bin\mpir.dll
copy %PMLS_INSTALL_DIR%\mpfr\mpfr.dll                                 %PMLS_INSTALL_DIR%\bin\mpfr.dll
copy %PMLS_INSTALL_DIR%\tbb\bin\intel64\vc14\tbb.dll                  %PMLS_INSTALL_DIR%\bin\tbb.dll
copy %PMLS_INSTALL_DIR%\tbb\bin\intel64\vc14\tbbmalloc.dll            %PMLS_INSTALL_DIR%\bin\tbbmalloc.dll
copy %PMLS_INSTALL_DIR%\zlib\bin\zlib.dll                             %PMLS_INSTALL_DIR%\bin\zlib.dll





