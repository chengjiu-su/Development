由于tuple一旦定义之后便不可修改，所以在实际编程中，tuple经常用于存放固定不变的数据。
因此在使用上，tuple提供了便捷的方法可以访问tuple中的数据。

>count()方法
count()方法用来统计tuple中某个元素出现的次数。
```python
T = (1, 1, 2, 2, 3, 3, 1, 3, 5, 7, 9)
print(T.count(1)) # ==> 3
print(T.count(5)) # ==> 1
```
对于不存在的元素，count方法不会报错，而是返回0，这是合理的，因为元组里面有0个不存在的元素。
```python
T = (1, 1, 2, 2, 3, 3, 1, 3, 5, 7, 9)
print(T.count(10)) # ==> 0
index()方法
index()方法可以返回指定元素的下标，当一个元素多次重复出现时，则返回第一次出现的下标位置。

T = (1, 1, 2, 2, 3, 3, 1, 3, 5, 7, 9)
T.index(9) # ==> 10
T.index(5) # ==> 8
T.index(1) # ==> 0 # 多次出现，返回第一次出现的位置
注意，index()方法和count()方法不一样，当指定的元素不存在时，使用index()方法Python会报错。

T = (1, 1, 2, 2, 3, 3, 1, 3, 5, 7, 9)
T.index(100)
```
 报错
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: tuple.index(x): x not in tuple
```