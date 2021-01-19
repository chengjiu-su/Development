由于列表list是一个有序的容器，所以在list里面，每一个元素都有一个唯一的位置，我们称之为索引(index)，这和字符串是类似的，因此我们也可以通过位置的方式获取list中的元素，回顾一下前面学习的，我们通过中括号[]来按位置访问对应的元素。
注意，这里要注意区分，列表的定义也是通过中括号[]来定义的，但这和通过索引访问列表里面的元素并不冲突
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
print(names[0])
print(names[1])
print(names[2])
print(names[3])
```
由于names只有四个元素，所以我们最多只能通过索引3访问到最后一个元素。试想一下，如果我们print(names[4])，会怎么样？
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
print(names[4])
```
事实上，这会引起Python运行的错误，提示索引访问超出范围。
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
```
因此，我们在使用索引的方式访问列表时，一定要特别注意不要越界。
同时，列表和字符串一样，也支持切片，通过切片的方式，获取到列表的子列表。
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
sub_names = names[0:2]
print(sub_names)
```
这里需要注意一下，如果我们越界切片的话，不会出现Python运行错误，但是按照这样的下标去切片，获取不到任何元素。
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
sub_names = names[5:10]
print(sub_names) # ==> []
```