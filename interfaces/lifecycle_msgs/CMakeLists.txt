nooseidl_generate_cpp(TARGET lifecycle_msgs PACKAGE_NAME lifecycle_msgs IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/State.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/Transition.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/TransitionDescription.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/TransitionEvent.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/ChangeState.srv
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/GetAvailableStates.srv
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/GetAvailableTransitions.srv
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/GetState.srv
)