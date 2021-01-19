shelve 模块
shelve模块是一个简单的k,v将内存数据通过文件持久化的模块，可以持久化任何pickle可支持的python数据格式
```python
import shelve
 
d = shelve.open('shelve_test') #打开一个文件
 
class Test(object):
    def __init__(self,n):
        self.n = n
 
 
t = Test(123) 
t2 = Test(123334)
 
name = ["alex","rain","test"]
d["test"] = name #持久化列表
d["t1"] = t      #持久化类
d["t2"] = t2
 
d.close()
```
读取
```python
import shelve
 
d = shelve.open('shelve_test') #打开一个文件

print(d.get("name"))
print(d.get("t"))
print(d.get("t2"))
print(d.items()) # 读取全部