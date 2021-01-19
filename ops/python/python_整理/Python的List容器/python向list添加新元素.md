现在班里面有4名同学：
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
```
今天，班里转来一名新同学Candy，如何把新同学添加到现有的列表当中呢？
在Python中，list提供了一系列的方法可以让我们操作list中的元素，其中也包含了添加元素的方法。
第一个办法是用append()方法，把新同学追加到列表的末尾：
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
names.append('Candy')
print(names) # ==> ['Alice', 'Bob', 'David', 'Ellena', 'Candy']
```
注意，append()方法总是将元素添加到list的尾部。 
如果上面的列表需要按照首字母排序的话，那么Candy应该是排在第三的位置的，这怎么办呢？
这就需要使用list的insert()方法，insert()方法和append()方法不一样，insert()方法需要两个参数，分别是需要插入的位置，以及需要插入的元素。
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
names.insert(2, 'Candy')
print(names) # ==> ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
```
注意，将Candy插入到第三的位置之后，原来的名字，都将自动往后移动一位，这个时候再使用相同的索引获取后面的元素，将会得到不一样的结果
```python
names = ['Alice', 'Bob', 'David', 'Ellena']
print(names[2]) # ==> David
names.insert(2, 'Candy')
print(names[2]) # ==>Candy
```