```python
#!/usr/bin/python3
age_of_su = 21    #设置定值
count = 0         #将默认赋值为0
while count < 3:  #循环3次
    guess_age = int(input("guess age: "))
    if guess_age == age_of_su:
        print("yes, you got it")
        break
    elif guess_age < age_of_su:
        print("think smaller..")
    else:
        print("think bigger..")
    count += 1
    if count == 3:       #循环3次后，可选择是否继续，输入字符非‘n’则继续循环3次后可再次选择是否继续循环
        continue_confirm = input("do you want to keep coontinue..?")
        if continue_confirm != 'n': #输入字符非 'n' 则将默认值赋为0值
            count = 0
```