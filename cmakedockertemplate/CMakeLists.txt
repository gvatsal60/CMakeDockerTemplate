# Set minimum required CMake version
cmake_minimum_required(VERSION 3.25)

# Set project name and version
set(PROJECT_NAME cmakeTemplate)
set(PROJECT_VERSION 1.0.0)
project(${PROJECT_NAME} VERSION ${PROJECT_VERSION})

# Set C++ standard to C++17 and enforce it
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Append compiler flags for additional warnings and strictness
string(APPEND CMAKE_CXX_FLAGS " -Wall")
string(APPEND CMAKE_CXX_FLAGS " -Wbuiltin-macro-redefined")
string(APPEND CMAKE_CXX_FLAGS " -pedantic")
string(APPEND CMAKE_CXX_FLAGS " -Werror")

# Set directories for source, include, and library files
set(SRC src)
set(INC inc)
set(LIB lib)

# Set name for the executable binary
set(EXEC_BIN_NAME debugBin)

# Specify required libraries, change accordingly
set(REQUIRED_LIB memlib)

# Find all subdirectories in the 'lib' directory and add them as subprojects
file(
  GLOB V_GLOB
  LIST_DIRECTORIES true
  ${LIB}/*)
foreach(item ${V_GLOB})
  if(IS_DIRECTORY ${item})
    add_subdirectory(${item})
  endif()
endforeach()

# Find all source files in the 'src' directory
file(GLOB SOURCE_FILES ${SRC}/*.cpp)

# Create the executable binary and link it with the necessary directories and
# libraries
add_executable(${EXEC_BIN_NAME} ${SOURCE_FILES})
target_include_directories(${EXEC_BIN_NAME} PRIVATE ${INC})
target_link_libraries(${EXEC_BIN_NAME} PUBLIC ${REQUIRED_LIB})

# Add the 'test' subdirectory for testing
add_subdirectory(test)
