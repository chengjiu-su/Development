```python
def test():
	print('test')

# 指定 60s执行一次函数操作
WAIT_TIME_SECONDS = 60
ticker = threading.Event()
while not ticker.wait(WAIT_TIME_SECONDS):
    test()
```
执行
```python
python3 test.py 
# 程序每60秒打印
test
```
[[python预定时间执行程序]]