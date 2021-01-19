切片:取多个元素　　
```python
>>> names = ["Alex","Tenglan","Eric","Rain","Tom","Amy"]
>>> names[1:4]  #取下标1至下标4之间的数字，包括1，不包括4
['Tenglan', 'Eric', 'Rain']
>>> names[1:-1] #取下标1至-1的值，不包括-1
['Tenglan', 'Eric', 'Rain', 'Tom']
>>> names[0:3] 
['Alex', 'Tenglan', 'Eric']
>>> names[:3] #如果是从头开始取，0可以忽略，跟上句效果一样
['Alex', 'Tenglan', 'Eric']
>>> names[3:] #如果想取最后一个，必须不能写-1，只能这么写
['Rain', 'Tom', 'Amy'] 
>>> names[3:-1] #这样-1就不会被包含了
['Rain', 'Tom']
>>> names[0::2] #后面的2是代表，每隔一个元素，就取一个
['Alex', 'Eric', 'Tom'] 
>>> names[::2] #和上句效果一样
['Alex', 'Eric', 'Tom']
```
追加
```python
>>> names
['Alex', 'Tenglan', 'Eric', 'Rain', 'Tom', 'Amy']
>>> names.append("我是新来的")
>>> names
['Alex', 'Tenglan', 'Eric', 'Rain', 'Tom', 'Amy', '我是新来的']
```
插入
```python
>>> names
['Alex', 'Tenglan', 'Eric', 'Rain', 'Tom', 'Amy', '我是新来的']
>>> names.insert(2,"强行从Eric前面插入")
>>> names
['Alex', 'Tenglan', '强行从Eric前面插入', 'Eric', 'Rain', 'Tom', 'Amy', '我是新来的']

>>> names.insert(5,"从eric后面插入试试新姿势")
>>> names
['Alex', 'Tenglan', '强行从Eric前面插入', 'Eric', 'Rain', '从eric后面插入试试新姿势', 'Tom', 'Amy', '我是新来的']
```
修改
```python

>>> names
['Alex', 'Tenglan', '强行从Eric前面插入', 'Eric', 'Rain', '从eric后面插入试试新姿势', 'Tom', 'Amy', '我是新来的']
>>> names[2] = "该换人了"
>>> names
['Alex', 'Tenglan', '该换人了', 'Eric', 'Rain', '从eric后面插入试试新姿势', 'Tom', 'Amy', '我是新来的']
```
删除
```python
>>> del names[2] 
>>> names
['Alex', 'Tenglan', 'Eric', 'Rain', '从eric后面插入试试新姿势', 'Tom', 'Amy', '我是新来的']
>>> del names[4]
>>> names
['Alex', 'Tenglan', 'Eric', 'Rain', 'Tom', 'Amy', '我是新来的']
>>> 
>>> names.remove("Eric") #删除指定元素
>>> names
['Alex', 'Tenglan', 'Rain', 'Tom', 'Amy', '我是新来的']
>>> names.pop() #删除列表最后一个值 
'我是新来的'
>>> names
['Alex', 'Tenglan', 'Rain', 'Tom', 'Amy']
```
扩展
```python
>>> names
['Alex', 'Tenglan', 'Rain', 'Tom', 'Amy']
>>> b = [1,2,3]
>>> names.extend(b)
>>> names
['Alex', 'Tenglan', 'Rain', 'Tom', 'Amy', 1, 2, 3]
```
拷贝
```python
>>> names
['Alex', 'Tenglan', 'Rain', 'Tom', 'Amy', 1, 2, 3]

>>> name_copy = names.copy()
>>> name_copy
['Alex', 'Tenglan', 'Rain', 'Tom', 'Amy', 1, 2, 3]
```
统计
```python
>>> names
['Alex', 'Tenglan', 'Amy', 'Tom', 'Amy', 1, 2, 3]
>>> names.count("Amy")
2
```
排序&翻转
```python
>>> names
['Alex', 'Tenglan', 'Amy', 'Tom', 'Amy', 1, 2, 3]
>>> names.sort() #排序
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unorderable types: int() < str()   #3.0里不同数据类型不能放在一起排序了，擦
>>> names[-3] = '1'
>>> names[-2] = '2'
>>> names[-1] = '3'
>>> names
['Alex', 'Amy', 'Amy', 'Tenglan', 'Tom', '1', '2', '3']
>>> names.sort()
>>> names
['1', '2', '3', 'Alex', 'Amy', 'Amy', 'Tenglan', 'Tom']

>>> names.reverse() #反转
>>> names
['Tom', 'Tenglan', 'Amy', 'Amy', 'Alex', '3', '2', '1']
```
获取下标
```python
>>> names
['Tom', 'Tenglan', 'Amy', 'Amy', 'Alex', '3', '2', '1']
>>> names.index("Amy")
2 #只返回找到的第一个下标
```
清空整个list
```python
>>> names.clear()
```