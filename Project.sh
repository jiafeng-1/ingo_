#!/bin/bash
###
 # @Author: jiafeng jiafeng@apple.com
 # @Date: 2022-07-03 21:03:23
 # @LastEditors: jiafeng jiafeng@apple.com
 # @LastEditTime: 2022-07-10 13:38:15
 # @FilePath: /pthread_t/Project/Project.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 
VERSION="B-0.1.1"

c_main="
#include <stdio.h>\n#include <stdlib.h>\n\nint main(int argc, char *argv[])\n{\n\n\treturn 0;\n}
"

cpp_main="
#include <iostream>\n\nint main(int argc, char *argv[])\n{\n\n\treturn 0;\n}
"

function cat_c_main() {
    cat << EOF >> ./main/main.c
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{
    return 0;
}
EOF
}

function cat_cpp_main() {
    cat << EOF >> ./main/main.cpp
#include <iostream>
int main(int argc, char *argv[])
{
    return 0;
}
EOF
}



#******************************************************#
#               输出版本信息
#******************************************************#
function echo_version() {
    cat << END
    
Alpha -- 内部测试版　Beta -- 公开测试版 Release -- 发行版 
主版本号 . 子版本号 [. 修正版本号[ build- 编译版本号 ]] 

Version No: ${VERSION}

END
}

#******************************************************#
#               输出帮助信息
#******************************************************#
function ingo_help() {
    cat << END
Usage: ingo [options] [target] ...
Options:
    [-c]            创建软件工程(-c可选)

    -v, --version   查看ingo软件版本
    -h, --help      输出软件帮助信息

Report bugs to<>
END
}

