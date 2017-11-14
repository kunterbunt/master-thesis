cmake_minimum_required(VERSION 3.8)
set(CMAKE_CXX_STANDARD 11)
project(shapley-lib)

include_directories(..)

set(SOURCE_FILES_SHAPLEY-LIB
        shapley.cpp
        shapley.h)

add_library(shapley ${SOURCE_FILES_SHAPLEY-LIB})