#!/bin/sh

# This file must be sourced to make PATH (and cake commands) available
# for the shell.

# This script can be executed each time you open a new terminal
# and cd into this directory, because the install steps can be
# executed multiple times. They are no-ops if the repo has already
# been cloned, built or installed from the same commit.

export CAKE_ROOT="$PWD/_cake"
export PATH="$CAKE_ROOT/bin":$PATH

# clone the cake repo
if test ! -f "$CAKE_ROOT/Cake.cmake" ; then
    git clone https://github.com/tamaskenez/cake ${CAKE_ROOT}
fi

# clone, build and install dependencies
# 'cakepkg INSTALL' is like 'git clone' then
# 'cmake --build ... --target install'
for package in ZLIB PNG OpenSSL CURL glfw3 GLEW libuv libjpeg libzip sqlite3 nunicode
do
    if ! cakepkg INSTALL $package; then
        echo "cakepkg error with package $package"
        break
    fi
done

# clone the actual mapbox-gl-native-cmake repo
cakepkg CLONE URL https://github.com/tamaskenez/mapbox-gl-native-cmake DESTINATION mbgl

# run cmake configure step
cake mbgl
