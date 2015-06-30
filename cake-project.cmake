set(CAKE_PKG_REGISTRIES ${CMAKE_CURRENT_LIST_DIR}/package-registry.cmake)
set(CAKE_BINARY_DIR_PREFIX "${CMAKE_CURRENT_LIST_DIR}/_out/build")
set(CAKE_PKG_CLONE_DIR "${CMAKE_CURRENT_LIST_DIR}/_clone")

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_DIR}/_out")
set(CMAKE_PREFIX_PATH "${CMAKE_INSTALL_PREFIX}")

# this is needed to hijack the find_package calls to find config modules first
list(APPEND CMAKE_ARGS "-DCMAKE_MODULE_PATH=${CMAKE_CURRENT_LIST_DIR}/find-package-hijack-modules")
