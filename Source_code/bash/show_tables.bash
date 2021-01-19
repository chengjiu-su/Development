#!/bin/bash
USER="ltnz"
PASS="ltnz"
HOST="127.0.0.1"
DEST_DATABASE="game_ytsc_52"
MYSQL=/usr/local/mysql/bin/mysql

select_destdb(){
${MYSQL} -u${USER} -p${PASS} -h${HOST} -e "use ${DEST_DATABASE}
	select count(*) from account;
	select count(*) from auction;
	select count(*) from exchange;
	select count(*) from generaldata;
	select count(*) from guild;
	select count(*) from qq"
}
echo "对目标数据库进行数据查询"
echo "NAME:${DEST_DATABASHE}"
select_destdb

DB_NAMES=("game_ytsc_58" "game_ytsc_66" "game_ytsc_67" "game_ytsc_69" "game_ytsc_70" "game_ytsc_71" "game_ytsc_73" "game_ytsc_75" "game_ytsc_76" "game_ytsc_78")
#查询表数据
for DB_NAME in ${DB_NAMES[*]}
do
        echo "NAME:${DB_NAME}"
        ${MYSQL} -u${USER} -p${PASS} -h${HOST} -e "use ${DB_NAME}
		select count(*) from account;
		select count(*) from auction;
		select count(*) from exchange;
		select count(*) from generaldata;
		select count(*) from guild;
		select count(*) from qq"
done
