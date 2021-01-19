```python
import time
import os

#执行命令将命令输出保存成时间戳文件
new_time = time.strftime('%Y-%m-%d')
disk_status = os.popen('df -h').readlines() # 返回的是一个文件对象,存入变量disk_status
str1 = ''.join(disk_status)
f = open(new_time + '.txt', 'w')
f.write('%s' % str1)  #将df -h 输出写入时间戳文件

f.flush()
f.close()
```