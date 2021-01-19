import sys
import json
import datetime as dt
from threading import Timer

new_time = sys.argv[1]

def my_job():
    print('')

nextDay = dt.datetime.now()
# nextDay = dt.datetime.now() + dt.timedelta(days=1)   #根据当前时间加一天或减一天
dateString = nextDay.strftime('%d-%m-%Y') + " %s" % new_time
# dateString = nextDay.strftime('%d-%m-%Y') + " 09-57-00"
newDate = nextDay.strptime(dateString,'%d-%m-%Y %H-%M-%S')
delay = (newDate - dt.datetime.now()).total_seconds()
Timer(delay,my_job,()).start()

with open('/data/java/servers.json', 'r') as file:
    json_data = json.load(file)

for item in json_data:
    if item['time'] in [""]:
        item['time'] = '%s' % newDate

with open('/data/java/servers.json', 'w',encoding='utf-8') as file:
    #ensure_ascii=False 防止中文字符转换为乱码
    json.dump(json_data, file, indent=2, ensure_ascii=False)


#python3 test.py 10-00-00