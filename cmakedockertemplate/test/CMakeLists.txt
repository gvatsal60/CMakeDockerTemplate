# Set minimum required CMake version
cmake_minimum_required(VERSION 3.25)

# Enable testing for the project
enable_testing()

# Locate GTest package
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

# Include directories for project headers
set(INC ../inc)
include_directories(${INC})

# Set sources for the test executable
set(TEST_BIN_NAME testBin)
set(TEST_SRC_DIR src)
file(GLOB TEST_SOURCES ${TEST_SRC_DIR}/*.cpp)

# Check if any source files were found
if(NOT TEST_SOURCES)
  message(FATAL_ERROR "No test source files found in ${TEST_SRC_DIR}")
endif()

# Create the test executable
add_executable(${TEST_BIN_NAME} ${TEST_SOURCES})

# Link with GTest and your project's libraries
target_link_libraries(${TEST_BIN_NAME} ${GTEST_BOTH_LIBRARIES} memlib
                      Threads::Threads)
