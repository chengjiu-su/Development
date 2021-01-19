#!/usr/local/bin/python3
# encoding=utf-8
import datetime
import os
import threading


def execCmd(cmd):
    #try:
    print("命令%s开始%s" % (cmd, datetime.datetime.now()))
    os.system(cmd)
    print("命令%s结束%s" % (cmd, datetime.datetime.now()))

if __name__ == '__main__':
    # 需要执行的命令列表
    cmds = ['/bin/bash /home/chengjiu_su/test_1.bash ',
            '/bin/bash /home/chengjiu_su/test_2.bash ',
            '/bin/bash /home/chengjiu_su/test_3.bash ']
    # 线程池
    threads = []
    print("程序开始运行%s" % datetime.datetime.now())

    for cmd in cmds:
        th = threading.Thread(target=execCmd, args=(cmd, ))
        th.start()
        threads.append(th)

# 等待线程运行完毕
    for th in threads:
        th.join()

    print("程序结束运行%s" % datetime.datetime.now())