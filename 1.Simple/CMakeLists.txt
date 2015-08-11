cmake_minimum_required(VERSION 2.8)
set(the_target "simple")
project(${the_target})

find_package(OpenCV REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS})
add_executable(${the_target} ${the_target}.cpp)
target_link_libraries(${the_target} ${OpenCV_LIBS})