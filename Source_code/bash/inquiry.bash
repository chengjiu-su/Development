#!/bin/bash
DB_NUMS=("${1}" "${2}" "${3}" "${4}" "${5}" "${6}" "${7}" "${8}" "${9}" "${10}" "${11}" "${12}" "${13}" "${14}" "${15}" )
for DB_NUM in ${DB_NUMS[*]}
do 
	data_tables=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1  -s -e "use ${DB_NUM};
        	show tables" 2>/dev/null`
	for select_tables in ${data_tables[*]}
	do
        	table_amount=`/usr/local/mysql/bin/mysql -ultnz -pltnz -h127.0.0.1 -Nse  "use ${DB_NUM};
        	select count(*) from ${select_tables}" 2>/dev/null`
        	echo -e "\033[33m${select_tables} -------------> ${table_amount}\033[0m"
	done
done
