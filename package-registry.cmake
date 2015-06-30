cake_pkg(REGISTER ZLIB     URL https://github.com/madler/zlib)
cake_pkg(REGISTER PNG      URL git://git.code.sf.net/p/libpng/code)
cake_pkg(REGISTER OpenSSL  URL https://github.com/tamaskenez/openssl-cmake)
cake_pkg(REGISTER CURL     URL https://github.com/bagder/curl)
cake_pkg(REGISTER glfw3    URL https://github.com/shaxbee/glfw CMAKE_ARGS -DGLFW_BUILD_TESTS=0 -DGLFW_BUILD_EXAMPLES=0 -DGLFW_BUILD_DOCS=0)
cake_pkg(REGISTER GLEW     URL https://github.com/tamaskenez/glew-with-extensions SOURCE_DIR build/cmake CMAKE_ARGS -DBUILD_UTILS=0)
cake_pkg(REGISTER libuv    URL https://github.com/tamaskenez/libuv-cmake)
cake_pkg(REGISTER libjpeg  URL https://github.com/tamaskenez/libjpeg-cmake)
cake_pkg(REGISTER nunicode URL https://bitbucket.org/tamaskenez/nunicode?branch=cmake)
cake_pkg(REGISTER libzip   URL https://github.com/tamaskenez/libzip)
cake_pkg(REGISTER sqlite3  URL https://github.com/tamaskenez/sqlite3-cmake)



