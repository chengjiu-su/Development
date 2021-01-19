我们通过set()传入list的方法创建了set，如果set在使用过程中需要往里面添加元素，这个时候应该怎么添加呢？
set提供了add()方法，我们可以使用add()方法，往set里面添加元素。
比如，班里面来了新的同学，名字叫Gina。
```python
names = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
name_set = set(names)
name_set.add('Gina')
print(name_set) # ==> set(['Gina', 'Alice', 'Candy', 'David', 'Ellena', 'Bob'])
```
可以看到，'Gina'已经添加到name_set里面去了。对于set，如果添加一个已经存在的元素，不会报错，也不会改变什么。
```python
names = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
name_set = set(names)
name_set.add('Alice')
print(name_set) # ==> set(['Bob', 'Ellena', 'Alice', 'Candy', 'David'])
```
有些时候需要批量往set里面添加元素，如果一个一个add是比较麻烦的，有没有批量往set里面添加元素的方法呢？
set提供了update()方法，可以一次性给set添加多个元素。
比如，新来了一批同学，名字分别是['Hally',  'Isen',  'Jenny',  'Karl']，则可以使用update()方法，批量往set中添加。
```python
names = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
new_names = ['Hally', 'Isen', 'Jenny', 'Karl']
name_set = set(names)
name_set.update(new_names) # ==> set(['Jenny', 'Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
print(name_set)
```