Python的列表，除了支持正向顺序索引获取列表中的每一个元素以外，也支持倒序访问list中的每一个元素。
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
```
对于names列表，Ellena的名字排在最后，也就是我们所说的倒数第一个，在Python中，可以使用-1来表示最后一个元素。
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
print(names[-1]) # ==> Ellena
```
同样的道理，我们可以通过-2，打印出David的名字，通过-3，打印出Bob的位置。
```python
print(names[-2]) # ==> David
print(names[-3]) # ==> Bob
```
注意，如果我们使用-5的话，因为不存在倒数第五个名字，因此这也是一种越界，同样会报错。
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
print(names[-5])
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
```