##### 迭代器，生成器和装饰器[¶](https://pymbook.readthedocs.io/en/latest/igd.html#iterators-generators-and-decorators)

在本章中，我们将学习迭代器，生成器和装饰器。

## 迭代

遵循迭代器协议时，需要Python迭代器对象支持两种方法。

*__iter__*返回迭代器对象本身。用于*for* 和*in*语句。

*__next__*方法从迭代器返回下一个值。如果没有其他项目要返回，则应引发*StopIteration*异常。

```python
class Counter(object):
    def __init__(self, low, high):
        self.current = low
        self.high = high

    def __iter__(self):
        'Returns itself as an iterator object'
        return self

    def __next__(self):
        'Returns the next value till current is lower than high'
        if self.current > self.high:
            raise StopIteration
        else:
            self.current += 1
            return self.current - 1
```

现在，我们可以在代码中使用此迭代器。

```python
>>> c = Counter(5,10)
>>> for i in c:
...   print(i, end=' ')
...5 6 7 8 9 10
```

请记住，迭代器对象只能使用一次。这意味着在它 一次引发StopIteration之后，它将继续引发相同的异常。

```python
>>> c = Counter(5,6)
>>> next(c)
5
>>> next(c)
6
>>> next(c)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "<stdin>", line 11, in next
StopIteration
>>> next(c)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "<stdin>", line 11, in next
StopIteration
```

在前面看到的for循环示例中使用迭代器，以下示例尝试在后台显示代码。

```python
>>> iterator = iter(c)
>>> while True:
...     try:
...         x = iterator.__next__()
...         print(x, end=' ')
...     except StopIteration as e:
...         break...5 6 7 8 9 10
```

## 发电机[¶](https://pymbook.readthedocs.io/en/latest/igd.html#generators)

在本节中，我们将学习Python生成器。它们是在Python 2.3中引入的。这是一种使用函数的关键字*yield*创建迭代器的简便方法。

```python
>>> def my_generator():
...     print("Inside my generator")
...     yield 'a'
...     yield 'b'
...     yield 'c'
...>>> my_generator()
<generator object my_generator at 0x7fbcfa0a6aa0>
```

在上面的示例中，我们使用yield语句创建了一个简单的生成器。就像使用其他迭代器一样，我们可以在for循环中使用它。

```python
>>> for char in my_generator():
...     print(char)
...Inside my generator
a
b
c
```

在下一个示例中，我们将使用生成器函数创建相同的Counter类，并将其用于for循环中。

```python
def counter_generator(low, high):
    while low <= high:
       yield low
       low += 1

>>> for i in counter_generator(5,10):
...     print(i, end=' ')
...
5 6 7 8 9 10
```

在while循环中，当到达*yield*语句时，将返回low的值，并暂停生成器状态。在第二个*下一个*调用期间，生成器恢复到之前冻结的位置，然后将*low*的值增加1。它继续while循环，并再次返回*yield*语句。

调用生成器函数时，它将返回* generator *对象。如果在该对象上调用* dir *，则会发现它包含*__iter__*和* __ next __ *方法以及其他方法。

```python
 >>> c = counter_generator(5,10)
   >>> dir(c)
   ['__class__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__',
'__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__iter__',
'__le__', '__lt__', '__name__', '__ne__', '__new__', '__next__', '__reduce__',
'__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__',
'close', 'gi_code', 'gi_frame', 'gi_running', 'send', 'throw']
```

我们主要使用生成器进行延迟评估。这样，生成器就成为处理大量数据的好方法。如果您不想将所有数据加载到内存中，则可以使用生成器，该生成器将一次向您传递每个数据。

该示例的最大示例之一是*os.path.walk（）*函数，该函数使用回调函数和当前的*os.walk*生成器。使用生成器实现可节省内存。

我们可以有生成无限值的生成器。以下是一个这样的示例。

```python
>>> def infinite_generator(start=0):
...     while True:
...         yield start
...         start += 1
...>>> for num in infinite_generator(4):
...     print(num, end=' ')
...     if num > 20:
...         break...4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21
```

