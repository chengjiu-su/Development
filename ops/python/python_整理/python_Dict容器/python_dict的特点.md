查找速度快
dict的第一个特点是查找速度快，无论dict有10个元素还是10万个元素，查找速度都一样。而list的查找速度随着元素增加而逐渐下降。
不过dict的查找速度快不是没有代价的，dict的缺点是占用内存大，还会浪费很多内容，list正好相反，占用内存小，但是查找速度慢。

有序与无序
在Python3.5之前，dict中的元素是无序的，也就是dict中元素的插入顺序和打印顺序未必一致，比如使用Python3.5之前的版本执行以下代码：
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49
}
print(d) # ==> {'Bob': 60, 'Ellena': 49, 'Alice': 45, 'Candy': 75, 'David': 86}
```
可以看到，打印的顺序和定义的顺序并不一致。
但是在Python3.6、Python3.7版本中，却得到了有序的结果。
```python
print(d) # ==> {'Alice': 45, 'Bob': 60, 'Candy': 75, 'David': 86, 'Ellena': 49}
```
为什么在不同的版本中，会得到不一样的结果呢？这是因为底层的实现发生了改变，我们可以认为在Python3.6的版本以后，dict是有序的，但是一般而言，为了避免不必要的误解，一般在需要有序的dict时，我们会使用一种叫做Ordereddict的字典，来确保有序。

>key不可变
对于基础数据类型，字符串、数字等，这些都是不可变的，可以作为dict的key，而对于复杂数据类型，经过前面的学习，我们知道tuple是不可变的，list是可变的，因此tuple可以作为dict的key，但是list不可以作为dict的key，否则将会报错。
```python
key = (1, 2, 3) # 以tuple作为key
d[key] = True
key = [1, 2, 3]
d[key] = True
```
报错
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unhashable type: 'list'
```
如上所示，如果将list作为dict的key，将会引起错误。
由于dict是按 key 查找，所以，在一个dict中，key不能重复。

>Python遍历dict
通过直接print(d)，我们打印出来的是完整的一个dict；有时候，我们需要把dict中m一定条件的元素打印出来，比如成绩超过60的，在这种情况下，我们需要则需要遍历dict（这种时候需要使用for循环），并通过条件判断把满足条件的打印出来。
遍历dict有两种方法， 第一种是遍历dict的所有key，并通过key获得对应的value。
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49
}
for key in d: # 遍历d的key
    value = d[key]
    if value > 60:
        print(key, value)
# ==> Candy 75
# ==> David 86
```
第二种方法是通过dict提供的items()方法，items()方法会返回dict中所有的元素，每个元素包含key和value。
```python
for key, value in d.items():
    if value > 60:
        print(key, value)
# ==> Candy 75
# ==> David 86
```