#!/usr/local/bin/python3
import paramiko


#创建ssh对象
ssh = paramiko.SSHClient()
#允许连接不在know_hosts文件的主机上
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
filename = "downtime_restart.py"
#本地文件路径
#localpath = "/home/chengjiu_su09/PycharmProjects/automatic/" + filename   #***本地python程序路径***
localpath = "/home/chengjiu_su09/copy_tmp/" + filename           #本地其他文件路径
#服务器的文件路径
remotepath = "/data/game/b/" + filename        #**********
# #可设置多台服务器,逗号间隔即可，尽量服务器的密码保持一致
server = ""                 # "39.105.219.43"               #"47.105.186.104"
words = server.split(",")
for word in words:
# 连接服务器,密钥连接
    pkey = paramiko.RSAKey.from_private_key_file('/home/chengjiu_su09/.ssh/id_rsa')
# 建立连接
    ssh.connect(word,
             port=22,
            username='root',
            pkey=pkey)
sftp = ssh.open_sftp()
#sftp.put(localpath, remotepath, callback = None)     #从本地推到服务器
sftp.get(remotepath, localpath, callback = None)    #从服务器拉到本地
#stdin, stdout, stderr = ssh.exec_command('cd /data/game/b/;ls | grep down')   #ssh服务器执行shell命令,确认文件上传成功
#result = stdout.read()
#print(result.decode('utf-8'))
#关闭连接
ssh.close()