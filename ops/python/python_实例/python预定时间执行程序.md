```python
import sys
import datetime as dt
from threading import Timer

new_time = sys.argv[1]

def my_job():
    print('test')

nextTime = dt.datetime.now()
# nextTime = dt.datetime.now() + dt.timedelta(days=1)   #根据当前时间加一天或减一天
dateString = nextTime.strftime('%d-%m-%Y') + " %s" % new_time
# dateString = nextDay.strftime('%d-%m-%Y') + " 09-57-00"
newTime = nextTime.strptime(dateString,'%d-%m-%Y %H-%M-%S')
delay = (newTime - dt.datetime.now()).total_seconds()
Timer(delay,my_job,()).start()
```  
 执行
 ```python
#python3 test.py 10-00-00   #当前未过的时间节点
test
```