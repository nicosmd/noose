nooseidl_generate_cpp(TARGET composition_interfaces PACKAGE_NAME composition_interfaces IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/ListNodes.srv
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/LoadNode.srv
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/UnloadNode.srv
        DEPS
        rcl_interfaces
)
