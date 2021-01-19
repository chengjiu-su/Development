#!/bin/bash
senddingtalk(){
        JSON='{"msgtype": "text", 
        "text": {
             "content": "三国资源更新 :'{$1}'"
        }
      }'
        curl -X POST -H "Content-Type: application/json" -d "${JSON}" "https://oapi.dingtalk.com/robot/send?access_token=04a5e4cac661c581846011e2301ed9667050b42cdc7857b08344d0add78b30a9"
}
delete_r(){
        find /data/sj_client/c_client -type d -name ".svn"  > /data/sj_client/c_oss/logs/svndirtmp.txt
        cat /data/sj_client/c_oss/logs/svndirtmp.txt | while read line
        do
                if [ -d ${line} ]
                then
                        chmod 331 ${line}
                fi
        done
}
add_r(){
        cat /data/sj_client/c_oss/logs/svndirtmp.txt | while read line
        do
                if [ -d ${line} ]
                then
                        chmod 775 ${line}
                fi
        done
}
changurl(){
        >/data/sj_client/c_oss/logs/turn.txt
        cat /data/sj_client/c_oss/logs/out.txt | while read LINE
        do
                LINE=`echo $LINE | gawk -F 'svn://localhost/server/c_client/' '{print $2}'`
                printf $(echo -n $LINE | sed 's/\\/\\\\/g;s/\(%\)\([0-9a-fA-F][0-9a-fA-F]\)/\\x\2/g')"\n" >> /data/sj_client/c_oss/logs/turn.txt
        done
}
todo_up(){
        >/data/sj_client/c_oss/logs/up.txt
        SVNDIR=/data/sj_client/c_client/
        STATUS=`svn status $SVNDIR | gawk -F ' ' '{print $1}' | grep 'L'`
        if [ -n "$STATUS" ]
        then
                svn status $SVNDIR | gawk -F ' ' '{print $2}' > /data/sj_client/c_oss/logs/lock.txt
                cat /data/sj_client/c_oss/logs/lock.txt | while read LINE
                do
                        svn cleanup $LINE
                done
        fi
#        cat /data/sj_client/oss_1/logs/turn.txt | while read LINE
#        do
#                if [ $LINE != '' ]
#                then
	cd ${SVNDIR}
        cat /data/sj_client/c_oss/logs/turn.txt | xargs svn up --force  >> /data/sj_client/c_oss/logs/up.txt
	sed -i '/Skipped/d' /data/sj_client/c_oss/logs/up.txt
        sed -i '/跳过/d' /data/sj_client/c_oss/logs/up.txt
 #               fi
 #       done
}
logs(){
        LOGFILE=/data/sj_client/c_oss/logs/check.log
        LOG_LINES=`cat ${LOGFILE}  | wc -l | sed -n '1p'`
        if  [ ${LOG_LINES} -gt 300 ]
        then
                HALF=$[ $LOG_LINES / 2 ]
                sed -i "1,${HALF}d" ${LOGFILE}
        fi
}
FILEDIR="/data/sj_client/c_oss/logs/svnversion.txt"
OLDVERSION=`cat ${FILEDIR}`
NEWVERSION=`svn log -l 1 svn://localhost/server/c_client --username cdnuser --password XCgR2L66Ou1s. --no-auth-cache | sed -n '2p' | gawk -F '|' '{print $1}' | gawk -F 'r' '{print $2}'`
date
echo ----------------------------
if [ ! -e ${FILEDIR} ]
then
        echo $NEWVERSION > /data/sj_client/c_oss/logs/svnversion.txt
        exit 0
elif [[ ${OLDVERSION} -lt ${NEWVERSION} ]]
then
	svn diff -r${OLDVERSION}:${NEWVERSION} --summarize svn://localhost/server/c_client --username cdnuser --password XCgR2L66Ou1s. --no-auth-cache > /data/sj_client/c_oss/logs/out.txt
	senddingtalk "svn版本库最新版本[${NEWVERSION}],执行更新svn..." > /dev/null 2>&1
	changurl
        todo_up
	delete_r
	senddingtalk "开始推送oss..."
	/data/sj_client/oss/ossutil64 cp /data/sj_client/c_client/ oss://bmhcdn/c_client/ -r -f -u -j 30 --retry-times=10 --config-file=/data/sj_client/oss/.ossutilconfig --snapshot-path=/data/sj_client/c_oss/snapshot/sg
	/data/sj_client/oss/ossutil64 cp /data/sj_client/c_client/ oss://bmhcdn/c_client/ -r -f -u -j 30 --retry-times=10 --config-file=/data/sj_client/oss/.ossutilconfig --snapshot-path=/data/sj_client/c_oss/snapshot/sg
	add_r 
#钉钉机器人输出字节不能大于20000
#-------------------------------
        BYTE_C=`cat /data/sj_client/c_oss/logs/up.txt | wc -c`
        if [ ${BYTE_C} -gt 20000 ]
        then
                for ((i=0;i<=${BYTE_C};i=i+10000))
                do
                        j=$[ $i + 10000 ]
                        senddingtalk "svn更新后版本{${NEWVERSION}}, 更新内容为  `tail -c +$i /data/sj_client/c_oss/logs/up.txt | head -c $j`"
                done
        else
        senddingtalk "svn更新后版本{${NEWVERSION}}, 更新内容为 `cat /data/sj_client/c_oss/logs/up.txt`"
        fi
#------------------------------------
        echo $NEWVERSION > /data/sj_client/c_oss/logs/svnversion.txt
fi
echo ----------------------
date
logs
