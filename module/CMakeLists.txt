set(SOURCE_FILES
)

set(HEADER_FILES
)

set(CLASSES
    module
)

resolve_classes(${CLASSES})

add_library(module ${SOURCE_FILES} ${HEADER_FILES})

target_include_directories(module PUBLIC ${CMAKE_SOURCE_DIR})
