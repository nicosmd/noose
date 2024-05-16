set(TARGET_NAME logging)

add_library(${TARGET_NAME})

target_include_directories(${TARGET_NAME} PUBLIC include)

target_link_libraries(${TARGET_NAME} PUBLIC rcutils spdlog::spdlog)

add_subdirectory(src)
