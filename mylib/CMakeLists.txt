cmake_minimum_required(VERSION 3.10.2)

project(mylib CXX)

file(GLOB SOURCES *.h *.cpp)
add_library(mylib STATIC ${SOURCES})

set(OUTPUT_LIB_DIR ${CMAKE_BINARY_DIR}/../lib)
message("libmylib.a output directory: ${MY_LIB_OUTPUT_DIRECTORY}")
set_target_properties(mylib 
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${MY_LIB_OUTPUT_DIRECTORY}"
)
