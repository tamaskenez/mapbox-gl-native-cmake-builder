#!/bin/sh

set -ex
common="-DCMAKE_INSTALL_PREFIX=$PWD/out -DCMAKE_PREFIX_PATH=$PWD/out"
G=$CMAKE_GENERATOR

cmake -Hzlib -Bbuild/zlib $common -G"$G"
cmake --build build/zlib --target install --config Debug
cmake --build build/zlib --target install --config Release

cmake -Hlibzip -Bbuild/libzip $common -G"$G"
cmake --build build/libzip --target install --config Debug
cmake --build build/libzip --target install --config Release

cmake -Hlibpng -Bbuild/libpng $common -G"$G"
cmake --build build/libpng --target install --config Debug
cmake --build build/libpng --target install --config Release

cmake -Hlibjpeg -Bbuild/libjpeg $common -G"$G"
cmake --build build/libjpeg --target install --config Debug
cmake --build build/libjpeg --target install --config Release

cmake -Hcurl -Bbuild/curl $common -G"$G" -DBUILD_CURL_EXE=0 -DBUILD_CURL_TESTS=0
cmake --build build/curl --target install --config Debug
cmake --build build/curl --target install --config Release

cmake -Hlibuv -Bbuild/libuv $common -G"$G"
cmake --build build/libuv --target install --config Debug
cmake --build build/libuv --target install --config Release

cmake -Hglfw -Bbuild/glfw $common -G"$G" -DGLFW_BUILD_DOCS=0 -DGLFW_BUILD_EXAMPLES=0 -DGLFW_BUILD_TESTS=0
cmake --build build/glfw --target install --config Debug
cmake --build build/glfw --target install --config Release

cmake -Hnunicode -Bbuild/nunicode $common -G"$G"
cmake --build build/nunicode --target install --config Debug
cmake --build build/nunicode --target install --config Release

cmake -Hglew/build/cmake -Bbuild/glew $common -G"$G" -DBUILD_UTILS=0
cmake --build build/glew --target install --config Release

cmake -Hmapbox-gl-native -Bbuild/mapbox-gl-native $common -G"$G"


cmake -H. -Bbuild/super $common -G"$G"

