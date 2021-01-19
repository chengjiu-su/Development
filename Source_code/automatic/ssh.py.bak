#!/usr/local/bin/python3.6
import paramiko
#from sql import select_db

def ssh_cmd():
    #创建python对象
    ssh = paramiko.SSHClient()
    #允许连接不在know_host文件中的主机
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    # 秘钥链接服务器
    pkey = paramiko.RSAKey.from_private_key_file('/home/chengjiu_su/.ssh/id_rsa')
    # 建立连接
    ssh.connect(
        hostname='192.168.7.105',
        port=22,
        username='root',
        pkey=pkey)
    # 执行命令
    #stdin, stdout, stderr = ssh.exec_command('cd  /data/game/b;bash update.bash 41;')
    # os.system('cmd1 && cmd2')
    cmd1 = "cd /data/shells"
    cmd2 = "ls"
    cmd = cmd1 + " && " + cmd2
    stdin, stdout, stderr = ssh.exec_command(cmd)
    #stdin, stdout, stderr = ssh.exec_command('ls')
    # 获取命令结果并打印输出
    result = stdout.read()
    print(result.decode('utf-8'))
    # 关闭连接
    ssh.close()
ssh_cmd()