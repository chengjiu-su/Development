>可变参数在使用上确实方便，函数会把可变参数当作 tuple 去处理， tuple 在使用上有一定的局限性，比如有时候想找到特定位置的参数，只能通过下标的方式去寻找，如果顺序发生变化得时候，下标就会失效，函数逻辑就得重新修改实现。
Python函数提供可变关键字参数，对于可变关键字参数，可以通过关键字的名字 key 找到对应的参数值，想想这和我们之前学习过的什么类似？是的没错，dict，Python会把可变关键字参数当作dict去处理；对于可变关键字参数，一般使用**kwargs来表示。

例如，想要打印一个同学的信息，可以这样处理：
```python
def info(**kwargs):
    print('name: {}, gender: {}, age: {}'.format(kwargs.get('name'), kwargs.get('gender'), kwargs.get('age')))

info(name = 'Alice', gender = 'girl', age = 16)
```
对于一个拥有必需参数，默认参数，可变参数，可变关键字参数的函数，定义顺序是这样的：
```python
def func(param1, param2, param3 = None, *args, **kwargs):
    print(param1)
    print(param2)
    print(param3)
    print(args)
    print(kwargs)

func(100, 200, 300, 400, 500, name = 'Alice', score = 100)
# ==> 100
# ==> 200
# ==> 300
# ==> (400, 500)
# ==> {'name': 'Alice', 'score': 100}
```
当然，这么多类型的参数，很容易导致出错，在实际使用上，不建议定义这么多的参数。