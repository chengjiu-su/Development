#!/bin/bash
DB_NUMS=("${2}" "${3}" "${4}" "${5}" "${6}" "${7}" "${8}" "${9}" "${10}" "${11}" "${12}" "${13}" "${14}" "${15}" )
#echo "GET ALL DATABASES"
#备份源数据，不含表结构
for DB_NUM in ${DB_NUMS[*]}
do
        DB_NAME=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1 -Bse "show databases"|grep game_ytsc_${DB_NUM}`
        echo "NAME:${DB_NAME}"
        select_sou(){
                select_soudb(){
                ${MYSQL} -u${USER} -p${PASS} -h${HOST}  -Nse "use ${DB_NAME};
                        select count(*) from account; 
                        select count(*) from auction;
                        select count(*) from exchange;
                        select count(*) from generaldata;
                        select count(*) from guild;
                        select count(*) from qq"
                }
                select_soudb > table_data.txt
                tables_data=`cat  table_data.txt`
                array=(${tables_data// /})      #将字符串以空格切割，转换为数组
                table_type=("account" "auction" "exchange" "generaldata" "guild" "qq")
                for i in 0 1 2 3 4 5
                do
                        echo -e "\033[33m${table_type[i]} ------------->  ${array[i]}\033[0m"
                done
                rm table_data.txt -f
}
        select_sou
done