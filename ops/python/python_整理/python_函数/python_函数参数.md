函数参数是需要传递给函数内部的数据，在前面，我们已经简单接触了函数的参数，现在我们正式来认识它。
函数参数可以是任意的数据类型，只要函数内部逻辑可以处理即可。
```python
def print_param(param):
    print(param)
```
对于print_param函数，由于函数的逻辑是直接打印参数，并没有做任何别的逻辑，所以这个函数可以接受整数、浮点数、list、tuple、dict等等的数据类型。
```python
print_param(1)
print_param('3.1415926')
print_param([1, 2, 3, 4, 5])
```
但是，有时候由于函数的实现关系，需要特定的参数，就比如前面实现的求绝对值的函数my_abs()，如果传递一个字符串，就会引起错误。
```python
def my_abs(x):
    if x >= 0:
        return x
    else:
        return -x

my_abs('str param')
```
报错
```python
TypeError: '>=' not supported between instances of 'str' and 'int'
```
为了保证函数的正常运行，有时候需要对函数入参进行类型的校验，Python提供isinstance()函数，可以判断参数类型，它接收两个参数，第一个是需要判断的参数，第二个是类型。
```python
isinstance(100, int) # ==> True
isinstance(100.0, int) # ==> False
isinstance('3.1415926', str) # ==> True
```
有了isinstance，就可以优化my_abs函数，不在里面运行出错了。
```python
def my_abs(x):
    if not isinstance(x, int) or not isinstance(x, float):
        print('param type error.')
        return None
    if x >= 0:
        return x
    else:
        return -x
```