如果我们回到my_generator的示例，我们将发现生成器的一项功能。它们不可重复使用。

```python
>>> g = my_generator()
>>> for c in g:
...     print(c)
...Inside my generator
a
b
c
>>> for c in g:
...     print(c)
...
```

创建可重用生成器的一种方法是不持有任何状态的基于对象的生成器。任何具有__iter__方法的类都可以产生数据，可以用作对象生成器。在下面的示例中，我们将重新创建计数器生成器。

```python
>>> class Counter(object):
...     def __init__(self, low, high):
...         self.low = low
...         self.high = high
...     def __iter__(self):
...          counter = self.low
...          while self.high >= counter:
...              yield counter
...              counter += 1
...>>> gobj = Counter(5, 10)
>>> for num in gobj:
...     print(num, end=' ')
...5 6 7 8 9 10
>>> for num in gobj:
...     print(num, end=' ')
...5 6 7 8 9 10
```

## 生成器表达式

在本节中，我们将学习生成器表达式，它是列表理解和生成器的高性能，内存高效的概括。

例如，我们将尝试对1到9之间所有数字的平方求和。
```python
>>> sum([x*x for x in range(1,10)])
```
该示例实际上首先在内存中创建一个平方值列表，然后对其进行迭代，最后在求和后释放内存。如果列表很大，您可以了解内存使用情况。

我们可以通过使用生成器表达式来节省内存使用量

sum(x*x for x in range(1,10))

生成器表达式的语法表示，始终必须直接在一组括号内，并且两边都不能有逗号。基本上，这意味着以下两个示例都是有效的生成器表达式用法示例。

```python
>>> sum(x*x for x in range(1,10))
285
>>> g = (x*x for x in range(1,10))
>>> g
<generator object <genexpr> at 0x7fc559516b90>
```

我们可以链接生成器或生成器表达式。在以下示例中，我们将读取文件* / var / log / cron *，并查找是否有任何特定作业（在示例中，我们正在搜索anacron）是否成功运行。

我们可以使用shell命令*tail -f / var / log / cron | grep anacron进行相同的操作*

```python
>>> jobtext = 'anacron'
>>> all_lines = (line for line in open('/var/log/cron', 'r') )
>>> job = ( line for line in all_lines if line.find(jobtext) != -1)
>>> text = next(job)
>>> text
"May  6 12:17:15 dhcp193-104 anacron[23052]: Job `cron.daily' terminated\n"
>>> text = next(job)
>>> text
'May  6 12:17:15 dhcp193-104 anacron[23052]: Normal exit (1 job run)\n'
>>> text = next(job)
>>> text
'May  6 13:01:01 dhcp193-104 run-parts(/etc/cron.hourly)[25907]: starting 0anacron\n'
```

您可以在各行中编写一个for循环。

## 闭包

闭包不过是由另一个函数返回的函数。我们使用闭包来消除代码重复。在下面的示例中，我们创建一个简单的闭包以添加数字。

```python
>>> def add_number(num):
...     def adder(number):
...         'adder is a closure'
...         return num + number
...     return adder
...>>> a_10 = add_number(10)
>>> a_10(21)
31
>>> a_10(34)
44
>>> a_5 = add_number(5)
>>> a_5(3)
8
```

*加法器*是一种闭包，它将给定的数字添加到预定义的数字中。

## 装饰器

装饰器是一种向某些对象动态添加一些新行为的方法。我们通过使用闭包在Python中实现了相同的目的。

在该示例中，我们将创建一个简单的示例，该示例将在函数执行前后打印一些语句。

```python
>>> def my_decorator(func):
...     def wrapper(*args, **kwargs):
...         print("Before call")
...         result = func(*args, **kwargs)
...         print("After call")
...         return result
...     return wrapper
...>>> @my_decorator... def add(a, b):
...     "Our add function"
...     return a + b
...>>> add(1, 3)
Before call
After call
4
```