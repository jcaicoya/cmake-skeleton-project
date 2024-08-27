cmake_minimum_required(VERSION 3.10.2)

project(mytest CXX)

##################################
# Download and install GoogleTest

include(FetchContent)
FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

##################################

include_directories(../mylib)
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
