#!/bin/bash 
user="ltnz"
passwd="ltnz"
host="127.0.0.1"
DATABASE="game_ytsc_"
#创建空数据库
mysql -u"$user" -p"$passwd" -h"$host" << EOF 2>/dev/null
CREATE DATABASE $DATABASE
EOF
[ $? -eq 0 ] && echo "created $DATABASE" || echo "$DATABASE already exists"
#查看数据库，确认创建成功
mysql -u"$host" -p"$passwd" -h"host" -e "show databases;"
#--------------------
#备份数据还原至新建数据库
mysql -u"$user" -p"$passwd" -h"$host"   $DATABASE  < $1
