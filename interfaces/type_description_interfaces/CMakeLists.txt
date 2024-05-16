nooseidl_generate_cpp(TARGET type_description_interfaces PACKAGE_NAME type_description_interfaces IDLS
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/Field.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/FieldType.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/IndividualTypeDescription.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/KeyValue.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/TypeDescription.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/msg/TypeSource.msg
        ${CMAKE_CURRENT_SOURCE_DIR}/srv/GetTypeDescription.srv
)
