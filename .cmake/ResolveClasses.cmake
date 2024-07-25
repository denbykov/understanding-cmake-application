function(resolve_classes)
    foreach(el ${ARGV})
        list(APPEND HEADER_FILES "${el}.h")
        list(APPEND SOURCE_FILES "${el}.cpp")
    endforeach()

    set(HEADER_FILES "${HEADER_FILES}" PARENT_SCOPE)
    set(SOURCE_FILES "${SOURCE_FILES}" PARENT_SCOPE)
endfunction()
