import json


data_json = "/home/chengjiu_su/PycharmProjects/test/data.json"
data = json.loads(open(data_json).read())
# data = json.load(file)
print(data)
i = 0
for i in data:
    print(i['group'],i['server'], i['server_name'], i['time'])
    for key in i:
        print(key)

