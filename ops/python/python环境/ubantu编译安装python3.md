1 安装编译编译和版本工具
```bash
sudo apt-get install g++ make git
```
2 安装依赖库
```bash
sudo apt-get -y install libbz2-dev libncurses5-dev libgdbm-dev liblzma-dev libsqlite3-dev libssl-dev libreadline6-dev libffi-dev
```
Python3.7源码在linux（ubuntu）下的编译和安装
如果不安装全，一些python扩展库会编译失败，有些库如果通过apt-get不能安装，就要手动通过源码编译安装。

3 下载python源码

通过如下地址下载源码
```bash
https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz

http://www.ffmpeg.club/python

可以直接用wget下载到系统中，如果wget没有也使用apt-get 安装。

wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
```
4 解压python
```bash
tar -xvf Python-3.7.0.tar.xz

cd Python-3.7.0
```
5 生成项目文件（Makefile）
```bash
./configure -h 查看所有支持的配置熟悉，附在文件的结尾处

我们使用默认参数，只设置如下参数。

./configure --prefix=/usr/local/  --enable-optimizations --enable-shared
```
其中enable-shared是编译so动态库，默认不编译
安装路径不用设置，使用默认路径会安装到系统路径，如果设置，需要在设置运行的环境变量

6 编译
```bash
make -j8 #其中j8表示8线程编译，多核cpu可以加快编译速度
```
7 安装
```bash
make install #安装编译好的文件
```
如果设置的默认路径，会安装如下文件和目录
```bash
/usr/bin/python3 ##执行文件

/usr/local/bin/python3.7 #执行文件

/usr/local/lib/libpython3.7m.so #动态库

/usr/local/lib/python3.7/ #目录下放的是python的扩展库

/usr/local/include/python3.7m #源码头文件

如果有的系统/usr/local/lib不是默认的库加载路径，那就把所有的.so文件复制到/usr/lib目录下
```