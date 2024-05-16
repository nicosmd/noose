set(TARGET_NAME rmw)

add_library(${TARGET_NAME})

target_include_directories(${TARGET_NAME} PUBLIC include)

target_link_libraries(${TARGET_NAME} PUBLIC rcutils rosidl_runtime fast-dds::fast-dds tracing)

add_subdirectory(src)

nooseidl_generate_cpp(TARGET rmw PACKAGE_NAME rmw_dds_common IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/Gid.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/NodeEntitiesInfo.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/ParticipantEntitiesInfo.msg
)
