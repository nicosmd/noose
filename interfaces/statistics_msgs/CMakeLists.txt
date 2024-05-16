nooseidl_generate_cpp(TARGET statistics_msgs PACKAGE_NAME statistics_msgs IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/MetricsMessage.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/StatisticDataPoint.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/StatisticDataType.msg
        DEPS
        builtin_interfaces
)
