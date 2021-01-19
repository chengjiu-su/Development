#!/bin/bash
cd /data/game/b/
process=`ls  | grep -v leader`  #此条件适用于路径下进程均为在线进程，如有停服/和服进程则需要另取条件进行for循环
#根据需求调整相应进程进行维护
#数组
#process=("$1" "$2" "$3" "$4" "$5")
#for f in ${process[*]}
for f in  ${process}
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