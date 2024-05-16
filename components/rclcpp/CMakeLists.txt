set(RCLCPP_TARGET_NAME rclcpp)

find_package(Boost REQUIRED)
find_package(console_bridge REQUIRED)
find_package(Poco REQUIRED)

add_library(${RCLCPP_TARGET_NAME})

target_include_directories(${RCLCPP_TARGET_NAME} PUBLIC include)

target_link_libraries(${RCLCPP_TARGET_NAME} PUBLIC rcl rmw)

target_link_libraries(${RCLCPP_TARGET_NAME} PRIVATE
        lifecycle_msgs
        logging
        statistics_msgs
        rosgraph_msgs
        composition_interfaces
        Boost::headers
        console_bridge::console_bridge
        Poco::Util
)

add_subdirectory(src)
