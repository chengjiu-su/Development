除了前面学习的增删改查，dict还提供了非常多的工具函数帮助我们方便快捷的使用dict。

获取dict的所有key
dict提供keys()函数，可以返回dict中所有的key。
```python
d = {'Alice': [50, 61, 66], 'Bob': [80, 61, 66], 'Candy': [88, 75, 90]}
for key in d.keys():
    print(key)
# ==> Alice
# ==> Bob
# ==> Candy
```
获取dict所有的value
dict提供values()函数，可以返回dict中所有的value。
```python
d = {'Alice': [50, 61, 66], 'Bob': [80, 61, 66], 'Candy': [88, 75, 90]}
for key in d.values():
    print(key)
# ==> [50, 61, 66]
# ==> [80, 61, 66]
# ==> [88, 75, 90]
```
清除所有元素
dict提供clear()函数，可以直接清除dict中所有的元素。
```python
d = {'Alice': [50, 61, 66], 'Bob': [80, 61, 66], 'Candy': [88, 75, 90]}
print(d) # ==> {'Alice': [50, 61, 66], 'Bob': [80, 61, 66], 'Candy': [88, 75, 90]}
d.clear()
print(d) 
# ==> {}
```