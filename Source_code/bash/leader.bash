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
	svn checkout svn://svn.popcornie.com/server/b/release-stable-23you-new/leader  --username script --password fdasf43tg453h534h543 --no-auth-cache --force $1
#修改配置文件leader-config.properties
	sed -i 's/=game/=ltnz/g'    /data/game/b/$1/leader-config.properties
	echo  "启动leader服ing..."
	cd $1
	dos2unix service.sh
	bash service.sh start 
else 
	echo "bash automatic.bash dir..."
fi
