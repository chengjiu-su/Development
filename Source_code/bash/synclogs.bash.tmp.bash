#!/bin/bash
if [ `ps -ef | grep synclogs.bash | grep -v grep | wc -l` -gt 3 ]; then
        echo "Instance is running!"
        exit 0
fi
services=`ls /data/game/b`

for srv in $services;do
	LOG_DIR=/data/game/b/${srv}/target/backend_log_zip/
	if [ -d $LOG_DIR ]; then
		cd $LOG_DIR
		if [ ! -d bak ]; then
			mkdir bak
		fi
		for f in `ls *.log`; do
			rsync -vzrtopg --progress --password-file=/etc/rsync.pass $f  log@39.105.219.43::log_b/${srv}/
			if [ $? -eq 0 ]; then
				mv $f bak/
			fi
		done
		# 清理超过30天的文件
		find bak -mtime +30 -type f -name "*.log" -exec rm -rf {} \;
	fi
done