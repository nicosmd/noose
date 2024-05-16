function(camel_to_snake input output_name)
    string(REGEX REPLACE "(.)([A-Z][a-z]+)" "\\1_\\2" intermediate ${input})
    string(REGEX REPLACE "([a-z0-9])([A-Z])" "\\1_\\2" intermediate ${intermediate})
    string(TOLOWER ${intermediate} output)
    set(${output_name} ${output} PARENT_SCOPE)
endfunction()

function(nooseidl_generate_cpp)
    set(_options)
    set(_singleargs TARGET PACKAGE_NAME)
    set(_multiargs IDLS DEPS)

    cmake_parse_arguments(nooseidl_generate_cpp "${_options}" "${_singleargs}" "${_multiargs}" "${ARGN}")

    set(VISIBILITY_FILES
            ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/msg/rosidl_generator_c__visibility_control.h
            ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/msg/rosidl_typesupport_fastrtps_cpp__visibility_control.h
            ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/msg/rosidl_generator_cpp__visibility_control.hpp
    )

    foreach (nooseidl_generate_cpp_IDL ${nooseidl_generate_cpp_IDLS})
        get_filename_component(IDL_NAME ${nooseidl_generate_cpp_IDL} NAME_WE)
        get_filename_component(IDL_TYPE ${nooseidl_generate_cpp_IDL} LAST_EXT)

        string(REPLACE "." "" IDL_TYPE ${IDL_TYPE})

        string(TOLOWER ${IDL_NAME} IDL_NAME_LOWER)
        camel_to_snake(${IDL_NAME} IDL_NAME_LOWER_SNAKE)

        if ("${IDL_TYPE}" STREQUAL "srv")
            list(APPEND nooseidl_generate_cpp_DEPS "service_msgs")
        endif ()

        list(APPEND META_FILES
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME}.idl
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME}.json
        )

        list(APPEND HEADERS
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME_LOWER_SNAKE}.h
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME_LOWER_SNAKE}.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__builder.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__struct.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__type_support.h
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__type_support.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__rosidl_typesupport_fastrtps_cpp.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__rosidl_typesupport_introspection_cpp.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__traits.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__struct.h
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__functions.h
        )

        list(APPEND SRCS
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME_LOWER_SNAKE}__type_support.cpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME_LOWER_SNAKE}__type_support_c.cpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/dds_fastrtps/${IDL_NAME_LOWER_SNAKE}__type_support.cpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__type_support.c
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__description.c
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__type_support.cpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER_SNAKE}__functions.c
        )
    endforeach ()

    set(NOOSEGEN_PATH /home/sin7hi/dev/noose-idl/dist/noosegen/noosegen)

    set(INCLUDE_ARG)

    if (nooseidl_generate_cpp_DEPS)
        list(APPEND INCLUDE_ARG "--include-dir")
        foreach (nooseidl_generate_cpp_DEP ${nooseidl_generate_cpp_DEPS})
            set(MSG_DIR ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_DEP}/msg)
            set(SRV_DIR ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_DEP}/srv)
            set(ACTION_DIR ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_DEP}/action)

            list(APPEND INCLUDE_ARG ${MSG_DIR})
            list(APPEND INCLUDE_ARG ${SRV_DIR})
            list(APPEND INCLUDE_ARG ${ACTION_DIR})
        endforeach ()
    endif ()

    add_custom_command(
            OUTPUT ${META_FILES} ${HEADERS} ${SRCS}
            COMMAND ${NOOSEGEN_PATH} --package-name ${nooseidl_generate_cpp_PACKAGE_NAME} --input ${nooseidl_generate_cpp_IDLS} --cpp-output-dir ${CMAKE_BINARY_DIR}/gen --idl-output-dir ${CMAKE_BINARY_DIR}/gen ${INCLUDE_ARG}
            DEPENDS ${nooseidl_generate_cpp_IDLS}
            VERBATIM)

    #    add_custom_target(${nooseidl_generate_cpp_TARGET} DEPENDS ${STATE_OUTPUT_FILES_META} ${STATE_OUTPUT_FILES_HEADERS} ${STATE_OUTPUT_FILES_SRCS})

    if (NOT TARGET ${nooseidl_generate_cpp_TARGET})
        message("Create target ${nooseidl_generate_cpp_TARGET}")
        add_library(${nooseidl_generate_cpp_TARGET})
    endif ()

    target_sources(${nooseidl_generate_cpp_TARGET} PUBLIC FILE_SET HEADERS BASE_DIRS ${CMAKE_BINARY_DIR}/gen FILES ${HEADERS})
    target_sources(${nooseidl_generate_cpp_TARGET} PRIVATE ${SRCS})

    target_link_libraries(${nooseidl_generate_cpp_TARGET} PUBLIC rosidl_runtime fastcdr)

    if (NOT "${nooseidl_generate_cpp_TARGET}" STREQUAL "rmw")
        target_link_libraries(${nooseidl_generate_cpp_TARGET} PUBLIC rmw)
    endif ()

    if (nooseidl_generate_cpp_DEPS)
        foreach (nooseidl_generate_cpp_DEP ${nooseidl_generate_cpp_DEPS})
            target_link_libraries(${nooseidl_generate_cpp_TARGET} PUBLIC ${nooseidl_generate_cpp_DEP})
        endforeach ()
    endif ()

    if ("${IDL_TYPE}" STREQUAL "srv")
        target_link_libraries(${nooseidl_generate_cpp_TARGET} PUBLIC service_msgs)
    endif ()
endfunction()
