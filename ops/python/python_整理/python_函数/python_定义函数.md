除了使用Python内置的函数以外，在编程过程中，我们也经常需要自己定义函数。
在Python中，定义一个函数要使用 def 语句，依次写出函数名、括号()、括号中的参数和冒号:，然后，在缩进块中编写函数体，函数的返回值用 return 语句返回。
我们以定义一个求绝对值的函数my_abs函数为例：
```python
def my_abs(x):
    if x >= 0:
        return x
    else:
        return -x
```
请注意，return表示返回的意思，函数体内部的语句在执行时，一旦执行到return时，函数就执行完毕，并将结果返回。因此，函数内部通过条件判断和循环可以实现非常复杂的逻辑。
我们继续定义一个求列表list所有元素的和的函数：
```python
def list_sum(L):
    result = 0
    for num in L:
        result = result + num
    return result
```
这样子我们就定义了一个sum_list()的函数，注意，在最后return，我们把求和的结果result返回了，这样就可以在外部调用函数后获得result。
```python
L = [1, 3, 5, 7, 9, 11]
result =list_sum(L) # 调用定义的sum_list函数并获得return返回的结果
print(result)
```