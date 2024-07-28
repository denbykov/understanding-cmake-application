cmake_minimum_required(VERSION 3.24)

project(application VERSION "1.0.0" LANGUAGES CXX)

enable_testing()

set(UCL_REPOSITORY_TAG "v1.0.0")

include(.cmake/All.cmake)

add_compile_options(-Wall -Wextra -pedantic)

find_package(my_library REQUIRED PATHS ${CMAKE_BINARY_DIR}/my_library)

add_subdirectory(module)

set(SOURCE_FILES
    main.cpp
)

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/Config.h.in"
    "${CMAKE_CURRENT_SOURCE_DIR}/Config.h"
)

add_executable(my_app ${SOURCE_FILES} ${HEADER_FILES})

target_link_libraries(my_app PRIVATE module my_library)

find_package(GTest REQUIRED)

set(TEST_SOURCE_FILES
    tests/my_test.cpp
)

add_executable(my_test ${TEST_SOURCE_FILES})

add_test(
    NAME my_test
    COMMAND $<TARGET_FILE:my_test>
)

target_link_libraries(my_test PRIVATE GTest::GTest GTest::Main)
