#!/bin/bash
if [ $# -ne 2 ]
then
	echo  "使用脚本请以 bash backup_db.bash  -s:$1 -d:$2  方式执行"
	exit 0
fi 
USER="ltnz"
PASS="ltnz"
HOST="127.0.0.1"
DEST_DATA="game_ytsc_58"
SOU_DATA1="game_ytsc_60"
SOU_DATA2="game_ytsc_63"
SOU_DATA3="game_ytsc_64"
MYSQL=/usr/local/mysql/bin/mysql
MYSQLDUMP=/usr/local/mysql/bin/mysqldump
#开始数据备份和数据合并
#目标数据查询
select_destdb(){
${MYSQL} -u${USER} -p${PASS} -h${HOST} -e "use ${DEST_DATA}
select count(*) from account;
select count(*) from auction;
select count(*) from exchange;
select count(*) from generaldata;
select count(*) from guild;
select count(*) from qq"
}
echo "和服之前目标数据库进行数据查询"
select_destdb
echo ---------------------------------------------------------------------
# "对目标数据库进行全备份，防止合并数据时出错"
${MYSQLDUMP} -u${USER} -p${PASS} -h${HOST} ${DEST_DATA} > /data/backup_db/backup_fullup58.sql
while getopts :s:d: opt
do
        case "$opt" in
	   #备份源数据，不包含表结构
	    s) ${MYSQLDUMP} -u${USER} -p${PASS} -h${HOST} -t -c ${SOU_DATA1} > /data/backup_db/dataup60.sql 
           ${MYSQLDUMP} -u${USER} -p${PASS} -h${HOST} -t -c ${SOU_DATA2} > /data/backup_db/dataup63.sql 
           ${MYSQLDUMP} -u${USER} -p${PASS} -h${HOST} -t -c ${SOU_DATA3} > /data/backup_db/dataup64.sql 
	;;
	    d) ${MYSQL} -u${USER} -p${PASS} -h${HOST} ${DEST_DATA}  < /data/backup_db/dataup60.sql 
	       echo "5服数据合并4服之后，数据查询"
	       select_destdb
	       ${MYSQL} -u${USER} -p${PASS} -h${HOST} ${DEST_DATA}  < /data/backup_db/dataup63.sql 
	       echo "6服数据合并4服之后，数据查询"
	       select_destdb
	       ${MYSQL} -u${USER} -p${PASS} -h${HOST} ${DEST_DATA}  < /data/backup_db/dataup64.sql 
	;;
 	    *) echo "unknown opotion:${opt},please confirm that the pre-selection option is correct"
	       exit 1 
	;; 		
        esac
done
#数据合并查询
echo  "和服完毕，对目标数据库进行所有数据查询，确认和服数据正常"
select_destdb
#更改和服主进程内servers.info和服记录
sed -i 's/0={"server":61,"platform":"benghua","open":"2020-07-29 13:55:00","join":"2099-08-30 15:00:00","sub":""}/0={"server":61,"platform":"benghua","open":"2020-07-29 13:55:00","join":"2020-08-14 00:00:00","sub":"benghua:63|benghua:66|benghua:67"}/'  /data/game/b/58/servers.info
#将备份数据打tar包
cd /data/backup_db/
BACKUP_DB=backup_fullup58.sql
DATAUP1=dataup60.sql
DATAUP2=dataup63.sql
DATAUP3=dataup64.sql
if [ -f ${BACKUP_DB} -a -f ${DATAUP1} -a -f ${DATAUP2} -a -f ${DATAUP13} ] 
then
	echo "检测到数据备份，进行压缩为tar文件"
	tar -zcvf dataup60.tar.gz ${DATAUP1} 
	tar -zcvf dataup63.tar.gz ${DATAUP2}
	tar -zcvf dataup64.tar.gz ${DATAUP3}
	tar -zcvf backup_fulldb58.tar.gz ${BACKUP_DB}
	cd 
else
	echo "未检测到数据备份。tar打包失败,程序非正常退出"
	exit 1 
fi

#脚本以  bash backup_db.bash -s:60,63,64 （源数据） -d:58（目标数据库）  执行