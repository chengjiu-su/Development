import sys
import json
import time
import datetime as dt
from threading import Timer
import threading

new_time = (time.strftime("%H-%M-%S"))
# new_time = (time.strftime("%S-%M-%H"))


def my_job():
    print('')

def time_task():
    print(time.ctime())
    nextDay = dt.datetime.now()
    # for nextDay in NextDay:
    # nextDay = dt.datetime.now() + dt.timedelta(days=1)   #根据当前时间加一天或减一天
    dateString = nextDay.strftime('%d-%m-%Y') + " %s" % new_time
    newDate = nextDay.strptime(dateString,'%d-%m-%Y %H-%M-%S')
    delay = (newDate - dt.datetime.now()).total_seconds()
    Timer(delay,my_job,()).start()
    print("now------------")
    print(newDate)
    ta_json = "/data/java/data.json"
    data_json = "/home/chengjiu_su/PycharmProjects/test/data.json"
    data = json.loads(open(data_json).read())
    time1 = data[0]["time"]
    server_name= data[0]["server_name"]
    time2 = data[1]["time"]
    # print(time1)
    # print(time2)
    # print(server_name)
    if time1 == newDate:
        print(server_name)

WAIT_TIME_SECONDS = 1

ticker = threading.Event()
while not ticker.wait(WAIT_TIME_SECONDS):
    time_task()