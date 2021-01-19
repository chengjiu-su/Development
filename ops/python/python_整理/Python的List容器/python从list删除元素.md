如果Ellena因为家庭原因需要转学，那么我们如何把Ellena从已有的列表里面删除呢？
这个时候我们可以使用列表的pop()方法，pop()方法默认删除列表的最后一个元素，并返回。
```python
L = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
name = L.pop()
print(name) # ==> Ellena
print(L) # ==> L = ['Alice', 'Bob', 'Candy', 'David']
```
对于Ellena，由于Ellena恰好位于列表的最后，所以可以直接使用 pop() 方法把Ellena从列表的最后删除，假如需要转学的不是Ellena，而是Candy，这个时候应该怎么办呢？
pop() 方法，除了可以删除最后一个元素以外，pop() 还可以接收一个参数，指定需要删除的元素的位置。
```python
L = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
name = L.pop(2)
print(name) # ==> Candy
print(L) # ==> ['Alice', 'Bob', 'David', 'Ellena']
任务
L = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']，由于Candy，David依次转学，某同学写出以下代码，请判断以下代码是否可以正常运行？如果不可以，为什么？请帮忙修正。

L = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
L.pop(2)
L.pop(3)
print(L)
```