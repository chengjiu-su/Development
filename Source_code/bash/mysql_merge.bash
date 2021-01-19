#!/bin/bash
stop_service(){
        cd /data/game/b/
        process=`ls  | grep -v leader `  #此条件适用于路径下进程均为在线进程，如有停服/和服进程则需要>另取条件进行for循环
        #根据需求调整相应进程进行维护
        for f in ${process[*]}
        do
                if [ -d $f ]
                then
                echo fetch --- $f
                cd $f
                dos2unix service.sh
                #bash service.sh stop
                cd ..
                fi
        done
}
#stop_service

create_path(){
        path=`/bin/pwd`
        DATE(){
                /bin/date '+%Y-%m-%d'
        }
        DATE > date.txt
        date=`cat ${path}/date.txt`
        BACKUP_DIR="/data/backup_db/${date}"
        if [ ! -d ${BACKUP_DIR} ]; then
                mkdir -p ${BACKUP_DIR}
        fi
        rm ${path}/date.txt -f
}
create_path

USER="ltnz"
PASS="ltnz"
HOST="127.0.0.1"
DEST_DATABASE="${1}"
MYSQL=/usr/local/mysql/bin/mysql
MYSQLDUMP=/usr/local/mysql/bin/mysqldump

if [ $# -gt 1 ]
then
cd ${BACKUP_DIR}
# ${MYSQLDUMP} -u${USER} -p${PASS} -h${HOST} ${DEST_DATABASE} > dest-${1}.sql  #centos_6
${MYSQLDUMP} -u${USER} -p${PASS} -h${HOST} --no-tablespaces ${DEST_DATABASE} > dest-${1}.sql    #centos_7
echo -e "\033[32m目标数据库${DEST_DATABASE}进行备份\033[0m"
DB_NUMS=("${2}" "${3}" "${4}" "${5}" "${6}" "${7}" "${8}" "${9}" "${10}" "${11}" "${12}" "${13}" "${14}" "${15}" )
#echo "GET ALL DATABASES"
#备份源数据，不含表结构
for DB_NUM in ${DB_NUMS[*]}
do
        DB_NAME=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1 -Bse "show databases"|grep game_ytsc_${DB_NUM}`
        echo -e "NAME:\033[31m${DB_NAME}\033[0m"
        data_tables=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1  -s -e "use ${DB_NAME};
                show tables" 2>/dev/null`
        for select_tables in ${data_tables[*]}
        do
                table_amount=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1 -Nse  "use ${DB_NAME};
                select count(*) from ${select_tables}" 2>/dev/null`
                echo -e "\033[33m${select_tables} -------------> ${table_amount}\033[0m"
        done
        SQL_FILE="${DB_NAME}.sql"
        TAR_FILE="${DB_NAME}.tar.gz"
        # ${MYSQLDUMP} -u${USER} -p${PASS} -h${HOST} -t -c ${DB_NAME} > ${SQL_FILE}    #centos_6
        echo -e "\033[32mNAME: ${DB_NAME} 数据库进行纯数据备份\033[0m"
        ${MYSQLDUMP} -u${USER} -p${PASS} -h${HOST} -t -c --no-tablespaces  ${DB_NAME} > ${SQL_FILE}   #centos_7
        #echo 源数据向目标数据库合并数据,并将备份数据进行压缩
        echo -e "\033[33mNAME:${DB_NAME}向${DEST_DATABASE}合并数据\033[0m" 
        sleep 2
        ${MYSQL} -u${USER} -p${PASS} -h${HOST}  ${DEST_DATABASE}  < ${SQL_FILE}
        tar zcvf ${TAR_FILE} ${SQL_FILE}
        rm -f  ${SQL_FILE}
done
echo -e "\033[32m合服操作完成，对目标数据库进行所有数据查询，确认和服数据正常 \033[0m" 
select_tables(){
        data_tables=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1  -s -e "use ${DEST_DATABASE};
        show tables" 2>/dev/null`
        for select_tables in ${data_tables[*]}
        do
                table_amount=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1 -Nse  "use ${DEST_DATABASE};
                select count(*) from ${select_tables}" 2>/dev/null`
                echo -e "\033[33m${select_tables} -------------> ${table_amount}\033[0m"
        done
    
}
select_tables
#echo -e "\033[33m更改目标进程-配置文件servers.info\033[0m"
#sed -i 's/0={"server":55,"platform":"benghua","open":"2020-07-23 13:55:00","join":"2020-10-16 00:00:00","sub":"benghua:57|benghua:58"}/0={"server":55,"platform":"benghua","open":"2020-07-23 13:55:00","join":"2020-08-05 00:00:00","sub":"benghua:57|benghua:58|benghua:61|benghua:63|benghua:66|benghua:67|benghua:69|benghua:70|benghua:72|benghua:73|benghua:74|benghua:76|benghua:78|benghua:79|benghua:81|benghua:82|benghua:83"}/'  /data/game/b/52/servers.info
else
        echo -e "\033[31mbash mysql_merge.bash dset_database 2 3 4 5 ...\033[0m"
fi
#脚本执行  bash mysql_merge.bash  ltnz_test_1 2 3 4 5   #数据库名指定为被合服