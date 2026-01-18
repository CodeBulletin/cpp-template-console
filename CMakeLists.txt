cmake_minimum_required(VERSION 3.21)
project(@NAME@ LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

@PKGIMPORT@

add_executable(
    @NAME@
    src/main.cpp
)
target_link_libraries(
    @NAME@ PRIVATE
        @PKGLINK@
)
