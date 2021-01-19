元组(tuple)和list一样，也是一个有序容器，在元组中，同样可以包含0个或者多个元素，并且也支持索引访问、切片等操作。
定义元组的方式是使用小括号()将元组内的元素括起来。
```python
T = ('Alice', 'Bob', 'Candy', 'David', 'Ellena')
```
通过下标的方式访问元素
```python
print(T[0]) # ==> Alice
print(T[4]) # ==> Ellena
```
切片
```python
print(T[1:3]) # ==> ('Bob', 'Candy')
```
元组数据类型可以把不是元组的容器转换为元组，比如将列表转换成元组。
```python
L = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
print(L) # ==> ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
T = tuple(L)
print(T) # ==> ('Alice', 'Bob', 'Candy', 'David', 'Ellena')
```
同样的，对于列表数据类型，也可以把元组转换成列表。
```python
T = ('Alice', 'Bob', 'Candy', 'David', 'Ellena')
print(T) # ==> ('Alice', 'Bob', 'Candy', 'David', 'Ellena')
L = list(T)
print(L) # ==> ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
```
但是，tuple和list不一样的是，tuple是固定不变的，一旦变成tuple，tuple中的每一个元素都不可被改变，同时也不能再往tuple中添加数据，而list是可以的。
```python
T = ('Alice', 'Bob', 'Candy', 'David', 'Ellena')
```
替换元素
```python
T[1] = 'Boby'
```
报错
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'tuple' object does not support item assignment
```
请注意，元组(tuple)的这个特性是非常重要的，在运行上tuple的性能是list的数倍。