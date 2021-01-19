- continue语句，结束本次循环，但是不终结循环
- 循环一旦遇到continue语句，将不再执行continue后面的代码，而回到判断条件处，如果条件为真，则继续循环
```python
for i in range(1,10):
    if i < 5:
        print("loop",i)
    else:
        continue
        print("Hello World")    #continue后，所有代码不执行，即循环跳过此处
    print("i < 5")  #此行代码因缩进即不为continue后的代码，即循环
```