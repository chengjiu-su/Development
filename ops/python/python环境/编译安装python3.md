首先去python官网下载python3的源码包，网址：https://www.python.org/
下载源码包[推荐选择 Python-3.6.7.tgz ]
![[python_源码下载.png]]
安装依赖
```bash
yum install -y sqlite-devel tk-devel tcl-devel readline-devel zlib-devel gcc gcc-c++ openssl-devel libffi-devel
```
编译安装
```bash
tar xzf Python-3.6.7.tgz  -C /usr/local/src
cd /usr/local/src/Python-3.6.7
```

```shell
#!/bin/bash
#cd /usr/local/src/Python-3.6.7
sed -i 's/^#readline/readline/' Modules/Setup.dist
sed -i 's/^#SSL=/SSL=/' Modules/Setup.dist
sed -i 's/^#_ssl/_ssl/' Modules/Setup.dist
sed -i 's/^#[\t]*-DUSE/\t-DUSE/' Modules/Setup.dist
sed -i 's/#[\t]*-L$(SSL)/\t-L$(SSL)/' Modules/Setup.dist
```
打开以下几行注释
```shell
[root@Centos7 Python-3.6.10]# vim Modules/Setup.dist 
... ...
readline readline.c -lreadline -ltermcap
... ...
... ...
SSL=/usr/local/ssl
_ssl _ssl.c \
        -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
        -L$(SSL)/lib -lssl -lcrypto
```
编译
```shell
./configure --prefix=/usr/local/  --enable-optimizations --enable-shared

--enable-optimizations 是优化选项(LTO，PGO 等)加上这个 flag 编译后，性能有 10% 左右的优化
 --enable-shared 
启用共享，方便其他依赖python的一些内置库（比如 mysqlclient) 的资源的正常安装； 不启用可能报以下错误：
command 'gcc' failed with exit status 1
在 pyinstaller python打包时，也需要开启 --enable-shared
```
进行make  && make install 安装
```shell
make && make install
... ...
--------------------------------------------------------
Collecting setuptools
Collecting pip
Installing collected packages: setuptools, pip          #默认安装 pip3
Successfully installed pip-10.0.1 setuptools-39.0.1     #编译安装成功
```
执行python3 找不到共享库路径
```shell
[root@Centos7 Python-3.6.10]# python3
python3: error while loading shared libraries: libpython3.6m.so.1.0: cannot open shared object file: No such file or directory
```
添加共享库变量
```shell
[root@Centos7 Python-3.6.10]# cd /etc/profile.d/
[root@Centos7 profile.d]# vim python3_lib.sh
#python3.6  共享目录
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
[root@Centos7 profile.d]# source /etc/profile
```
再次执行python3，成功进入python环境
```shell
[root@Centos7 profile.d]# python3
Python 3.6.10 (default, Oct 20 2020, 10:28:54) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-39)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```
[[centos下python换阿里源]]