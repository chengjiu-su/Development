#!/bin/bash
cd /data/game/b/
for f in `ls /data/game/b`
do
	if [ -d $f ]
	then
	echo "fetch --- /data/game/b/${f}"
	svn cleanup $f 
	svn up --username script --password fdasf43tg453h534h543 --no-auth-cache --force $f
	fi
done