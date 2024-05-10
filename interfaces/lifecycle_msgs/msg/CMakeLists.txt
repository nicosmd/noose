
nooseidl_generate_cpp(TARGET lifecycle_msgs PACKAGE_NAME lifecycle_msgs IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/State.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/Transition.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/TransitionDescription.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/TransitionEvent.msg
)