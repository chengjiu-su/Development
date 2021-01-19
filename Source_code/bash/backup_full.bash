#!/bin/bash
DATE_STR=`date '+%Y%m%d-%H'`
create_path(){
        path=`/bin/pwd`
        DATE(){
                /bin/date '+%Y-%m-%d'
        }
        DATE > date.txt
        date=`cat ${path}/date.txt`
        BACKUP_DIR="/data/backup_db/completely_db/${date}"
        if [ ! -d ${BACKUP_DIR} ]; then
                mkdir -p ${BACKUP_DIR}
        fi
        rm ${path}/date.txt -f
}
create_path
MYSQLDUMP_PATH=/usr/local/mysql/bin/mysqldump
cd ${BACKUP_DIR}

DB_NAMES=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1 -Bse "show databases"|grep game_ytsc`
echo "GET ALL DATABASES"
for DB_NAME in $DB_NAMES
do
        echo -e "\033[32mNAME:${DB_NAME}\033[0m"
        SQL_FILE="${DB_NAME}-${DATE_STR}.sql"
        TAR_FILE="${DB_NAME}-${DATE_STR}.tar.gz"
        ${MYSQLDUMP_PATH} -ultnz -pltnz -P3306 -h127.0.0.1 ${DB_NAME} > ${SQL_FILE}       #centos_6
        #${MYSQLDUMP_PATH} -ultnz -pltnz -P3306 -h127.0.0.1 --no-tablespaces ${DB_NAME} > ${SQL_FILE}         #centos_7
        tar czf ${TAR_FILE} ${SQL_FILE}
        # rm -f ${SQL_FILE}
done

# 避免没删干净
#rm -f *.sql
