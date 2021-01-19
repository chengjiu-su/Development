[[编译安装python3]]
```shell
[root@localhost ~]# mkdir ~/.pip
[root@localhost ~]# touch ~/.pip/pip.conf
```shell
[root@localhost ~]# vim ~/.pip/pip.conf 
[global]
index-url = http://mirrors.aliyun.com/pypi/simple/
trusted-host=mirrors.aliyun.com

#执行 trusted-host参数会将阿里云源视为安全的镜像源，不会出现如下警告信息：
The repository located at mirrors.aliyun.com is not a trusted or secure host and is being ignored. If this repository is available via HTTPS we recommend you use HTTPS instead, otherwise you may silence this warning and allow it anyway with '--trusted-host mirrors.aliyun.com'.
```
升级pip版本
```shell
[root@localhost ~]# pip3 install --upgrade pip
[root@localhost ~]# pip -V
[root@localhost ~]# pip3 -V
```
[[centos下python搭建虚拟环境]]