cmake_minimum_required(VERSION 3.24)

set(my_library_REPOSITORY_CODE UCL)
set(my_library_ARTIFACT_NAME "my_library.tar.gz")

set(UCL_REPOSITORY_URL "https://github.com/denbykov/understanding-cmake-library")

if (NOT DEFINED UCL_REPOSITORY_TAG)
    message(FATAL_ERROR "UCL_TAG variable is not defined!")
endif ()
