cmake_minimum_required(VERSION 3.24)

# This file should be included in CMAKE_PROJECT_TOP_LEVEL_INCLUDES variable, 
# which should be passed to the cmake as command line argument!

# Sets provide_dependency as a dependency provider for current 
# configuration. This macro is then automatically called by the cmake before
# find_package function execution.

include(${CMAKE_CURRENT_SOURCE_DIR}/.cmake/DownloadAndInstallLibrary.cmake)

if (NOT DEFINED DEPENDENCIES_DIR_NAME)
    set(DEPENDENCIES_DIR_NAME "dependencies")
endif ()

if (NOT DEFINED DEPENDENCIES_DIR)
    set(DEPENDENCIES_DIR
        "${CMAKE_BINARY_DIR}/${DEPENDENCIES_DIR_NAME}")

    set(DEPENDENCIES_ARTIFACTS_DIR
        "${CMAKE_BINARY_DIR}/${DEPENDENCIES_DIR_NAME}/artifacts")
endif ()

# Tell the built-in implementation to look in our area first, unless
# the find_package() call uses NO_..._PATH options to exclude it
list(APPEND CMAKE_MODULE_PATH ${DEPENDENCIES_DIR}/cmake)
list(APPEND CMAKE_PREFIX_PATH ${DEPENDENCIES_DIR})

macro(provide_dependency method package_name)
    download_and_install_library(
        LIBRARY_NAME ${package_name}
    )
endmacro()

cmake_language(
    SET_DEPENDENCY_PROVIDER provide_dependency
    SUPPORTED_METHODS FIND_PACKAGE
)
