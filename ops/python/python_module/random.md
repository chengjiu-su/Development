随机数
```python
import random

random.random()           # 0 - 1 随机数
print(random.random())
print(random.randint(1,2))  # 1 - 2 随机数
print(random.randrange(1,10))  # 顾头不顾尾 1 - 9 随机数
print(random.choice('hello'))  # 可从列表 元组 字符串随机取值
print(random.sample('hello', 2))  # 随机取两个值
# 洗牌
item = [1, 2, 3, 4, 5]
random.shuffle(item)  # 将有序的列表打乱
print(item)
```
生成随机验证码
```python
import random

checkcode = ''

for i in range(4):
    current = random.randrange(0,9)
    #整个for循环验证：
    #猜测循环值 i = 0  current = 0 即获取一个随机大写字母
    if current == i:
        temp = chr(random.randint(65, 90))    # 65 - 90 的ascll码是英文字母大写
    else:
        temp = random.randint(0, 9)
    checkcode += str(temp)

print(checkcode)
```