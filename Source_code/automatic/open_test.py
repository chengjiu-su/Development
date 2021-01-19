import json
import time
import threading
import datetime
import requests
import subprocess
import sys

LOGFILE = open('/home/chengjiu_su/PycharmProjects/test/script.log', 'w')
# 脚本的标准输出和标准错误输出都打印到日志文件里
sys.stdout = LOGFILE
sys.stderr = LOGFILE

def dingmessage(*msg):
# 请求的URL，WebHook地址
    webhook = "https://oapi.dingtalk.com/robot/send?access_token=17b4ae0d97d65c72b7dc12d93f53fc1b9d93c6a48cd8593425b97e33a8718439"
#构建请求头部
    header = {
        "Content-Type": "application/json",
        "Charset": "UTF-8"
}
#构建请求数据
    tex = msg
    message ={

        "msgtype": "text",
        "text": {
            "content": tex
        },
    }
#对请求的数据进行json封装
    message_json = json.dumps(message)
#发送请求
    info = requests.post(url=webhook,data=message_json,headers=header)
#打印返回的结果
    print(info.text)


def time_task():
    print(time.ctime())
    time_stamp = datetime.datetime.now()
    print("now==-------------==now")
    print(time_stamp.strftime('%Y-%m-%d %H:%M:%S'))
    now_time = time_stamp.strftime('%Y-%m-%d %H:%M:%S')
    data_json = "/home/chengjiu_su/PycharmProjects/test/data.json"
    data = json.loads(open(data_json).read())
    # 根据json文件设定开服顺序执行
    time1 = data[0]["time"]
    server_name1 = data[0]["server_name"]
    group1 = data[0]["group"]
    server1 = data[0]["server"]

    time2 = data[1]["time"]
    server_name2 = data[1]["server_name"]
    group2 = data[1]["group"]
    server2 = data[1]["server"]

    time3 = data[2]["time"]
    server_name3 = data[2]["server_name"]
    group3 = data[2]["group"]
    server3 = data[2]["server"]

    time4 = data[3]["time"]
    server_name4 = data[3]["server_name"]
    group4 = data[3]["group"]
    server4 = data[3]["server"]

    time5 = data[4]["time"]
    server_name5 = data[4]["server_name"]
    group5 = data[4]["group"]
    server5 = data[4]["group"]

    if __name__ == '__main__':
        if time1 == now_time:
            # command = 'curl "http://backend.popcornie.com/api/sg/ops/mv_group?serverId=4001&targetGroupId=5"'.format(serverId=server1,
            #                                                                                                           groupId=group1)
            # command2 = 'curl "http://backend.popcornie.com/api/sg/ops/save"'
            command = 'ls /home/chengjiu_su'
            command2 = 'cd'
            exit_code = subprocess.call(command, shell=True)
            if exit_code != 0:
                print("修改group失败,请确认server和group选择正常")
            else:
                print("修改group成功,服务已对外")
            subprocess.call(command2, shell=True)
            dingmessage('test:%s 对外_开服' % server_name1)
        elif time2 == now_time:
            # command = 'curl "http://backend.popcornie.com/api/sg/ops/mv_group?serverId=4001&targetGroupId=5"'.format(serverId=server2,
            #                                                                                                          groupId=group2)
            # command2 = 'curl "http://backend.popcornie.com/api/sg/ops/save"'
            command = 'ls /home/chengjiu_su'
            command2 = 'cd'
            exit_code = subprocess.call(command, shell=True)
            if exit_code != 0:
                print("修改group失败,请确认server和group选择正常")
            else:
                print("修改group成功,服务已对外")
            subprocess.call(command2, shell=True)
            dingmessage('test:%s 对外_开服' % server_name2)
        elif time3 == now_time:
            # command = 'curl "http://backend.popcornie.com/api/sg/ops/mv_group?serverId=4001&targetGroupId=5"'.format(serverId=server3,
            #                                                                                                          groupId=group3)
            # command2 = 'curl "http://backend.popcornie.com/api/sg/ops/save"'
            command = 'ls /home/chengjiu_su'
            command2 = 'cd'
            exit_code = subprocess.call(command, shell=True)
            if exit_code != 0:
                print("修改group失败,请确认server和group选择正常")
            else:
                print("修改group成功,服务已对外")
            subprocess.call(command2, shell=True)
            dingmessage('test:%s 对外_开服' % server_name3)
        elif time4 == now_time:
            # command = 'curl "http://backend.popcornie.com/api/sg/ops/mv_group?serverId=4001&targetGroupId=5"'.format(serverId=server4,
            #                                                                                                          groupId=group4)
            # command2 = 'curl "http://backend.popcornie.com/api/sg/ops/save"'
            command = 'ls /home/chengjiu_su'
            command2 = 'cd'
            exit_code = subprocess.call(command, shell=True)
            if exit_code != 0:
                print("修改group失败,请确认server和group选择正常")
            else:
                print("修改group成功,服务已对外")
            subprocess.call(command2, shell=True)
            dingmessage('test:%s 对外_开服' % server_name4)

        elif time5 == now_time:
            # command = 'curl "http://backend.popcornie.com/api/sg/ops/mv_group?serverId=4001&targetGroupId=5"'.format(serverId=server5,
            #                                                                                                          groupId=group5)
            # command2 = 'curl "http://backend.popcornie.com/api/sg/ops/save"'
            command = 'ls /home/chengjiu_su'
            command2 = 'cd'
            exit_code = subprocess.call(command, shell=True)
            if exit_code != 0:
                print("修改group失败,请确认server和group选择正常")
            else:
                print("修改group成功,服务已对外")
            subprocess.call(command2, shell=True)
            dingmessage('test:%s 对外_开服' % server_name5)
WAIT_TIME_SECONDS = 1

ticker = threading.Event()
while not ticker.wait(WAIT_TIME_SECONDS):
    time_task()

LOGFILE.close()
