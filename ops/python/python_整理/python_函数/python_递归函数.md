>在函数内部，还可以调用其他函数，比如实现函数data_of_square的时候，它接收边长一个参数，同时返回正方形的周长和面积，而求周长和求面积是完全独立的逻辑，可以定义成两个新的函数，然后在data_of_square函数中再调用这两个函数，得到结果并返回。
```python
def square_area(side):
    return side * side

def square_perimeter(side):
    return 4 * side

def data_of_square(side):
    C = square_perimeter(side)
    S = square_area(side)
    return C, S
```
在函数内部调用其他函数，是非常常见的，通过合理拆分逻辑，可以降低程序的复杂度。如果在一个函数内部调用其自身，这个函数就是递归函数。
举个例子，我们来计算阶乘 n! = 1 * 2 * 3 * ... * n，用函数 fact(n)表示，可以看出：
```python
fact(n) = n! = 1 * 2 * 3 * ... * (n-1) * n = (n-1)! * n = fact(n-1) * n
```
所以，fact(n)可以表示为 n * fact(n-1)，只有n=1时需要特殊处理。
于是，fact(n)用递归的方式写出来就是：
```python
def fact(n):
    if n==1:
        return 1
    return n * fact(n - 1)
```
这个fact(n)就是递归函数，可以试试计算得到的结果。
```python
fact(1) # ==> 1
fact(5) # ==> 120
```
我们可以拆解fact(5)计算的详细逻辑
```python
===> fact(5)
===> 5 * fact(4)
===> 5 * (4 * fact(3))
===> 5 * (4 * (3 * fact(2)))
===> 5 * (4 * (3 * (2 * fact(1))))
===> 5 * (4 * (3 * (2 * 1)))
===> 5 * (4 * (3 * 2))
===> 5 * (4 * 6)
===> 5 * 24
===> 120
```
>递归函数的优点是定义简单，逻辑清晰。理论上，所有的递归函数都可以写成循环的方式，但循环的逻辑不如递归清晰。
使用递归函数需要注意防止栈溢出。在计算机中，函数调用是通过栈（stack）这种数据结构实现的，每当进入一个函数调用，栈就会加一层栈帧，每当函数返回，栈就会减一层栈帧。由于栈的大小不是无限的，所以，递归调用的次数过多，会导致栈溢出。可以试试计算 fact(10000)。
```python
Traceback (most recent call last):
RecursionError: maximum recursion depth exceeded in comparison
```