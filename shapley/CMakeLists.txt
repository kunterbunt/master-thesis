cmake_minimum_required(VERSION 3.8)
project(shapley)

set(CMAKE_CXX_STANDARD 11)

add_subdirectory(src/tests)
add_subdirectory(src/lib)

set_target_properties(unittests PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/out/")
set_target_properties(shapley PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/out/")