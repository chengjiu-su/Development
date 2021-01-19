和 for 循环不同的另一种循环是 while 循环，while循环可以继续进行下去的条件更加简单，只需要判断while循环的条件是否为True即可，当条件为True时，即继续运行下去。
比如：
```python
while True:
    print(1)
```
在上述代码中，由于while的条件一直为True，所以这个代码将会无限的输出1，同学们不要轻易尝试。
我们可以把while循环的条件设置得复杂一些，在运行一定次数后，条件可以自动变为False从而跳出while循环。
比如计算1~100的和。
```python
num = 1
sum = 0
while num <= 100:
    sum = sum + num # 注意缩进
    num = num + 1 # 注意缩进
print(sum) # ==> 5050
```
在上述代码中，while的判断条件是num <= 100，当num小于或者等于100时，循环会继续下去，但当num > 100时，将跳出循环；因为在while循环里面num不断加1，所以num最终会大于100，因此while循环不会无限进行下去。