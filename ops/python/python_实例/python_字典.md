字典一种key - value 的数据类型，使用就像我们上学用的字典，通过笔划、字母来查对应页的详细内容。
语法:
```python
info = {
    'stu1101': "TengLan Wu",
    'stu1102': "LongZe Luola",
    'stu1103': "XiaoZe Maliya",
}
```
字典的特性：
dict是无序的
key必须是唯一的,so 天生去重
增加
```python
>>> info["stu1104"] = "苍井空"
>>> info
{'stu1102': 'LongZe Luola', 'stu1104': '苍井空', 'stu1103': 'XiaoZe Maliya', 'stu1101': 'TengLan Wu'}
```
修改
```python
>>> info['stu1101'] = "武藤兰"
>>> info
{'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya', 'stu1101': '武藤兰'}
```
删除
```python
>>> info
{'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya', 'stu1101': '武藤兰'}
>>> info.pop("stu1101") #标准删除姿势
'武藤兰'
>>> info
{'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya'}
>>> del info['stu1103'] #换个姿势删除
>>> info
{'stu1102': 'LongZe Luola'}
>>> 
>>> 
>>> 
>>> info = {'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya'}
>>> info
{'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya'} #随机删除
>>> info.popitem()
('stu1102', 'LongZe Luola')
>>> info
{'stu1103': 'XiaoZe Maliya'}
```
查找
```python
>>> info = {'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya'}
>>> 
>>> "stu1102" in info #标准用法
True
>>> info.get("stu1102")  #获取
'LongZe Luola'
>>> info["stu1102"] #同上，但是看下面
'LongZe Luola'
>>> info["stu1105"]  #如果一个key不存在，就报错，get不会，不存在只返回None
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'stu1105'
```
多级字典嵌套及操作
```python
av_catalog = {
    "欧美":{
        "www.youporn.com": ["很多免费的,世界最大的","质量一般"],
        "www.pornhub.com": ["很多免费的,也很大","质量比yourporn高点"],
        "letmedothistoyou.com": ["多是自拍,高质量图片很多","资源不多,更新慢"],
        "x-art.com":["质量很高,真的很高","全部收费,屌比请绕过"]
    },
    "日韩":{
        "tokyo-hot":["质量怎样不清楚,个人已经不喜欢日韩范了","听说是收费的"]
    },
    "大陆":{
        "1024":["全部免费,真好,好人一生平安","服务器在国外,慢"]
    }
}

av_catalog["大陆"]["1024"][1] += ",可以用爬虫爬下来"
print(av_catalog["大陆"]["1024"])
#ouput 
['全部免费,真好,好人一生平安', '服务器在国外,慢,可以用爬虫爬下来']
```
其它姿势

#values
```python
>>> info.values()
dict_values(['LongZe Luola', 'XiaoZe Maliya'])
```
#keys
```python
>>> info.keys()
dict_keys(['stu1102', 'stu1103'])
```
#setdefault
```python
>>> info.setdefault("stu1106","Alex")
'Alex'
>>> info
{'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya', 'stu1106': 'Alex'}
>>> info.setdefault("stu1102","龙泽萝拉")
'LongZe Luola'
>>> info
{'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya', 'stu1106': 'Alex'}
```
#update 
```python
>>> info
{'stu1102': 'LongZe Luola', 'stu1103': 'XiaoZe Maliya', 'stu1106': 'Alex'}
>>> b = {1:2,3:4, "stu1102":"龙泽萝拉"}
>>> info.update(b)
>>> info
{'stu1102': '龙泽萝拉', 1: 2, 3: 4, 'stu1103': 'XiaoZe Maliya', 'stu1106': 'Alex'}
```
#items
```python
print(info.items())
dict_items([('stu1102', '龙泽萝拉'), (1, 2), (3, 4), ('stu1103', 'XiaoZe Maliya'), ('stu1106', 'Alex')])
````
#通过一个列表生成默认dict,有个没办法解释的坑，少用吧这个
```python
>>> dict.fromkeys([1,2,3],'testd')
{1: 'testd', 2: 'testd', 3: 'testd'}
```
循环dict 
#方法1      
```python
for key in info:             #推荐
    print(key,info[key])
```
#方法2
```python
for k,v in info.items(): #会先把dict转成list,数据大时莫用
    print(k,v)
```