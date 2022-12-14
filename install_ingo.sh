#!/bin/bash

###
 # @Author: jiafeng jiafeng@apple.com
 # @Date: 2022-07-03 21:03:23
 # @LastEditors: Jia Feng
 # @LastEditTime: 2022-07-11 23:08:34
 # @FilePath: /pthread_t/Project/install_ingo.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

INGO_PATH=`pwd`

function install() {

case $OS in 
    'Linux')
    sed -i  "s#^.*Template=.*#Template=${INGO_PATH}#g" ./Project.sh
    ;;
    'Darwin')
    sed -i "" "s#^.*Template=.*#Template=${INGO_PATH}#g" ./Project.sh
    ;;
esac

echo "alias ingo='${INGO_PATH}/Project.sh'" >> ~/.bashrc
echo "source ~/.bashrc" >> ~/.bash_profile 

}

cd ${INGO_PATH}

OS="`uname`"

install
