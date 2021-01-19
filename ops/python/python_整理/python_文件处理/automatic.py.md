```python
#!/usr/local/bin/python3
import os  #os模块调用linux命令
import sys  #调用实参
import time

#执行此脚本要有旧文件对应修改，保存至新文件

source_path = sys.argv[1]


def mkdir(path):
    # 去除首位空格
    path = path.strip()
    # 判断路径是否存在
    # 存在     True
    # 不存在   False
    isExists = os.path.exists(path)

    # 判断结果
    if not isExists:
        # 如果不存在则创建目录
        # 创建目录操作函数
        os.makedirs(path)
        print('目录创建成功,开始执行svn检出')
        return True
    else:
        # 如果目录存在则不创建，并提示目录已存在
        print('目录已存在,开始svn检出')
        return False

# 定义要创建的目录
mkpath = "/data/game/b/%s" % (source_path)
# 调用函数
mkdir(mkpath)

#svn检出
def checkout():
    os.system(
        'svn checkout svn://svn.popcornie.com/server/b/release-stable-23you/game   --username script --password fdasf43tg453h534h543 --no-auth-cache --force %s '
        % (source_path))

#启动脚本
def start():  #启动脚本
    os.system('dos2uniox service.sh')
    os.system('bash service.sh start')

#查看日志文件
def Startup_log():  #查看启动日志
    os.system('tailf target/logs/ytsc.log')


checkout()
#修改配置文件
fr = open("/data/game/b/oldsvn_configuration/servers_old.info",
          'r')  #打开旧文件，设置权限为读
os.chdir("/data/game/b/%s" % (source_path))

fr_new = open("servers.info", 'w')  #打开新文件，设置权限为写
for line in fr:
    if ":01" in line:
        line = line.replace(":01", ":45")  #***---根据server_id---***
    if "23you_1" in line:
        line = line.replace("23you_1", "23you_2")  #根据平台
    if "2020-05-26 15:00:00" in line:
        line = line.replace("2020-05-26 15:00:00",
                            "2020-00-00 15:00:00")  #***---开启服务时间---***
    if "1=" in line:
        line = line.replace("1=", "#1=")
    fr_new.write(line)  #将内容写入新文件中

fr.close()
fr_new.close()  #关闭两个文件

fr1 = open("/data/game/b/oldsvn_configuration/server-config_old.properties",
           'r')
os.chdir("/data/game/b/%s" % (source_path))
fr1_new = open("server-config.properties", 'w')
for line in fr1:
    if "id=1" in line:
        line = line.replace("id=1", 'id=%s' % (source_path))  #根据进程
    if "ip=127.0.0.1" in line:
        line = line.replace("ip=127.0.0.1",
                            "ip=47.105.186.104")  #***---根据服务器公网ip---***
    if "=DEBUG" in line:
        line = line.replace("=DEBUG", "=RELEASE")  #运行模式
    if "1008" in line:
        line = line.replace("1008", "")  #***---服务器管理器端口---***
    if "1009" in line:
        line = line.replace("1009", "")  #***---后台端口---***
    if "=a" in line:
        line = line.replace("=a", "=ltnz")  #数据库用户名密码
    if "data_h5_23" in line:
        line = line.replace("data_h5_23", "game_ytsc_%s" %
                            (source_path))  #数据库命名
    fr1_new.write(line)

fr1.close()
fr1_new.close()
os.chdir("/data/game/b/%s" % (source_path))
time.sleep(1)
#while循环。确定是否执行脚本启动
while 1:
    input = input('启动(y)or拒绝(n): ')
    if input == 'y':
        start()
        print('启动ing...')
        Startup_log()
        break
    elif input == 'n':
        print('暂时不启动')
        break

#脚本执行方式:  python 脚本名  路径(path)
```