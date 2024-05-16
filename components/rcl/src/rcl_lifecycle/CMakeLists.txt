target_sources(${TARGET_NAME} PRIVATE
        default_state_machine.c
        com_interface.h
        com_interface.c
        rcl_lifecycle.c
        transition_map.c
)
