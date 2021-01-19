就像多层if-else嵌套一样，python的循环也支持嵌套。
我们使用两层嵌套循环输出字符串'ABC'中每个字符和字符串'123'每个字符的排列。
```python
s1 = 'ABC'
s2 = '123'
for x in s1:
    for y in s2:
        print(x + y)
```
在上述代码中，对于外层循环，外层每循环1次，内层就会循环3次，因此，我们将会得到如下结果：
```python
A1
A2
A3
B1
B2
B3
C1
C2
C3
```