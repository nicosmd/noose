set(TARGET_NAME rcutils)

add_library(${TARGET_NAME})

target_include_directories(${TARGET_NAME} PUBLIC include)

add_subdirectory(src)

target_compile_definitions(${TARGET_NAME} PRIVATE -D_GNU_SOURCE)