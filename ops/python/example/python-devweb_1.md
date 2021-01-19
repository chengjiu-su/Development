关于运维的模块：

- pstuil：获取系统进程、系统资源的状态

```python
[root@localhost day01]# pip3 install psutil
>>> import psutil
>>> for i in range(5):
...   psutil.cpu_percent(interval=1)  # 每隔1秒取cpu利用率
>>> for i in range(5):
...   psutil.cpu_percent(interval=1, percpu=True)
>>> m = psutil.virtual_memory()
>>> m.total  # 总内存
>>> psutil.disk_partitions()  # 分区使用情况
>>> d = psutil.disk_partitions()
>>> d[0]
>>> psutil.sensors_temperatures()   # cpu温度
>>> psutil.sensors_fans()   # 风扇转速
>>> psutil.sensors_battery()  # 电池信息
>>> time.ctime(psutil.boot_time())  # 系统启动时间
```

- libvirt-python：管理kvm虚拟机

## web开发

前端：靠近用户的一端，称为前端。html / css / javascript(js)

后端：靠近服务器的一端，称为后端。python / php / java

html：超文本标记语言。使用标记来表达相应的含义，它不是可见即可得的方式。

## 标签

- 标签，也叫标记、元素
- 有双标记，也有单标记
- 浏览器是宽容的，它总是尽最大努力将数据显示出来，即使有错误，它也不报错。
- 标签可以嵌套
- 标签有块级和行内之分
  - 块级：不管内容多少，必须至少占一行。h1/h2/h3/h4/h5/h6/p/div/ul
  - 行内：不占一行，与其他元素共享一行。
- 注释：\<!-- -->

## css

- 层叠样式表，也叫级联样式表
- 分类：
  - 内联：和属性一样，将样式直接应用在元素上
  - 内部：将样式统一声明到head标签中
  - 外部：使用单独的样式表文件





