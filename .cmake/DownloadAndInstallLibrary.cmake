function(download_and_install_library)
    set(oneValueArgs LIBRARY_NAME)
    cmake_parse_arguments(
        DOWNLOAD_AND_INSTALL_LIBRARY "${options}" "${oneValueArgs}"
        "${multiValueArgs}" ${ARGN})
    
    set(LIBRARY_NAME ${DOWNLOAD_AND_INSTALL_LIBRARY_LIBRARY_NAME})
    
    if (NOT DEFINED ${LIBRARY_NAME}_REPOSITORY_CODE)
        message(FATAL_ERROR "${LIBRARY_NAME}_REPOSITORY_CODE variable is not defined!")
    endif()

    if (NOT DEFINED ${LIBRARY_NAME}_ARTIFACT_NAME)
        message(FATAL_ERROR "${LIBRARY_NAME}_ARTIFACT_NAME variable is not defined!")
    endif()

    if (NOT DEFINED ${${LIBRARY_NAME}_REPOSITORY_CODE}_REPOSITORY_URL)
        message(FATAL_ERROR "${${LIBRARY_NAME}_REPOSITORY_CODE}_REPOSITORY_URL variable is not defined!")
    endif()

    set(REPO_CODE ${${LIBRARY_NAME}_REPOSITORY_CODE})

    execute_process(
        COMMAND
        bash -c "mkdir -p ${DEPENDENCIES_DIR}/temp > /dev/null"
    )

    # check if artifact is already downloaded
    execute_process(
        COMMAND
        bash -c "test -f ${DEPENDENCIES_ARTIFACTS_DIR}/${${LIBRARY_NAME}_ARTIFACT_NAME}"
        RESULT_VARIABLE IS_ARTIFACT_NOT_DOWNLOADED
    )

    if (IS_ARTIFACT_NOT_DOWNLOADED EQUAL 1)
        execute_process(
            COMMAND
            bash -c "wget -P ${DEPENDENCIES_ARTIFACTS_DIR} -o - ${${REPO_CODE}_REPOSITORY_URL}/releases/download/${${REPO_CODE}_REPOSITORY_TAG}/${${LIBRARY_NAME}_ARTIFACT_NAME} > /dev/null"
            COMMAND_ERROR_IS_FATAL ANY
        )

        execute_process(
            COMMAND
            bash -c "tar -xzvf ${DEPENDENCIES_ARTIFACTS_DIR}/${${LIBRARY_NAME}_ARTIFACT_NAME} -C ${DEPENDENCIES_DIR}/temp 1>/dev/null"
            COMMAND_ERROR_IS_FATAL ANY
        )
    endif()

    execute_process(
        COMMAND
        bash -c "cp -r ${DEPENDENCIES_DIR}/temp/*/lib ${DEPENDENCIES_DIR}/lib 2> /dev/null"
    )

    execute_process(
        COMMAND
        bash -c "cp -r ${DEPENDENCIES_DIR}/temp/*/include ${DEPENDENCIES_DIR}/include 2> /dev/null"
    )

    execute_process(
        COMMAND
        bash -c "rm -rf ${DEPENDENCIES_DIR}/temp"
        COMMAND_ERROR_IS_FATAL ANY
    )
endfunction()
