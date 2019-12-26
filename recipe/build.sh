##
## START THE BUILD
##

mkdir -p build
cd build

# we build with boost fs in macos
if [[ "$OSTYPE" == "darwin"* ]]; then
    BOOST_FS=ON
else
    BOOST_FS=OFF
fi

# NUMPY_INCLUDE_DIR="{$PREFIX}/lib/python3.7/site-packages/numpy/core/include"

##
## Configure
##
cmake .. \
        -DCMAKE_C_COMPILER=${CC} \
        -DCMAKE_CXX_COMPILER=${CXX} \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX} \
        -DCMAKE_PREFIX_PATH=${PREFIX} \
\
        -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
        -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS} -O3 -DNDEBUG" \
        -DCMAKE_CXX_FLAGS_DEBUG="${CXXFLAGS}" \
\
        -DBOOST_ROOT=${PREFIX} \
        -DWITH_BLOSC=ON \
        -DWITH_ZLIB=ON \
        -DWITH_BZIP2=ON \
        -DWITH_XZ=ON \
        -DWITH_LZ4=ON \
        -DWITHIN_TRAVIS=OFF \
        -DWITH_BOOST_FS=BOOST_FS \

##
## Compile and install
##
make -j${CPU_COUNT}
make install
