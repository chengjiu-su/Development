#!/bin/bash 
#拉到本地
scp  root@127.0.0.1:/data/game/b/upload.bash  /home/chengjiu_su/copy_tmp
#拷贝到服务器
scp /home/chengjiu_su/copy_tmp/         root@127.0.0.1:/data/game/b
#
