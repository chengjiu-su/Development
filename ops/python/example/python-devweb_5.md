## ansible+django 运维web化

#### 初始化项目

```python
[root@localhost myansible]# django-admin startapp index
[root@localhost myansible]# django-admin startapp webadmin

# myansible/settings.py
ALLOWED_HOSTS = ['*']
INSTALLED_APPS = [
    ... ...
    'index',
    'webadmin',
]
LANGUAGE_CODE = 'zh-hans'
TIME_ZONE = 'Asia/Shanghai'
USE_TZ = False
# 增加静态文件的位置，是项目根目录下的static
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static"),
]


# 拷贝static目录到项目的根目录

# 授权，将应用url交给应用处理
# myansible/urls.py
from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^webadmin/', include('webadmin.urls')),
    # 注意r''可以匹配任意url，必须是最后一条
    url(r'', include('index.urls')),
]

# 创建index/urls.py和webadmin/urls.py
from django.conf.urls import url

urlpatterns = []

```

http://x.x.x.x/webadmin   -> href="/webadmin/"

http://x.x.x.x/webadmin/add_hosts - > href="/webadmin/add_hosts/"

http://x.x.x.x/add_hosts -> href="/add_hosts/"

## 制作index应用

```python
# index/urls.py
from django.conf.urls import url
from index import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
]

# index/views.py
from django.shortcuts import render

def index(request):
    return render(request, 'index.html')

# 制作模板
# 将前一个项目polls的基础模板basic拷贝到templates/
# templates/index.html
{% extends 'basic.html' %}
{% load static %}
{% block title %}Ansible Webadmin{% endblock %}
{% block content %}
    <div class="row h4">
        <div class="col-sm-3 text-center">
            <a href="#">
                <img src="{% static 'imgs/linux.jpg' %}" width="150px"><br>
                主机信息
            </a>
        </div>
        <div class="col-sm-3 text-center">
            <a href="#">
                <img src="{% static 'imgs/linux.jpg' %}" width="150px"><br>
                添加主机
            </a>
        </div>
        <div class="col-sm-3 text-center">
            <a href="#">
                <img src="{% static 'imgs/linux.jpg' %}" width="150px"><br>
                添加模块
            </a>
        </div>
        <div class="col-sm-3 text-center">
            <a href="#">
                <img src="{% static 'imgs/linux.jpg' %}" width="150px"><br>
                执行任务
            </a>
        </div>
    </div>
{% endblock %}

```

## 制作webadmin应用

#### 制作模型

```python
# webadmin/models.py
from django.db import models

class HostGroup(models.Model):
    groupname = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return "主机组:%s" % self.groupname

class Host(models.Model):
    hostname = models.CharField(max_length=50)
    ip = models.CharField(max_length=15)
    group = models.ForeignKey(HostGroup)

    def __str__(self):
        return "%s:%s=>%s" % (self.hostname, self.ip, self.group)

class Module(models.Model):
    modulename = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return "模块:%s" % self.modulename

class Argument(models.Model):
    arg_text = models.CharField(max_length=100)
    module = models.ForeignKey(Module)

    def __str__(self):
        return "%s=>%s" % (self.arg_text, self.module)


# 生成表
[root@localhost myansible]# python3 manage.py makemigrations
[root@localhost myansible]# python3 manage.py migrate
[root@localhost myansible]# ls
db.sqlite3   -> 它就是数据库
# sqlite数据库是文件型数据库，只能本机使用，一个文件就是一个库
[root@localhost myansible]# sqlite3 db.sqlite3 
sqlite> .help     # 查看帮助
sqlite> .tables   # show tables
sqlite> .schema webadmin_host   # desc webadmin_host

# 创建管理员
[root@localhost myansible]# python3 manage.py createsuperuser
# 将模型注册到后台
# webadmin/admin.py
from django.contrib import admin
from webadmin.models import HostGroup, Host, Module, Argument

for item in [HostGroup, Host, Module, Argument]:
    admin.site.register(item)

# 访问http://x.x.x.x/admin/
```

#### 配置ansible

