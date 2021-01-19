#!/bin/bash
#安装软件包，依赖包
apt-get install wget cmake ncurses-devel gcc gcc-c++ vim lsof bzip2 openssl-devel -y libraries  make
#源码包
#scp chengjiu_su@192.168.7.103:/home/chengjiu_su/copy_tmp/src/mysql-5.6.48.tar.gz /usr/local/src
#创建用户组与mysql用户
groupadd mysql
useradd -r -g mysql -s /sbin/nologin mysql
mkdir -p /data/dbs/3306/mysql
#安装源码包
cd /usr/local/src
rpm -ivh mysql-community-5.7.30-1.el6.src.rpm
#解压tar包并准备编译前的工作
cd /root/rpmbuild/SOURCES
tar -xf   mysql-5.7.30.tar.gz -C /data/dbs/3306
tar -xf   boost_1_59_0.tar.bz2 -C /data/dbs/3306
cd /data/dbs/3306/mysql-5.7.30
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/data/dbs/3306/mysql  -DSYSCONFDIR=/etc  -DMYSQL_USER=mysql  -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci  -DWITH_BOOST=/data/dbs/3306/boost_1_59_0
#开始编译安装
make && make install 
#编写MySQL主配置文件/etc/my.cnf
cp /etc/my.cnf /etc/my.cnf.bak
>/etc/my.cnf
cat  >> /etc/my.cnf <<EOF
[client]
port = 3306
socket = /tmp/mysql.sock

[mysqld]
port = 3306
socket = /tmp/mysql.sock

basedir = /usr/local/mysql
datadir = /data/dbs/3306/mysql
user = mysql
bind-address = 0.0.0.0
server-id = 1
#log_error=/tmp/mysql_error.log
EOF
#权限管理 MySQL服务由mysql用户启动
chown mysql.mysql /usr/local/mysql/ -R
chown mysql.mysql /etc/my.cnf 
chown mysql.mysql /data/dbs/  -R

#初始化MySQL
/usr/local/mysql/bin/mysqld --initialize  --user=mysql --basedir=/usr/local/mysql --datadir=/data/dbs/3306/mysql &> /root/temp_password.txt
# 将MySQL添加至环境变量，修改 /etc/bashrc 文件，文件末尾添加  export
echo  'export PATH=/usr/local/mysql/bin:$PATH'  >> /etc/bashrc
source /etc/bashrc
#启动MySQL服务
# /usr/local/mysql/bin/mysqld --defaults-file=/etc/my.cnf --user=mysql & 2>&1 > /dev/null
# PASS=`cat temp_password.txt | tail -1 | awk '{print $11}'`
# #设置MySQL root用户密码 
# sql_setup(){
#     mysql -uroot -p${PASS} -e  "use mysql;
#     alter user 'root'@'localhost' identified by '123456';
#     flush privileges;
#     exit"
# }
# sql_setup