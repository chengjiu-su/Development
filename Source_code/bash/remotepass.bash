#!/bin/bash
#--------------------------------------------------------------
ip_array=("192.168.7.105")  #虚拟机 c7
#ip_array=("")
#ip_array=("")
user="root"
#本地脚本
remote_process="/home/chengjiu_su/PycharmProjects/automatic/process_conf.py"
#remote_mergesql="/home/chengjiu_su/PycharmProjects/automatic/mysql_merge.py"
#remote_up="/home/chengjiu_su/PycharmProjects/automatic/test.py"
#进行主机for循环，远程执行本地脚本
for ip in  ${ip_array[*]}
do
#    ssh  -o StrictHostKeyChecking=no ${user}@${ip} bash -s < ${remote_up}
#    ssh  -o StrictHostKeyChecking=no ${user}@${ip} python3 -s < ${remote_process} - '9527'
    ssh  -o StrictHostKeyChecking=no ${user}@${ip} python3 -s < ${remote_mergesql} - 'ltnz_test_1'
done