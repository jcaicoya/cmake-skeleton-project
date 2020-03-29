cmake_minimum_required(VERSION 3.10.2)

project(myapp CXX)

include_directories(../mylib)
#set(MY_LIB_OUTPUT_DIRECTORY /home/caico/workspaces/cpp/base/lib)
link_directories(${MY_LIB_OUTPUT_DIRECTORY})

file(GLOB SOURCES *.h *.cpp)
add_executable(myapp ${SOURCES})
target_link_libraries(myapp mylib)

message("myapp output directory: ${MY_BIN_OUTPUT_DIRECTORY}")
set_target_properties(myapp
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${MY_BIN_OUTPUT_DIRECTORY}"
)

