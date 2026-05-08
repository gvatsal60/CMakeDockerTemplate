cmake_minimum_required(VERSION 3.4...3.28)

set(INC inc)
set(SRC src)
set(LIB_SRC lib_src)
set(LIB_NAME memlib) # Change according to library name

file(GLOB ${LIB_SRC} ${SRC}/*.cpp)

add_library(${LIB_NAME} ${${LIB_SRC}})

target_include_directories(${LIB_NAME} PUBLIC ${INC})
