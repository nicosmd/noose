target_sources(${ROSIDL_RUNTIME_TARGET_NAME} PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/serialization_support.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/fastrtps_serialization_support.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/fastrtps_dynamic_type.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/utils.hpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/fastrtps_dynamic_data.hpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/fastrtps_serialization_support.hpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/macros.hpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/fastrtps_dynamic_type.hpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/fastrtps_dynamic_data.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/detail/utils.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/identifier.cpp
)