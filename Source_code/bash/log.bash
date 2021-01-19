#!/bin/bash
services=`ls /data/game/b`

for srv in ${services} ;do
        LOG_DIR=/data/game/b/${srv}/target/backend_log_zip/
        if [ -d ${srv} ]
        then 
        cd ${LOG_DIR}
        find bak -mmin -400 -type f -name "*.log" -exec mv {} ${LOG_DIR} \;
        fi
done
