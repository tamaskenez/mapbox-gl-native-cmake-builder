cmake_minimum_required(VERSION 3.0)
project(mapbox-gl-native-super C CXX)

include(CMakePrintHelpers)
cmake_print_variables(CMAKE_PREFIX_PATH)

find_package(ZLIB REQUIRED)

cmake_print_variables(ZLIB_INCLUDE_DIRS ZLIB_LIBRARIES)

find_package(PNG REQUIRED)
cmake_print_variables(PNG_INCLUDE_DIRS PNG_LIBRARIES)

find_package(CURL REQUIRED)
cmake_print_variables(CURL_INCLUDE_DIRS CURL_LIBRARIES)

find_package(libuv REQUIRED)
cmake_print_variables(libuv_FOUND)

find_package(glfw3 REQUIRED NO_CMAKE_BUILDS_PATH NO_CMAKE_PACKAGE_REGISTRY)
cmake_print_variables(glfw3_FOUND glfw3_INCLUDE_DIRS glfw3_LIBRARIES glfw3_DIR)

find_package(GLEW REQUIRED)
cmake_print_variables(GLEW_FOUND GLEW_LIBRARIES GLEW_INCLUDE_DIRS)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC ZLIB::ZLIB ${PNG_LIBRARIES} ${CURL_LIBRARIES} libuv glfw GLEW::GLEW)
target_include_directories(main PUBLIC ${PNG_INCLUDED_DIRS} ${CURL_INCLUDE_DIRS})
target_compile_definitions(main PUBLIC ${PNG_DEFINITIONS} ${CURL_DEFINITIONS})
