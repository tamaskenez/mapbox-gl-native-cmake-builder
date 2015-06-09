#!/bin/sh

cmake -Hzlib -Bbuild/zlib -DCMAKE_INSTALL_PREFIX=out
cmake --build build/zlib --target install --config Debug
cmake --build build/zlib --target install --config Release

cmake -Hlibpng -Bbuild/libpng -DCMAKE_INSTALL_PREFIX=out -DCAKE_PREFIX_PATH=out
cmake --build build/libpng --target install --config Debug
cmake --build build/libpng --target install --config Release

cmake -Hcurl -Bbuild/curl -DCMAKE_INSTALL_PREFIX=out -DCAKE_PREFIX_PATH=out -DBUILD_CURL_EXE=0 -DBUILD_CURL_TESTS=0
cmake --build build/curl --target install --config Debug
cmake --build build/curl --target install --config Release

cmake -Hlibuv -Bbuild/libuv -DCMAKE_INSTALL_PREFIX=out -DCAKE_PREFIX_PATH=out
cmake --build build/libuv --target install --config Debug
cmake --build build/libuv --target install --config Release

cmake -Hglfw -Bbuild/glfw -DCMAKE_INSTALL_PREFIX=out -DCAKE_PREFIX_PATH=out -DGLFW_BUILD_DOCS=0 -DGLFW_BUILD_EXAMPLES=0 -DGLFW_BUILD_TESTS=0
cmake --build build/glfw --target install --config Debug
cmake --build build/glfw --target install --config Release

cmake -H. -Bbuild/super -DCMAKE_PREFIX_PATH=$PWD/out -DCMAKE_INSTALL_PREFIX=$PWD/out

cmake -Hmapbox-gl-native -Bbuild/mapbox-gl-native -DCMAKE_PREFIX_PATH=out -DCMAKE_INSTALL_PREFIX=out

cmake -Hglew/build/cmake -Bbuild/glew -DCMAKE_INSTALL_PREFIX=out -DBUILD_UTILS=0
cmake --build build/glew --target install --config Debug
cmake --build build/glew --target install --config Release