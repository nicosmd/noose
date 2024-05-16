add_executable(simple_publisher main.cpp)

target_link_libraries(simple_publisher PRIVATE rclcpp std_msgs)