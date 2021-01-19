当同学转校时，我们需要把同学的成绩从已有的成绩dict中删除，这个时候我们就需要学习如何删除dict中的元素。
dict提供便捷的pop()方法，允许我们快速删除元素，pop()方法需要指定需要删除的元素的key，并返回对应的value。
假设Alice转校了，需要把Alice的成绩删除，可以这样写：
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49
}
print(d) # ==> {'Alice': 45, 'Bob': 60, 'Candy': 75, 'David': 86, 'Ellena': 49}
alice_score= d.pop('Alice')
print(alice_score) # ==> 45
print(d) # ==> {'Bob': 60, 'Candy': 75, 'David': 86, 'Ellena': 49}
```
需要注意的是，pop()方法的参数是dict中的key，当key不存在时，同样会引起错误。比如在上述操作中，已经把Alice的成绩删除了，假如再次pop('Alice')，将会引发错误。
```python
d.pop('Alice')
```
 报错
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'Alice'
```