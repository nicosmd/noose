nooseidl_generate_cpp(TARGET service_msgs PACKAGE_NAME service_msgs IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/ServiceEventInfo.msg
        DEPS builtin_interfaces
)