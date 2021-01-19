对于列表，除了可以向列表添加元素，删除列表元素以外，列表已有的元素，也是可以修改的，通过索引指定位置，并赋值新的元素，即可替换列表中原有的元素。
假如班上同学Candy需要转走了，同时有一个新的同学Canlina转入，那么按照字母排序，Canlina的位置恰好是Candy的位置。
```python
L = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
L[2] = 'Canlina'
print(L)
```
我们也可以使用倒序索引来完成同样的功能。
```python
L = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
L[-3] = 'Canlina'
print(L)
```
注意，如果替换一个不存在的下标，则同样会引起Python运行错误。
```python
L = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
L[6] = 'Canlina'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list assignment index out of range
```