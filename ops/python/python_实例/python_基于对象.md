```python
class Counter(object):
    def __init__(self, low, high):
        self.current = low
        self.high = high

    def __iter__(self):
        'Returns itself as an iterator objecti'
        '将自身作为迭代器对象返回'
        return self

    def __next__(self):
        'Returns the next value till current is lower than high'
        '返回下一个值，直到current低于high'
        if self.current > self.high:
            raise StopIteration
        else:
            self.current += 1
            return self.current - 1
c = Counter(3,10)
for i in c:
    print(i, end=' ')
```