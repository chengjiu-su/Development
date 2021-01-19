#!/bin/bash
if [ $# -eq 1 ]
then
svn up --username script --password fdasf43tg453h534h543 --no-auth-cache --force $1
cd $1
read -p "重启yes,拒绝no:" judge
case $judge in
        [Yy][Ee][Ss]|[Yy])
                        dos2unix service.sh
                        bash service.sh restart
        ;;
        [Nn][Oo]|[N])
                        exit 0
        ;;
        *)
                exit 0
        ;;
esac
else
        echo "bash update.sh dir..."
fi
