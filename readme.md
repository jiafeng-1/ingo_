<!--
 * @Author: jiafeng jiafeng@apple.com
 * @Date: 2022-07-02 18:26:45
 * @LastEditors: jiafeng jiafeng@apple.com
 * @LastEditTime: 2022-07-04 22:46:08
 * @FilePath: /pthread_t/Project/readme.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
## ingo软件
本软件适用于Linux ubuntu (x86_64,arm64)系统、Mac x86_64(arm64未测试)系统。
非常适合使用vscode的朋友，ingo可以自动构建工程框架，含有vscode调试所用launch.json、tasks.json文件。后续会增加一些常用的库文件，使其达到真正，自动化。如果对你有帮助，希望给个星星✨吧！

取ingo为软件名称，寓意不屈不挠。希望自己一直进入状态，进行下去。
路虽远行则将至、事虽难做则必成。

### 功能说明
软件整体采用shell脚本作为基础，使用脚本进行自动创建工程模版。工程模版含有makefile文件模版、cmake文件模版、Vscode make调试模版、Vscode cmake调试模版、自动脚本文件模版。

### 软件目录说明
| file         | Description | 
| :---:        |    ----:   | 
|.vscode_cmake |Vscode_cmake调试模版|
|.vscode_make  |Vscode make调试模版|
|auto    |自动脚本文件模版|
|cmake |cmake文件模版|
|make |makefile文件模版|

软件整体文件说明
.
├── Project.sh                  --->        软件主脚本
├── auto    
│   └── auto_version.sh         --->        自动生成软件版本信息
├── cmake
│   ├── CMakeLists.txt          --->        工程根目录CMakeLists文件
│   ├── CMakeLists_main.txt     --->        工程main目录CMakeLists文件
│   └── CMakeLists_srs.txt      --->        工程src目录CMakeLists文件
├── make
│   └── Makefile                --->        工程根目录Makefile文件
└── readme.md

###版本说明


### cpp工程模版目录

cpp工程cmake编译
.
├── .vscode
│   ├── launch.json
│   └── tasks.json
├── CMakeLists.txt
├── auto
│   └── auto_version.sh
├── conf
├── include
├── lib
│   ├── aarch64
│   └── x86_64
├── main
│   ├── CMakeLists.txt
│   └── main.cpp
└── src
    └── CMakeLists.txt

cpp工程make编译
.
├── .vscode
│   └── launch.json
│   └── tasks.json
├── Makefile
├── auto
│   └── auto_version.sh
├── conf
├── include
├── lib
│   ├── aarch64
│   └── x86_64
├── main
│   └── main.cpp
└── src

注：c语言版本与cpp版本目录结构相同，只是生成的main中的文件不同

### 安装软件
#### 1.下载文件
``` bash
git clone https://gitee.com/jiafeng-1/info.git
```
#### 2.执行安装脚本
``` bash
bash insall_ingo.sh
```
#### 3.测试
``` bash
ingo -v

输出：
Alpha -- 内部测试版　Beta -- 公开测试版 Release -- 发行版 
主版本号 . 子版本号 [. 修正版本号[ build- 编译版本号 ]] 

Version No: B-0.1.0

表示安装成功
```
#### 4.指令
``` bash
ingo -h | ingo --help       # 输出帮助信息
ingo [-c] project_name      # 创建工程 -c指令非必填项

```

### auto_version
ingo中的auto/auto_version.sh 为自动生成软件版本的脚本。

#### 1.使用说明
工程在创建即可生成软件版本信息。直接运行脚本，会有提示语，根据提示信息即可增加软件版本信息。
```bash 
bash auto_version.sh

#输出：
    Alpha -- 内部测试版　Beta -- 公开测试版  Release -- 发行版
    主版本号 . 子版本号 [. 修正版本号[ build- 编译版本号 ]]
    -V 增加版本号
    -D 增加版本描述
    q  退出
-v
添加版本号,按下回车保存
# 输入版本
A-1.0.0

    Alpha -- 内部测试版　Beta -- 公开测试版  Release -- 发行版
    主版本号 . 子版本号 [. 修正版本号[ build- 编译版本号 ]]
    -V 增加版本号
    -D 增加版本描述
    q  退出
# 输入版本描述
-D
添加描述,按下回车保存
更新软件细则，添加了 ...

    Alpha -- 内部测试版　Beta -- 公开测试版  Release -- 发行版
    主版本号 . 子版本号 [. 修正版本号[ build- 编译版本号 ]]
    -V 增加版本号
    -D 增加版本描述
    q  退出
# 退出
q
exit
```