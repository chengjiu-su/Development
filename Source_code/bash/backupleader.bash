#!/bin/bash

if [ `ps -ef | grep backupleader.bash| grep -v grep | wc -l` -gt 3 ]; then
        echo "Instance is running!"
        exit 0
fi

DATE_STR=`date '+%Y%m%d-%H'`
BACKUP_DIR="/data/backup/backupleader/"
MYSQLDUMP_PATH=/usr/local/mysql/bin/mysqldump

if [ ! -d ${BACKUP_DIR} ]; then
        mkdir -p ${BACKUP_DIR}
fi

cd ${BACKUP_DIR}

DB_NAMES=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1 -Bse "show databases"|grep game_leader`
echo "GET ALL DATABASES"
for DB_NAME in $DB_NAMES
do
        echo "NAME:${DB_NAME}"
        SQL_FILE="${DB_NAME}-${DATE_STR}.sql"
        TAR_FILE="${DB_NAME}-${DATE_STR}.tar.gz"
        ${MYSQLDUMP_PATH} -ultnz -pltnz -P3306 -h127.0.0.1 ${DB_NAME} > ${SQL_FILE}
        tar czf ${TAR_FILE} ${SQL_FILE}
        rm -f ${SQL_FILE}
done

# 避免没删干净
rm -f *.sql

# 超出7天的直接删除
find ${BACKUP_DIR} -mtime +7 -type f -name "*.tar.gz" -exec rm -rf {} \;
# 超出1天的每天只保留一个
#find ${BACKUP_DIR} -mtime +1 -type f -name "*.tar.gz" | grep -vE "*00.tar.gz|*01.tar.gz" | xargs rm -f
find ${BACKUP_DIR} -mmin +1440 -type f -name "*.tar.gz" | grep -vE "*00.tar.gz|*01.tar.gz" | xargs rm -f

