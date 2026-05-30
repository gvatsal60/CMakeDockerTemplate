cmake_minimum_required(VERSION 3.25)

find_package(GTest REQUIRED)
find_package(Threads REQUIRED)

set(TEST_BIN_NAME testBin)
set(TEST_SRC_DIR src)
file(GLOB TEST_SOURCES "${TEST_SRC_DIR}/*.cpp")

if(NOT TEST_SOURCES)
  message(FATAL_ERROR "No test source files found in ${TEST_SRC_DIR}")
endif()

add_executable(${TEST_BIN_NAME} ${TEST_SOURCES})

target_include_directories(${TEST_BIN_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/inc)
target_link_libraries(${TEST_BIN_NAME} PRIVATE GTest::gtest_main memlib Threads::Threads)

add_test(NAME UnitTests COMMAND ${TEST_BIN_NAME})
