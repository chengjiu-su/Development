#读取文件指定内容并打印
#import shutil


f=open('/root/shell/app.log','r')
findtxt='配置版本:'
lnfindtxt=len(findtxt)
txt=f.readlines()
txt=str(txt)
pos1=txt.find(findtxt)
print(txt[pos1+lnfindtxt:pos1+10+lnfindtxt])
#shutil.copy('/data/game/b/client', '/root/shell/res/')  # cp /etc/shadow /tmp/
f.close()