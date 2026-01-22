cmake_minimum_required(VERSION 3.21)
project(@NAME@ LANGUAGES CXX VERSION @VERSION@)
set(PROJECT_AUTHOR @AUTHOR@)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(PROJECT_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}")

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

# -------------------------
# Install
# -------------------------
install(TARGETS ${PROJECT_NAME}
    EXPORT ${PROJECT_NAME}Targets
    ARCHIVE DESTINATION ${PROJECT_INSTALL_DIR}
    LIBRARY DESTINATION ${PROJECT_INSTALL_DIR}
    RUNTIME DESTINATION ${PROJECT_INSTALL_DIR}
)

install(DIRECTORY include/
    DESTINATION ${PROJECT_INSTALL_DIR}
)

install(EXPORT ${PROJECT_NAME}Targets
    NAMESPACE ${PROJECT_NAME}::
    DESTINATION ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}installinfo
)

include(CMakePackageConfigHelpers)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/${PROJECT_NAME}Config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    INSTALL_DESTINATION ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}installinfo
)

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
    DESTINATION ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}installinfo
)

# -------------------------
# Uninstall target (CORRECT)
# -------------------------
if (NOT TARGET uninstall)
    configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake/cmake_uninstall.cmake.in"
        "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
        IMMEDIATE @ONLY
    )

    add_custom_target(uninstall
        COMMAND ${CMAKE_COMMAND} -P
                ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake
        COMMENT "Uninstalling ${PROJECT_NAME}"
    )
endif()
