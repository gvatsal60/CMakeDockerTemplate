cmake_minimum_required(VERSION 3.25)

set(INC inc)
set(SRC src)
set(LIB_NAME memlib)

file(GLOB LIB_SRC "${SRC}/*.cpp")

add_library(${LIB_NAME} ${LIB_SRC})

target_include_directories(${LIB_NAME} PUBLIC ${INC})
