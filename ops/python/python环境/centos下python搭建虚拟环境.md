3 安装virtualenvwrapper
```shell
pip3 install virtualenvwrapper
```
配置 ，安装好后，还需要配置，我的系统时centos（修改文件 ~/.bash_profile） 这一步和ubanto不一样
查找到这个路径，每个人查找到的路径会不一样
```shell
[root@localhost ~]# find /usr/local/ -name virtualenvwrapper.sh
/usr/local/bin/virtualenvwrapper.sh
```
配置环境变量  ~/.bashrc
```shell
#virtualenv  env
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
export WORKON_HOME=$HOME/.virtualenv
source /usr/local/bin/virtualenvwrapper.sh

[root@Centos7 ~]# source ~/.bashrc 
[root@localhost ~]# mkdir ~/.virtualenv
```
环境变量生效
```shell
[root@localhost ~]# source ~/.bashrc 
virtualenvwrapper.user_scripts creating /root/.virtualenv/premkproject
virtualenvwrapper.user_scripts creating /root/.virtualenv/postmkproject
... ...
... ...
[root@localhost ~]# workon   #虚拟环境检测命令，环境变量生效即可用
[root@localhost ~]# mkvirtualenv online
```
虚拟环境结构
```shell
(online) [root@localhost ~]# cd ~/.virtualenv/online/
(online) [root@localhost online]# ls
bin  lib  pyvenv.cfg
(online) [root@localhost online]# ls bin/
activate          easy_install3.6  predeactivate
activate.csh      get_env_details  python
activate.fish     pip              python3
activate.ps1      pip3             python3.6
activate_this.py  pip-3.6          wheel
activate.xsh      pip3.6           wheel3
easy_install      postactivate     wheel-3.6
easy_install3     postdeactivate   wheel3.6
easy_install-3.6  preactivate
```
python虚拟环境常用命令
```shell
mkvirtualenv online：创建运行环境online

workon zqxt: 工作在 zqxt 环境 或 从其它环境切换到 zqxt 环境

deactivate: 退出终端环境

rmvirtualenv ENV：删除运行环境ENV

mkproject mic：创建mic项目和运行环境mic

mktmpenv：创建临时运行环境

lsvirtualenv: 列出可用的运行环境

lssitepackages: 列出当前环境安装了的包
```
针对一个python项目配置环境变量
```shell
[root@localhost online]# vim ~/.bashrc 
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
export WORKON_HOME=$HOME/.virtualenv  #虚拟环境工作路径
export PROJECT_HOME=/data/python_project    #所有项目路径
source /usr/local/bin/virtualenvwrapper.sh

[root@localhost online]# mkdir /data/
[root@localhost online]# mkdir -p /data/python_project
[root@localhost online]# source ~/.bashrc 
```
创建单个项目
```shell
[root@localhost online]# mkproject project_online_test
... ...
... ...
Creating /data/python_project/project_online_test
Setting project for project_online_test to /data/python_project/project_online_test
[root@localhost ~]# ls /data/python_project/
project_online_test
```
安装ipython
```shell
[root@localhost ~]# workon test           #进入虚拟python环境
(test) [root@localhost test]# pip install ipython  #pip进行安装ipython
(test) [root@localhost test]# ipython         #进入ipython
Python 3.6.7 (default, Sep 29 2020, 16:38:02) 
Type 'copyright', 'credits' or 'license' for more information
IPython 7.16.1 -- An enhanced Interactive Python. Type '?' for help.

In [1]: 
```