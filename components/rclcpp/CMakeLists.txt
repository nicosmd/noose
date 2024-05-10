set(RCLCPP_TARGET_NAME rclcpp)

add_library(${RCLCPP_TARGET_NAME})

target_include_directories(${RCLCPP_TARGET_NAME} PUBLIC include)

target_link_libraries(${RCLCPP_TARGET_NAME} PRIVATE lifecycle_msgs)

add_subdirectory(src)
