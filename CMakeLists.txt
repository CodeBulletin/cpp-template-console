cmake_minimum_required(VERSION 3.21)
project(@NAME@ LANGUAGES CXX VERSION @VERSION@)
set(PROJECT_AUTHOR @AUTHOR@)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

@PKGIMPORT@

add_executable(
    @NAME@
    src/main.cpp
)

configure_file(
    version.h.in
    ${CMAKE_BINARY_DIR}/version.h
)

target_link_libraries(
    @NAME@ PRIVATE
        @PKGLINK@
        ${CMAKE_BINARY_DIR}
)
