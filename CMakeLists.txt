cmake_minimum_required(VERSION 3.20)

project(rclcpp)

if(NOT CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

include(cmake/nooseidl_generate_cpp.cmake)


add_subdirectory(interfaces)

add_subdirectory(components)