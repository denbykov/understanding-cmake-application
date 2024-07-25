cmake_minimum_required(VERSION 3.24)

project(application VERSION "1.0.0" LANGUAGES CXX)

add_compile_options(-Wall -Wextra -pedantic)

add_subdirectory(module)

set(SOURCE_FILES
    main.cpp
)

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/Config.h.in"
    "${CMAKE_CURRENT_SOURCE_DIR}/config/Config.h"
)

add_executable(my_app ${SOURCE_FILES} ${HEADER_FILES})

target_link_libraries(my_app PRIVATE module)