```python
# 创建ansible的工作环境，在manage.py同级目录下创建工作目录
[root@localhost myansible]# mkdir ansible_cfg
[root@localhost myansible]# cd ansible_cfg/
[root@localhost ansible_cfg]# vim ansible.cfg
[defaults]
inventory = dhosts.py
remote_user = root

# 创建动态主机清单文件。动态主机清单文件是一个脚本，该脚本运行后，必须能生成以下格式：
{
    'dbservers': {
        'hosts': ['1.1.1.1', '1.1.1.2'],
    },
    'webservers': {
        'hosts': ['1.1.1.3', '1.1.1.4']
    }
}
# 分析以上结构
# 首先需要一个字典
>>> result = {}
# 在数据库中取出一个组，该组不在result字典中，则增加一项
>>> result['dbservers'] = {}
>>> result
{'dbservers': {}}
# result['dbservers']是一个字典，向该字典中再加入值
# 可以把result['dbservers']看成一个整体，如名称为a
>>> result['dbservers']['hosts'] = []
>>> result
{'dbservers': {'hosts': []}}
# result['dbservers']['hosts']它是一个列表，可以向列表追加数据
>>> result['dbservers']['hosts']
[]
>>> result['dbservers']['hosts'].append('1.1.1.1')
>>> result['dbservers']['hosts'].append('1.1.1.2')
>>> result
{'dbservers': {'hosts': ['1.1.1.1', '1.1.1.2']}}



[root@localhost ansible_cfg]# touch dhosts.py
[root@localhost ansible_cfg]# chmod +x dhosts.py
[root@localhost ansible_cfg]# vim dhosts.py
#!/usr/local/bin/python3
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

engine = create_engine(
    'sqlite:////root/nsd2019/nsd1909/devweb/ansible_project/myansible/db.sqlite3',
    encoding='utf8',
)
Session = sessionmaker(bind=engine)
Base = declarative_base()

class HostGroup(Base):
    __tablename__ = 'webadmin_hostgroup'
    id = Column(Integer, primary_key=True)
    groupname = Column(String(50), unique=True)

class Host(Base):
    __tablename__ = 'webadmin_host'
    id = Column(Integer, primary_key=True)
    hostname = Column(String(50))
    ip = Column(String(15))
    group_id = Column(ForeignKey('webadmin_hostgroup.id'))

if __name__ == '__main__':
    session = Session()
    qset = session.query(HostGroup.groupname, Host.ip).join(Host)
    # print(qset.all())
    result = {}
    for group, ip in qset:
        if group not in result:
            result[group] = {}
            result[group]['hosts'] = []
        result[group]['hosts'].append(ip)

    print(result)

[root@localhost ansible_cfg]# ansible all -m ping
```

#### 制作webadmin的主机信息页

```python
# webadmin/urls.py
from django.conf.urls import url
from webadmin import views

urlpatterns = [
    url(r'^$', views.index, name='mainpage'),
]

# webadmin/views.py
from django.shortcuts import render

def index(request):
    return render(request, 'mainpage.html')

# 生成mainpage.html
# 注意，mainpage.html运行一次命令生成一次结果。如果需要显示相对实时的主机信息，需要将下面的两条命令写到计划任务中
[root@localhost ansible_cfg]# ansible all -m setup --tree /tmp/dj1909
[root@localhost ansible_cfg]# ansible-cmdb /tmp/dj1909/ > ../templates/mainpage.html

# 修改templates/index.html中的超链接
<a href="{% url 'mainpage' %}" target="_blank">
    <img src="{% static 'imgs/linux.jpg' %}" width="150px"><br>
    主机信息
</a>
```

#### 制作添加主机页

```python
# webadmin/urls.py
from django.conf.urls import url
from webadmin import views

urlpatterns = [
    url(r'^$', views.index, name='mainpage'),
    url(r'^add_hosts/$', views.add_hosts, name='add_hosts'),
]

from django.shortcuts import render
from webadmin.models import HostGroup

def index(request):
    return render(request, 'mainpage.html')

def add_hosts(request):
    groups = HostGroup.objects.all()  # 取出全部组
    return render(request, 'add_hosts.html', {'groups': groups})

# templates/add_hosts.html
{% extends 'basic.html' %}
{% block title %}添加主机{% endblock %}
{% block content %}
{{ groups }}
{% endblock %}

# templates/index.html
<a href="{% url 'add_hosts' %}" target="_blank">
    <img src="{% static 'imgs/linux.jpg' %}" width="150px"><br>
    添加主机
</a>
```

