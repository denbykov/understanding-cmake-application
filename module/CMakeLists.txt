set(SOURCE_FILES
    module.cpp
)

add_library(module ${SOURCE_FILES} ${HEADER_FILES})

target_include_directories(module 
    PUBLIC
    ${CMAKE_SOURCE_DIR}/config
)
