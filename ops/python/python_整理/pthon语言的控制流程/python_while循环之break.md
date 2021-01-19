用 for 循环或者 while 循环时，如果要在循环体内直接退出循环，可以使用 break 语句。
比如在前面的无限循环里面，只要在恰当的时机，我们使用break跳出循环，也可以求出1~100的和。
```python
num = 1
sum = 0
while True:
    if num > 100:
        break
    sum = sum + num
    num = num + 1
print(sum)
```
同样的，对于字符串s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'，假如希望输出s的前20个字符，而不是所有字符，我们也可以使用break。
```python
s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
num = 1
for ch in s:
    if num > 20:
        break
    print(ch)
    num = num + 1
```
请综合使用while True和break，计算0~1000以内，所有偶数的和。
```python
num = 0
sum = 0
while True:
    if num > 1000:
        break
    if num % 2 == 0:
        sum = sum + num
    num = num + 1
print(sum)
```