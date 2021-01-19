dict和tuple不一样，dict是可变的，我们随时可以往dict中添加新的key-value，比如对于上节课的成绩dict：
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49
}
```
需要往里面添加Dodo、Mimi的成绩时，可以使用赋值语句往里面添加元素：
```python
d['Mimi'] = 72
d['Dodo'] = 88
print(d)
```
实际上，value可以是任意类型的元素，可以是list、tuple等，假如Mimi近两次成绩分别是72，73，Dodo近两次的成绩分别是88，90，则可以使用赋值语句往dict中添加list元素。
```python
d['Mimi'] = [72, 73]
d['Dodo'] = [88, 90]
print(d)
```
此后，如果Mimi、Dodo的第三次成绩也出来了，分别是75，90，则可以先通过key把对应的value查询出来，然后再往类型是list的value中添加第三次的成绩。
```python
d['Mimi'].append(75)
d['Dodo'].append(90)
print(d)
```