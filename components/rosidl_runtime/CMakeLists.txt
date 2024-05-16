set(ROSIDL_RUNTIME_TARGET_NAME rosidl_runtime)

add_library(${ROSIDL_RUNTIME_TARGET_NAME})

target_include_directories(${ROSIDL_RUNTIME_TARGET_NAME} PUBLIC include)

target_link_libraries(${ROSIDL_RUNTIME_TARGET_NAME} PUBLIC rcutils fast-dds::fast-dds)

add_subdirectory(src)