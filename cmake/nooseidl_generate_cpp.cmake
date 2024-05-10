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

        list(APPEND META_FILES
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME}.idl
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME}.json
        )

        list(APPEND HEADERS
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME_LOWER}.h
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/${IDL_NAME_LOWER}.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__builder.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__struct.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__type_support.h
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__type_support.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__rosidl_typesupport_fastrtps_cpp.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__rosidl_typesupport_introspection_cpp.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__traits.hpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__struct.h
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__functions.h
        )

        list(APPEND SRCS
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/dds_fastrtps/${IDL_NAME_LOWER}__type_support.cpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__type_support.c
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__description.c
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__type_support.cpp
                ${CMAKE_BINARY_DIR}/gen/${nooseidl_generate_cpp_PACKAGE_NAME}/${IDL_TYPE}/detail/${IDL_NAME_LOWER}__functions.c
        )
    endforeach ()

    set(NOOSEGEN_PATH /home/sin7hi/dev/noose-idl/dist/noosegen/noosegen)

    add_custom_command(
            OUTPUT ${META_FILES} ${HEADERS} ${SRCS}
            COMMAND ${NOOSEGEN_PATH} --package-name ${nooseidl_generate_cpp_PACKAGE_NAME} --input ${nooseidl_generate_cpp_IDLS} --cpp-output-dir ${CMAKE_BINARY_DIR}/gen --idl-output-dir ${CMAKE_BINARY_DIR}/gen
            DEPENDS ${nooseidl_generate_cpp_IDLS}
            VERBATIM)

    #    add_custom_target(${nooseidl_generate_cpp_TARGET} DEPENDS ${STATE_OUTPUT_FILES_META} ${STATE_OUTPUT_FILES_HEADERS} ${STATE_OUTPUT_FILES_SRCS})

    add_library(${nooseidl_generate_cpp_TARGET})

    target_sources(${nooseidl_generate_cpp_TARGET} PUBLIC FILE_SET HEADERS BASE_DIRS ${CMAKE_BINARY_DIR}/gen FILES ${HEADERS})
    target_sources(${nooseidl_generate_cpp_TARGET} PRIVATE ${SRCS})
endfunction()
