装饰器： 
定义：本质是函数，(装饰其它函数)就是为其他函数添加附加功能
原则：
- 不能修改被装饰的函数源代码
- 不能修改被装饰的函数调用方式

函数式编程复习：
```python
def map_test(func,array):
    array_new=[]
    for i in array:
        array_new.append(func(i))
    return array_new
print map_test(lambda x:x**2,range(10))
print map(lambda x:x**2,range(10))

def odd(num):
    return num % 2
def filter_test(func,array):
    array_new=[]
    for i in array:
        if func(i):
            array_new.append(i)
    return array_new

print filter_test(odd,range(10))
print filter(odd,range(10))


def reduce_test(func,array,init):
    l=list(array)
    if init is None:
        res=l.pop(0)
    else:
        res=init
    for i in l:
        res=func(res,i)
    return res

print reduce_test(lambda x,y:x+y,range(100),10)
print reduce(lambda x,y:x+y,range(100),10)
```

python装饰器
>
函数调用顺序：其他高级语言类似,Python 不允许在函数未声明之前,对其进行引用或者调用

错误示范：
```python
def foo():
    print 'in the foo'
    bar()
    
foo()

报错：
in the foo

Traceback (most recent call last):
  File "<pyshell#13>", line 1, in <module>
    foo()
  File "<pyshell#12>", line 3, in foo
    bar()
NameError: global name 'bar' is not defined
def foo():
    print 'foo'
    bar()
foo()
def bar():
    print 'bar'
报错：NameError: global name 'bar' is not defined

正确示范:(注意，python为解释执行，函数foo在调用前已经声明了bar和foo，所以bar和foo无顺序之分)
def bar():
    print 'in the bar'
def foo():
    print 'in the foo'
    bar()
    
foo()

def foo():
    print 'in the foo'
    bar()
def bar():
    print 'in the bar'
foo()
```



二：高阶函数
>
满足下列条件之一就可成函数为高阶函数
某一函数当做参数传入另一个函数中
函数的返回值包含n个函数,n>0

高阶函数示范：
```python
def bar():
    print 'in the bar'
def foo(func):
    res=func()
    return res
foo(bar)
```
高阶函数的过人之处：
```python
def foo(func):
    return func

print 'Function body is %s' %(foo(bar))
print 'Function name is %s' %(foo(bar).func_name)
foo(bar)()
#foo(bar)() 等同于bar=foo(bar)然后bar()
bar=foo(bar)
bar()
````
三：内嵌函数和变量作用域：

定义：在一个函数体内创建另外一个函数，这种函数就叫内嵌函数(基于python支持静态嵌套域)

函数嵌套示范：
```python
def foo():
    def bar():
        print 'in the bar'

    bar()

foo()
# bar()
```
局部作用域和全局作用域的访问顺序
```python
x=0
def grandpa():
    # x=1
    def dad():
        x=2
        def son():
            x=3
            print x
        son()
    dad()
grandpa()
```

局部变量修改对全局变量的影响
```python
y=10
# def test():
#     y+=1
#     print y

def test():
    # global y
    y=2
    print y

test()
print y


def dad():
    m=1
    def son():
        n=2
        print '--->',m + n
    print '-->',m
    son()
dad()

```
四：闭包：如果在一个内部函数里，对在外部作用域(但不是在全局作用域）的变量进行引用，那么内部函数就被认为是 closure
```python
def counter(start_num=0):
    count=[start_num]
    def incr():
        count[0]+=1
        return count[0]
    return incr

print counter()
print counter()()
print counter()()
c=counter()
print c()
print c()
```

五：内嵌函数+高阶函数+闭包=》装饰器

预热两个范例:

范例一：函数参数固定
```python
def decorartor(func):
    def wrapper(n):
        print 'starting'
        func(n)
        print 'stopping'
    return wrapper


def test(n):
    print 'in the test arg is %s' %n

decorartor(test)('alex')

```
范例二：函数参数不固定
```python
def decorartor(func):
    def wrapper(*args,**kwargs):
        print 'starting'
        func(*args,**kwargs)
        print 'stopping'
    return wrapper


def test(n,x=1):
    print 'in the test arg is %s' %n

decorartor(test)('alex',x=2)
```
无参装饰器
```python
import time
def decorator(func):
        def wrapper(*args,**kwargs):
            start=time.time()
            func(*args,**kwargs)
            stop=time.time()
            print 'run time is %s ' %(stop-start)
            print timeout
        return wrapper

@decorator
def test(list_test):
    for i in list_test:
        time.sleep(0.1)
        print '-'*20,i
 

#decorator(test)(range(10)) 
test(range(10))
```
2. 有参装饰器
```python
import time
def timer(timeout=0):
    def decorator(func):
        def wrapper(*args,**kwargs):
            start=time.time()
            func(*args,**kwargs)
            stop=time.time()
            print 'run time is %s ' %(stop-start)
            print timeout
        return wrapper
    return decorator
@timer(2)
def test(list_test):
    for i in list_test:
        time.sleep(0.1)
        print '-'*20,i
 
#timer(timeout=10)(test)(range(10))
test(range(10))

```
六：装饰器应用案例：

装饰器功能：函数超时则终止
```python
# -*- coding: utf-8 -*-  
from threading import Thread  
import time  
  
class TimeoutException(Exception):  
    pass  
  
ThreadStop = Thread._Thread__stop#获取私有函数  
  
def timelimited(timeout):  
    def decorator(function):  
        def decorator2(*args,**kwargs):  
            class TimeLimited(Thread):  
                def __init__(self,_error= None,):  
                    Thread.__init__(self)  
                    self._error =  _error  
                      
                def run(self):  
                    try:  
                        self.result = function(*args,**kwargs)  
                    except Exception,e:  
                        self._error =e  
  
                def _stop(self):  
                    if self.isAlive():  
                        ThreadStop(self)  
  
            t = TimeLimited()  
            t.start()  
            t.join(timeout)  
       
            if isinstance(t._error,TimeoutException):  
                t._stop()  
                raise TimeoutException('timeout for %s' % (repr(function)))  
  
            if t.isAlive():  
                t._stop()  
                raise TimeoutException('timeout for %s' % (repr(function)))  
  
            if t._error is None:  
                return t.result  
  
        return decorator2  
    return decorator  
 
@timelimited(2)  
def fn_1(secs):  
    time.sleep(secs)  
    return 'Finished'  
      
if __name__ == "__main__":  
    print fn_1(4)
```