#!/bin/bash 
if [ $# -eq 1 ]
then
	if [ -d "$1" ];then
  		echo "目录 '$1' 存在,请确认目录规划是否正确"
	else
  		mkdir $1
		echo '创建目录 '$1' 成功'
	fi
#拉取配置
	svn checkout svn://svn.popcornie.com/server/b/release-stable-pkhaha/game  --username script --password fdasf43tg453h534h543 --no-auth-cache --force $1
#修改配置文件-servers.info
sed -i '8s/^/#/' /data/game/b/$1/servers.info
#根据开服需求调整相对应时间
sed -i 's/0={"server":33,"platform":"37wan","open":"2020-02-12 10:00:00","join":"2099-08-30 15:00:00","sub":""}/0={"server":68,"platform":"pkhaha","open":"2020-08-03 00:00:00","join":"2099-08-30 15:00:00","sub":""}/'  /data/game/b/$1/servers.info
#修改配置文件server-config.properties
sed -i 's/id=1/id='$1'/' /data/game/b/$1/server-config.properties
#---------------------------------------------------------------------------------------
#                                 服务器公网ip
sed -i 's/ip=127.0.0.1/ip=39.105.219.43/'   /data/game/b/$1/server-config.properties
#游戏运行模式
sed -i 's/mode=DEBUG/mode=RELEASE/'  /data/game/b/$1/server-config.properties 
#修改端口，请确保正确
#                                          游戏端口
sed -i 's/game_port=16889/game_port=10021/' /data/game/b/$1/server-config.properties
#                                             后台端口
sed -i 's/backend_port=9002/backend_port=10022/'  /data/game/b/$1/server-config.properties
#---------------------------------------------------------------------------------------
sed -i 's/=game/=ltnz/g'    /data/game/b/$1/server-config.properties
sed -i 's/game_data_h5/game_ytsc_'$1'/'  /data/game/b/$1/server-config.properties
sed -i 's/MEM=3g/MEM=2g/' /data/game/b/$1/service.sh
fi
