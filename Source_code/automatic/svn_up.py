import os
import sys


def up():       #更新函数
    update = os.system('svn up --username script --password fdasf43tg453h534h543 --no-auth-cache --force %s' % (path)) #调用执行脚本时的参数
    #update = os.system('ls %s' % path)
    print('update...')
def restart():  #重启脚本函数
    os.system('dos2uniox service.sh')
    os.system('bash service.sh restart')
path = sys.argv[1] #执行脚本开始传参,给定实参
while 1:
    input=input('重启(y)or拒绝(n): ')
    # noinspection PyInterpreter
    if input == 'n':
        up()
        print('执行更新')
        break
    elif input == 'y':
        os.chdir('%s' %(path))
        restart()
        print('重启ing')
        break

#执行脚本方式： python3 up_svn.py 35