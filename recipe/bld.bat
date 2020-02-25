mkdir build
cd build

set CONFIGURATION=Release

cmake .. -G "NMake Makefile" ^
         -DCMAKE_BUILD_TYPE=%CONFIGURATION% ^
         -DCMAKE_PREFIX_PATH="%PREFIX%" ^
         -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
         -DBOOST_ROOT="%LIBRARY_PREFIX%" ^
         -DWITH_BLOSC=ON ^
         -DWITH_ZLIB=ON ^
         -DWITH_BZIP2=ON ^
         -DWITH_XZ=ON ^
         -DWITH_LZ4=OFF ^
         -DWITHIN_TRAVIS=OFF ^
         -DBUILD_Z5PY=ON ^
         -DPYTHON_EXECUTABLE="%PYTHON%"

cmake --build . --config %CONFIGURATION% --target install
