nooseidl_generate_cpp(TARGET rosgraph_msgs PACKAGE_NAME rosgraph_msgs IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/Clock.msg
        DEPS
        builtin_interfaces
)
