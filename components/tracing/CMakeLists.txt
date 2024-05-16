set(TARGET_NAME tracing)

add_library(${TARGET_NAME})

target_include_directories(${TARGET_NAME} PUBLIC include)

#target_compile_definitions()
#target_link_libraries(${TARGET_NAME} PUBLIC rcutils rosidl_runtime)

add_subdirectory(src)
