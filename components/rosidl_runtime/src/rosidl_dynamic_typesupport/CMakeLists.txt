target_sources(${ROSIDL_RUNTIME_TARGET_NAME} PRIVATE
        api
        api/dynamic_type.c
        api/serialization_support.c
        api/dynamic_data.c
        identifier.c
        dynamic_message_type_support_struct.c
)
