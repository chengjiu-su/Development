import json
import requests
import sys


def send_msg(url,  msg):
    headers = {'Content-Type': 'application/json;charset=utf-8'}
    data = {
        "msgtype": "text",  # 发送消息类型为文本
        "text": {
        #             "at": {
        #     "atMobiles": reminders,
        #     "isAtAll": False,   # 不@所有人
        # },
            "content": msg,   # 消息正文
        }
    }
    r = requests.post(url, data=json.dumps(data), headers=headers)
    return r.text


if __name__ == '__main__':
    msg = "test"
    # reminders = ['19130840283']  # 特殊提醒要查看的人,就是@某人一下
    url = 'https://oapi.dingtalk.com/robot/send?access_token=17b4ae0d97d65c72b7dc12d93f53fc1b9d93c6a48cd8593425b97e33a8718439'
    print(send_msg(url, msg))