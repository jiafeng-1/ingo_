#******************************************************#
#                       配置项
#******************************************************#
# 编译器  gcc ---> c工程 | g++ ---> c++工程
# CC=gcc
CC=g++

# 是否链接库 yes --->是 | no ---> 否
LIB=no
# 链接三方库名称
SLIBRARY=-l 

# 编译后的二进制文件名称
target=test

#******************************************************#
#                       路径
#******************************************************#
# 工程路径设置

# CUR_DIR := $(shell pwd)
CUR_DIR=.
	@echo "CUR_DIR=$(CUR_DIR)"
SRC_DIR=$(CUR_DIR)/src
INCLUDE_DIR=-I$(CUR_DIR)/include 
MAIN_DIR=$(CUR_DIR)/main
# ANALYSE_DIR=$(SRC_DIR)/analyse
# DRI_DIR=$(SRC_DIR)/dri
# SYS_DIR=$(SRC_DIR)/sys

# 设置三方库路径
OS=`uname -m`
SLIBRARY_DIR=-L$(CUR_DIR)/lib/$(OS)


# ifeq ($(LIB), yes)
# LIBRARIES   = $(SLIBRARY)
# else
# LIBRARIES   = $(SLIBRARY) $(DLIBRARY)
# endif
#******************************************************#
#                     C 工程
#******************************************************#
ifeq ($(CC), gcc)

srcs=$(wildcard $(SRC_DIR)/*.c)   \
   $(wildcard $(MAIN_DIR)/*.c) 
	@echo "srcs=$(srcs)"
#目标文件
objs=$(patsubst %.c, %.o, $(srcs))

ifeq ($(LIB), yes)
CCFLAG=-g -Wall $(INCLUDE_DIR) $(SLIBRARY_DIR) $(SLIBRARY) 
else
CCFLAG=-g -Wall $(INCLUDE_DIR)
endif

$(target):$(objs)
	@echo $(srcs)
	$(CC) -o $(target) $(objs) 
	@make clean

$(objs):%.o:%.c
	$(CC) $(CCFLAG) -c $< -o $@

clean:
	rm -rf $(objs)

endif

#******************************************************#
#                     C++ 工程
#******************************************************#
ifeq ($(CC), g++)

srcs=$(wildcard $(SRC_DIR)/*.cpp)   \
   $(wildcard $(MAIN_DIR)/*.cpp) 

#目标文件
objs=$(patsubst %.cpp, %.o, $(srcs))

ifeq ($(LIB), yes)
CCFLAG=-g -Wall $(INCLUDE_DIR) $(SLIBRARY_DIR) $(SLIBRARY) 
else
CCFLAG=-g -Wall $(INCLUDE_DIR)
endif

$(target):$(objs)
	@echo $(srcs)
	$(CC) -o $(target) $(objs) 
	@make clean

$(objs):%.o:%.cpp
	$(CC) $(CCFLAG) -c $< -o $@

clean:
	rm -rf $(objs)

endif