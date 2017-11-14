cmake_minimum_required(VERSION 3.8)
set(CMAKE_CXX_STANDARD 11)
project(shapley-unittests)

include_directories(..)

find_library(LIBRARY-PATH :libcppunit.so)
link_directories(${LIBRARY-PATH})

set(SOURCE_FILES_UNITTESTS
        unittests.cpp
        ../lib/tests/ShapleyTests.cpp
)

set(CMAKE_BUILD_TYPE Debug)
add_executable(unittests ${SOURCE_FILES_UNITTESTS})
target_link_libraries(unittests shapley :libcppunit.so)