#******************************************************#
#                   监测命令
#  (输入命令参数只有一个，且不为Option参数，默认为工程名称)
#******************************************************#
function ingo_input() {

    if [[ $1 == '-v' ]] || [[ $1 == '--version' ]]; then
        echo_version
        exit
    elif [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then
        ingo_help
        exit
    # elif [ $1 == '-L' ]; then

    # elif [ $1 == '-I' ]; then
    fi
    
    if [ $# -eq 1 ]; then
        ProjectName=$1
        return 
    fi
    if [ $1 == '-c' ]; then
        ProjectName=$2
    fi
    return 
}

#******************************************************#
#               判断工程文件夹是否已经存在
#******************************************************#
function  check_Fload () {
    
    if [ -d ${ProjectName} ]; then
        echo -e "\033[47;31;5m Fail, The Folder Already Exists \033[0m"
        exit
    else
        mkdir ${ProjectName}
        if [ -d ${ProjectName} ]; then
            echo -e "\033[47;31;5m Succeed \033[0m" 
        else
            echo -e "\033[47;31;5m Fail \033[0m"
            exit
        fi
    fi
}

#******************************************************#
#                  创建工程version文件
#******************************************************#
function mk_Version() {
    cat << EOF >> version
Alpha -- 内部测试版　Beta -- 公开测试版  Release -- 发行版

主版本号 . 子版本号 [. 修正版本号[ build- 编译版本号 ]]
1.项目初版本时,版本号可以为 0.1 或 0.1.0,也可以为 1.0 或 1.0.0;
2.当项目在进行了局部修改或 bug 修正时,主版本号和子版本号都不变,修正版本号加 1;
3.当项目在原有的基础上增加了部分功能时,主版本号不变,子版本号加 1,修正版本号复位为 0,因而可以被忽略掉 ;
4.当项目在进行了重大修改或局部修正累积较多,而导致项目整体发生全局变化时,主版本号加 1;
5.另外,编译版本号一般是编译器在编译过程中自动生成的,我们只定义其格式,并不进行人为控制 .

/*************************************************************************************/

    Version: A-0.1.0

    Data: `date`
    
    Describe: 内部测试版本。

/*************************************************************************************/
    
EOF
}

#******************************************************#
#                       创建C工程
#******************************************************#
function mk_C_Project () {
    if [ ${PROJECT_VERSION} -eq 1 ]; then   
        touch version && mk_Version
    fi
    mkdir conf 
    mkdir auto
    mkdir -p lib/x86_64 lib/aarch64
    mkdir src 
    mkdir include
    mkdir main && touch ./main/main.c
    cat_c_main

    # echo -e $1 > main.c
    
}
#******************************************************#
#                      创建CPP工程
#******************************************************#
function mk_CPP_Project() {
    if [ ${PROJECT_VERSION} -eq 1 ]; then   
        touch version && mk_Version
    fi
    mkdir conf
    mkdir auto
    mkdir -p lib/x86_64 lib/aarch64
    mkdir src 
    mkdir include
    mkdir main && cd main && touch main.cpp
    cat_cpp_main
    # echo -e $1 > main.cpp
    
}

#******************************************************#
#                      创建CUDA工程
#******************************************************#
function mk_CUDA_Project() {
    cat << END
    "sorry,还不支持CUDA工程生成"
END
    exit
    mkdir -p lib/x86_64 lib/aarch64
    mkdir src 
    mkdir include
    mkdir cuda_c
    mkdir main && cd main && touch main.cpp
    
    echo -e $1 > main.c
}

#******************************************************#
#                      输出帮助信息
#******************************************************#
function echo_hellp ()
{
        cat << END

   输入 c     建立C工程    
   输入 cpp   建立C++工程  

END
}

#******************************************************#
#                      创建工程
#******************************************************#
function create_project() {
    while :
    do
        echo_hellp
        read input
        if [ ${input} == 'c' ]; then
            echo -e "\033[47;31;5m Create C Project Succeed \033[0m" 
            mk_C_Project "$c_main"
            break
        elif [ ${input} == 'cpp' ]; then
            echo -e "\033[47;31;5m Create CPP Project Succeed\033[0m"
            mk_CPP_Project "$cpp_main"
            break
        fi 
    done
}

#******************************************************#
#                      拷贝编译文本
#******************************************************#
function cp_build() {
            cat << END

   输入 make    工程将选用make工具     
   输入 cmake   工程将选用cmake工具   

END
    read input
    if [ ${input} == 'make' ]; then
        cp ${Template}/make/Makefile ${ProjectPosition}/${ProjectName}
        cp ${Template}/auto/* ${ProjectPosition}/${ProjectName}/auto
        buildMode="make"
    elif [ ${input} == 'cmake' ]; then
        cp ${Template}/cmake/CMakeLists.txt ${ProjectPosition}/${ProjectName}
        cp ${Template}/cmake/CMakeLists_srs.txt ${ProjectPosition}/${ProjectName}/src 
        cp ${Template}/cmake/CMakeLists_main.txt ${ProjectPosition}/${ProjectName}/main
        mv ${ProjectPosition}/${ProjectName}/src/CMakeLists_srs.txt ${ProjectPosition}/${ProjectName}/src/CMakeLists.txt  
        mv ${ProjectPosition}/${ProjectName}/main/CMakeLists_main.txt ${ProjectPosition}/${ProjectName}/main/CMakeLists.txt 
        cp ${Template}/auto/* ${ProjectPosition}/${ProjectName}/auto
        buildMode="cmake"
    fi  
}

#******************************************************#
#                      拷贝Vscode调试文件
#******************************************************#
function cp_debug() {
    if [ ${buildMode} == 'make' ]; then
        cp -r ${Template}/.vscode_make ${ProjectPosition}/${ProjectName}
        mv ${ProjectPosition}/${ProjectName}/.vscode_make ${ProjectPosition}/${ProjectName}/.vscode 
        
    elif [ ${buildMode} == 'cmake' ]; then
        cp -r ${Template}/.vscode_cmake ${ProjectPosition}/${ProjectName}
        mv ${ProjectPosition}/${ProjectName}/.vscode_cmake ${ProjectPosition}/${ProjectName}/.vscode 
    fi  
}

#******************************************************#
#                      配置项
#******************************************************#
# 拷贝Vscode Debug文件，默认开启 设置0不开启
BUILD=1
# 工程中版本记录文件，默认开启 设置0不开启
PROJECT_VERSION=1
# 工程模版存放目录
Template=/Users/jiajipengzhuanyong/Desktop/CODE/github/ingo


#                      配置End

# 编译模式
buildMode=""
# 工程绝对地址
ProjectPosition=`pwd`

# 创建工程文件夹名称
ProjectName=""

# 检查输入
if [ $# -eq 1 ]; then
    ingo_input $1
elif [ $# -eq 2 ]; then
    ingo_input $1 $2
fi
 
echo -e "\033[47;31;5m ProjectName : ${ProjectName}\033[0m"
echo -n "Create ProjectFolder"

# 检查工程文件夹
check_Fload 

# 进入工程目录
cd ${ProjectPosition}/${ProjectName}

# 创建工程文件
create_project

# 拷贝编译文件
cp_build

# 拷贝vscode debug文件，默认开启
if [ ${BUILD} -eq 1 ]; then   
    cp_debug
fi



