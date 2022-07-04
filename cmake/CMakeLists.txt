cmake_minimum_required(VERSION 3.5)

project(db_mq_all)

add_definitions("-Wall -g")

message("CMAKE_CURRENT_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}")
message("CMAKE_CURRENT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}")
message("CMAKE_CURRENT_LIST_DIR ${CMAKE_CURRENT_LIST_DIR}")
message("CMAKE_CURRENT_LIST_FILE ${CMAKE_CURRENT_LIST_FILE}")
message("CMAKE_CURRENT_LIST_LINE ${CMAKE_CURRENT_LIST_LINE}")
message("PROJECT_BINARY_DIR ${PROJECT_BINARY_DIR}")
message("PROJECT_SOURCE_DIR ${PROJECT_SOURCE_DIR}")

# 设置头文件
include_directories("${PROJECT_SOURCE_DIR}/include")
include_directories("/usr/local/include")
# include_directories("/usr/local/ffmpeg/include")

# 设置库路径
# if(CMAKE_HOST_SYSTEM_PROCESSOR MATCHES "aarch64")
#     link_directories("${PROJECT_SOURCE_DIR}/lib/aarch64")
#     message("this is aarch64 cpu")
# elseif(CMAKE_HOST_SYSTEM_PROCESSOR MATCHES "x86_64")
#     link_directories("${PROJECT_SOURCE_DIR}/lib/x86_64")
# 	message("this is x86_64 cpu")
# endif()

# ffmpeg路径
# link_directories("/usr/local/ffmpeg/lib")
# link_directories("/usr/local/lib")

# Add sub directories
# 定义子目录src，用以递归的调用src中的MakeLists.txt
add_subdirectory(src)
add_subdirectory(main)
