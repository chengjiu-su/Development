在上一节课中，我们在函数里面使用return返回了计算的结果，在外部调用这个函数的时候，就可以接收到结果。
有时候函数是没有返回结果的，这个时候从函数获取到的是一个空值None。
我们对list_sum()这个函数进行简单的修改，在函数内把结果打印出来，不通过return返回结果。
```python
def list_sum(l):
    result = 0
    for num in l:
        result = result + num
    print('result is {}'.format(result))  # ==> result is 36
    return

l = [1, 3, 5, 7, 9, 11]
result =list_sum(l) # 调用定义的sum_list函数并获得return返回的结果
print(result) # ==> None
```
在print(result)中，我们得到None的结果，这是合理的，因为在函数内部，我们把结果打印出来了，但是没有把结果返回。
除了返回None、一个值以外，函数也可以返回多个值，在函数中，如果需要返回多个值，多个值之间使用逗号分隔即可，但是需要注意顺序。
比如，定义一个函数data_of_square，接收边长一个参数，同时返回正方形的周长和面积。
```python
def data_of_square(side):
    C = 4 * side
    S = side * side
    return C, S

C, S = data_of_square(16)
print('周长 = {}'.format(C)) # ==> 周长 = 64
print('面积 = {}'.format(S)) # ==> 面积 = 256
```
也可以使用一个值存储函数返回的多值结果。
```python
result = data_of_square(16)
print(result) # ==> (64, 256)
```
注意打印的result，其实它是tuple类型，如果我们需要取出结果中的周长或者面积，使用对应位置的下标就可以获得对应的结果。
```python
result = data_of_square(16)
C = result[0]
S = result[1]
print('周长 = {}'.format(C)) # ==> 周长 = 64
print('面积 = {}'.format(S)) # ==> 面积 = 256
```