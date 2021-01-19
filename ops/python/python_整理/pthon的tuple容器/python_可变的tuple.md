前面我们学习了，对于tuple，它和list一个最大的不同点就是tuple是不可变的，tuple里面的元素，也是不可替换的。但是这针对的是仅包含基础数据类型（数字类型、布尔类型、字符串类型）的数据，对于组合数据类型，则不受这个约束。
```python
T = (1, 'CH', [3, 4])
```
这里T有三个元素，第一个元素是数字类型，第二个元素是字符串类型，第三个元素是列表类型的，我们尝试修改第三个元素的数据。
```python
T = (1, 'CH', [3, 4])
L = T[2]
print(L) # ==> [3, 4]
```
尝试替换L中的元素
```python
L[1] = 40
print(L) # ==> [3, 40]
print(T) # ==> (1, 'CH', [3, 40])
```
这个时候，我们发现，元组T中的第三个元素已经成功被改变了，这就有悖前面的定义，元组是不可改变的。那么这到底是为什么呢？
这是因为虽然tuple中的list元素改变了，但是tuple本身指向的list仍然是同一个list，list本身并没有改变，改变的只是list里面的一个元素，这是tuple所约束不到的范围。
![](python_%E5%85%83%E7%BB%84.png)
```python
T = (1, 'CH', [3, 4])
L2 = [3, 40]
```
尝试替换tuple中的list
```python
T[2] = L2
```
 报错
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'tuple' object does not support item assignment
```
如果我们直接替换list，这也是不行的。