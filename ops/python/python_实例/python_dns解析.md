##### dns解析域名 
```python
import dns.resolver
from collections import defaultdict

hosts = ['baidu.com','weibo.com']
s = defaultdict(list)
def query(hosts):
    for host in hosts:
        ip = dns.resolver.query(host,"A")
        for i in ip:
            s[host].append(i)

    return s

for i in query(hosts):

    print(i,s[i])
```
执行结果
```python
/home/chengjiu_su/PycharmProjects/automatic/venv/bin/python /home/chengjiu_su/PycharmProjects/automatic/test1.py
baidu.com [<DNS IN A rdata: 220.181.38.148>, <DNS IN A rdata: 39.156.69.79>]
weibo.com [<DNS IN A rdata: 180.149.139.248>, <DNS IN A rdata: 180.149.153.187>, <DNS IN A rdata: 49.7.40.131>, <DNS IN A rdata: 49.7.40.133>]

Process finished with exit code 0
```