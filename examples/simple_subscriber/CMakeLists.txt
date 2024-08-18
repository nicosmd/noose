add_executable(simple_subscriber main.cpp)

target_link_libraries(simple_subscriber PRIVATE rclcpp std_msgs)
