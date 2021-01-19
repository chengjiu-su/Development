使用continue，我们可以控制循环继续下去，并跳过continue后面的逻辑，比如，对于字符串s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'，假如希望输出字符串s中第10个以后的字符，而不是所有字符，这个时候， 我们可以使用continue跳过前面的9个字符。
```python
s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
num = 1
for ch in s:
    if num < 10:
        num = num + 1
        continue # 当num < 10时，跳过后续循环代码，继续下一次循环
    print(ch)
    num = num + 1
```