cmake_minimum_required(VERSION 3.24)

set(LIBRARY_NAME my_library)

list(APPEND CUSTOM_LIBRARIES ${LIBRARY_NAME})

set(${LIBRARY_NAME}_REPOSITORY_CODE UCL)
set(${LIBRARY_NAME}_ARTIFACT_NAME "my_library.tar.gz")

set(UCL_REPOSITORY_URL "https://github.com/denbykov/understanding-cmake-library")

if (NOT DEFINED UCL_REPOSITORY_TAG)
    message(FATAL_ERROR "UCL_TAG variable is not defined!")
endif ()

unset(LIBRARY_NAME)
