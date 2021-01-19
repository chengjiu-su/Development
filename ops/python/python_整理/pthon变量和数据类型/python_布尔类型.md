前面我们了解到，布尔类型是Python的基础数据类型，布尔类型只有True和False两种值，本节课我们学习布尔类型的集中运算。

与运算
只有两个布尔值都为 True 时，计算结果才为 True。
```python
True and True # ==> True
True and False # ==> False
False and True # ==> False
False and False # ==> False
```
或运算
只要有一个布尔值为 True，计算结果就是 True。
```python
True or True # ==> True
True or False # ==> True
False or True # ==> True
False or False # ==> False
```
非运算
把True变为False，或者把False变为True：
```python
not True # ==> False
not False # ==> True
```
这些运算有什么用呢？计算机程序是由无数的逻辑分支组成的，通过布尔运算，可以在计算机中实现条件判断，根据计算结果为True或者False，计算机可以自动执行不同的后续代码，因此学习布尔运算也是非常有必要的。

在Python中，布尔类型还可以与其他数据类型（字符串，数字等）做 and、or和not运算，请看下面的代码：
```python
a = True
print(a and 0 or 99) # ==> 99
```
得到的计算结果不是布尔类型，而是数字99，这是为什么呢？

>因为Python把0、空字符串和None看成False，其他数值和非空字符串都看成True，所以：
True and 0计算结果是0 
继续计算0 or 99计算结果是 99 
因此，结果是99。
需要注意的是，not计算的优先级是高于and和or的。

>True and not False # ==> True
在上述布尔计算中，先计算not False = True，然后再计算True and True，因此得到True的结果。

>短路计算
在计算a and b时，如果 a 是 False，则根据与运算法则，整个结果必定为 False，因此返回 a；如果 a 是 True，则整个计算结果必定取决与 b，因此返回 b。
在计算a or b时，如果 a 是 True，则根据或运算法则，整个计算结果必定为 True，因此返回 a；如果 a 是 False，则整个计算结果必定取决于 b，因此返回 b。
所以Python解释器在做布尔运算时，只要能提前确定计算结果，它就不会往后算了，直接返回结果。