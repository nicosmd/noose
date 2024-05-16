nooseidl_generate_cpp(TARGET action_msgs PACKAGE_NAME action_msgs IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/GoalInfo.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/GoalStatus.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/GoalStatusArray.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/CancelGoal.srv
        DEPS
        unique_identifier_msgs
        builtin_interfaces
)
