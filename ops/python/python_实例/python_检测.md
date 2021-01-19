```python
import psutil

def memissue():
    print('内存信息：')
    mem = psutil.virtual_memory()
    # 单位换算为MB
    memtotal = mem.total/1024/1024
    memused = mem.used/1024/1024
    membaifen = str(mem.used/mem.total*100) + '%'

    print('%.2fMB' % memused)
    print('%.2fMB' % memtotal)
    print(membaifen)

def cuplist():
    print('磁盘信息：')
    disk = psutil.disk_partitions()
    diskuse = psutil.disk_usage('/')
    #单位换算为GB
    diskused = diskuse.used / 1024 / 1024 / 1024
    disktotal = diskuse.total / 1024 / 1024 / 1024
    diskbaifen = diskused / disktotal * 100
    print('%.2fGB' % diskused)
    print('%.2fGB' % disktotal)
    print('%.2f' % diskbaifen)


memissue()
print('*******************')
cuplist()
```
执行输出：
```python
/home/chengjiu_su/PycharmProjects/automatic/venv/bin/python /home/chengjiu_su/PycharmProjects/automatic/disk_detection.py
内存信息：
5363.16MB
7916.48MB
67.7468570791338%
*******************
磁盘信息：
40.56GB
58.11GB
69.80

Process finished with exit code 0
```