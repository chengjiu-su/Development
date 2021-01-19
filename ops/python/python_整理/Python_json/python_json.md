```python
import json
import sys,re

if len(sys.argv) != 3:
    print("用法: python3 timemodify.py 60003 2020-12-02 00:00:00")
    sys.exit(0)
def datetime_verify(date):
    """判断是否是一个有效的日期字符串"""
    if re.match(r"20\d\d-(0\d|1[0-2])-([0-2]\d|3\d) ([0-1]\d|2[0-3])(:([0-5]\d)){2}", date) == None:   #严格控制格式输出,精确到位；
#    if re.match(r"(\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}:\d{2,2})", date) == None:
#    if re.match(r"(\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2})", date) == None:  # 精简
        print(
            "参数错误,请以python3 timemodify.py 60003 '2020-12-02 00:00:00'  格式进行传参"
        )
        sys.exit()

config_file="group_servers.json"

with open(config_file, 'r', encoding='utf-8') as contents:
    json_data = json.load(contents)     #转换json文本,json解码
index = 0
for group in json_data[0]['groups']:       #for循环文本groups段
    #输出更改前的文本内容
    if int(sys.argv[1]) == group['id']:    #参数对比groups段id
        print("===================before==================")
        print(group['openTime'])
        datetime_verify(sys.argv[2])            #参数判断
        json_data[0]['groups'][index]['openTime'] = sys.argv[2]  #根据openTime索引进行传参
        with open(config_file,'w',encoding='utf-8') as contents:
            json.dump(json_data,contents,indent=4)             #json编码形式写入
        print("===================after==================")
        with open(config_file, 'r', encoding='utf-8') as contents:
            json_data = json.load(contents)                    # json解码,输出更改后内容
            print(json_data[0]['groups'][index]['openTime'])   #根据openTime索引进行输出
        # print(os.system('cat '+config_file))
index += 1

print("===========================================")

#j son.dump() 和 json.load() 用来编码和解码JSON数据
```