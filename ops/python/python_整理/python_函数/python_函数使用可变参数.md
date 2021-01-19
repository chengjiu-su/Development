除了默认参数，Python函数还接收一种参数叫做可变参数，可变参数即任意个参数的意思，可变参数通常使用*args来表示。
```python
def func(*args):
    print('args length = {}, args = {}'.format(len(args), args))

func('a') # ==> args length = 1, args = ('a',)
func('a', 'b') # ==> args length = 2, args = ('a', 'b')
func('a', 'b', 'c') # ==> args length = 3, args = ('a', 'b', 'c')
```
注意，在使用上，Python会把可变参数定义为一个tuple，所以在函数内部，把可变参数当作tuple来使用就可以了，比如可以通过位置下标取出对应的元素等。
定义可变参数的目的也是为了简化调用。假设我们要计算任意个数的平均值，就可以定义一个可变参数：
```python
def average(*args):
    sum = 0
    for item in args:
        sum += item
    avg = sum / len(args)
    return avg
```
这样，在调用的时候，我们就可以这样写：
```python
average(1, 2) # ==> 1.5
average(1, 2, 2, 3, 4) # ==> 2.4
average()
```
 报错
```python
Traceback (most recent call last):
ZeroDivisionError: division by zero
```
在执行average()的时候，却报错了，这是因为在使用可变参数时，没有考虑周全导致的，因为可变参数的长度可能是0，当长度为0的时候，就会出现除0错误。因此需要添加保护的逻辑，这是同学在使用过程中需要特别注意的。