cmake_minimum_required(VERSION 3.10.2)

project(mytest CXX)

include_directories(../mylib)
#set(MY_LIB_OUTPUT_DIRECTORY /home/caico/workspaces/cpp/base/lib)
link_directories(${MY_LIB_OUTPUT_DIRECTORY})

file(GLOB SOURCES *.h *.cpp)
add_executable(mytest ${SOURCES})
add_test(NAME mytest COMMAND mytest)
target_link_libraries(mytest mylib gtest pthread)

message("mytest output directory: ${MY_BIN_OUTPUT_DIRECTORY}")
set_target_properties(mytest
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${MY_BIN_OUTPUT_DIRECTORY}"
)
