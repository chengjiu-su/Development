序列化
```python
# info = {
#     'name': "chengjiu",
#     'age': 21
# }
#
# f = open("test.text", 'w')
#
# f.write(str(info))
# f.close()

import json              #推荐调用json模块

info = {
    'name': "chengjiu",
    'age': 21
}

f = open("test.text", 'w')
f.write( json.dumps(info))   #序列化
print( json.dumps(info))

f.close()
```
test.text文本内容
```python
{"name": "chengjiu", "age": 21}
```
反序列化
```python
# f = open("test.text", 'r')
#
# data = eval(f.read() )
# f.close()
# print(data)
# print(data['age'])

import json             

f = open("test.text", 'r')
data = json.loads(f.read())  #反序列化

print(data['age'])      #取出21
f.close()
```
pickle序列化
```python
import pickle

def sayhi(name):
    print('hello',name)
info = {
    'name': "chengjiu",
    'age': 21,
    'func': sayhi
}

f = open("test.text", 'wb')
f.write( pickle.dumps(info))
print( pickle.dumps(info))

f.close()
```
pickle反序列化
```python
import pickle

def sayhi(name):                #序列化的整个函数对象，非内存地址
    print('hello',name)

f = open("test.text", 'rb')
data = pickle.loads(f.read())

print(data)
print(data['func']("chengjiu"))
f.close()
```
json
```python
import json

info = {
    'name': "chengjiu",
    'age': 21,
}

f = open("test.text", 'w')
f.write( json.dumps(info))
print( json .dumps(info))

info['age'] = 20
f.write( json.dumps(info))
print( json .dumps(info))
f.close()
```
test.text文本内容
```python
{"name": "chengjiu", "age": 21}{"name": "chengjiu", "age": 20}
```
json反
```python
import json

f = open("test.text", 'r')
data = json.load(f) #data = json.loads(f.read())

print(data)
f.close()
```