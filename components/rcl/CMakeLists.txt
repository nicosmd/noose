set(TARGET_NAME rcl)

find_package(yaml REQUIRED)

add_library(${TARGET_NAME})

target_include_directories(${TARGET_NAME} PUBLIC include)

target_include_directories(${TARGET_NAME} PRIVATE src)

target_link_libraries(${TARGET_NAME} PUBLIC rcutils rmw type_description_interfaces tracing action_msgs)

target_link_libraries(${TARGET_NAME} PRIVATE yaml rcl_interfaces logging)

target_compile_definitions(${TARGET_NAME} PRIVATE ROS_PACKAGE_NAME="noose")

add_subdirectory(src)
