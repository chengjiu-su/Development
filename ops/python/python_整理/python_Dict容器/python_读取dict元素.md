我们现在可以创建一个dict，保存名字和成绩的对应关系。
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49,
    'Gaven': 86
}
```
此时，如果想通过名字来查询某个同学的成绩，也就是通过key来查询value，这个时候怎么办呢？
dict提供通过key找到对应value的功能，通过d[key]的形式，就可以得到对应的value。
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49,
    'Gaven': 86
}
print(d['Bob']) # ==> 60
print(d['Alice']) # ==> 45
```
这和list通过下标找到对应位置的元素是类似的。
回顾一下前面使用下标的方式访问list元素的时候，当下标不存在时，就会引发错误，在dict中，也是一样的，当对应的key不存在时，也会引发错误。
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49,
    'Gaven': 86
}
print(d['Dodo'])
```
抛出异常
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'Dodo'
```
它的意思是key不存在，因此我们在需要通过key找到value时，一定要先判断key存不存在，然后才使用上面的方式获取对应的value，以避免错误。
```python
if 'Alice' in d:
    print(d['Alice']) # ==> 45
if 'Dodo' in d: # Dodo不存在，所以不会走下面的逻辑
    print(d['Dodo'])
```
除了使用这种方法，还有一种方法可以通过key来获取对应的value，这种方法不会引起错误，dict本身提供get方法，把key当作参数传递给get方法，就可以获取对应的value，当key不存在时，也不会报错，而是返回None。
```python
print(d.get('Alice')) # ==> 45
print(d.get('Dodo')) # ==> None
```
因为通过get方法在代码实现上更加简单，且不会引起错误，因此更加推荐使用get方法来获取dict的元素。