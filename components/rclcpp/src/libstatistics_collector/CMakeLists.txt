target_sources(${RCLCPP_TARGET_NAME} PRIVATE
        collector/collector.cpp
        collector/generate_statistics_message.cpp
        moving_average_statistics/types.cpp
        moving_average_statistics/moving_average.cpp
)
