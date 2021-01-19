## 制作添加主机页

```python
# templates/add_hosts.html
{% extends 'basic.html' %}
{% load static %}
{% block title %}添加主机{% endblock %}
{% block content %}
    <div class="row h4">
        {% comment %}表单的action值为空，表示提交数据时提交给当前url{% endcomment %}
        <form action="" method="post" class="form-inline">
            {% csrf_token %}
            <div class="form-group">
                <label>主机组：</label>
                <input class="form-control" type="text" name="group">
            </div>
            <div class="form-group">
                <label>主机：</label>
                <input class="form-control" type="text" name="host">
            </div>
            <div class="form-group">
                <label>IP：</label>
                <input class="form-control" type="text" name="ip">
            </div>
            <div class="form-group">
                <input class="btn btn-primary" type="submit" value="提 交">
            </div>
        </form>
        <hr>
        <table class="table table-bordered table-hover table-striped">
            <thead class="bg-primary">
                <tr>
                    <td>主机组</td>
                    <td>主机</td>
                </tr>
            </thead>
            <tbody>
                {% for group in groups %}
                    <tr>
                        <td>{{ group.groupname }}</td>
                        <td>
                            <ul class="list-unstyled">
                                {% for host in group.host_set.all %}
                                    <li>{{ host.hostname }}:{{ host.ip }}</li>
                                {% endfor %}
                            </ul>
                        </td>
                    </tr>
                {% endfor %}
            </tbody>
        </table>
    </div>
{% endblock %}

# 修改视图函数
# webadmin/views.py
... ...
def add_hosts(request):
    if request.method == 'POST':
        groupname = request.POST.get('group').strip()  # 去除额外的空白字符
        hostname = request.POST.get('host').strip()
        ip = request.POST.get('ip').strip()
        if groupname:   # 如果提交的组名非空
            g = HostGroup.objects.get_or_create(groupname=groupname)[0]
            if hostname and ip:  # 如果提交的主机名和ip都非空
                g.host_set.get_or_create(hostname=hostname, ip=ip)

    groups = HostGroup.objects.all()  # 取出全部组
    return render(request, 'add_hosts.html', {'groups': groups})
... ...
```

## 制作添加模块页

```python
# webadmin/urls.py
... ...
    url(r'^add_modules/$', views.add_modules, name='add_modules'),
... ...

# webadmin/views.py
def add_modules(request):
    if request.method == 'POST':
        modulename = request.POST.get('module').strip()
        args = request.POST.get('param').strip()
        if modulename:
            m = Module.objects.get_or_create(modulename=modulename)[0]
            if args:
                m.argument_set.get_or_create(arg_text=args)
            
    modules = Module.objects.all()
    return render(request, 'add_modules.html', {'modules': modules})

# templates/add_modules.html
{% extends 'basic.html' %}
{% load static %}
{% block title %}添加模块{% endblock %}
{% block content %}
    <div class="row h4">
        {% comment %}表单的action值为空，表示提交数据时提交给当前url{% endcomment %}
        <form action="" method="post" class="form-inline">
            {% csrf_token %}
            <div class="form-group">
                <label>模块：</label>
                <input class="form-control" type="text" name="module">
            </div>
            <div class="form-group">
                <label>参数：</label>
                <input class="form-control" type="text" name="param">
            </div>
            <div class="form-group">
                <input class="btn btn-primary" type="submit" value="提 交">
            </div>
        </form>
        <hr>
        <table class="table table-bordered table-hover table-striped">
            <thead class="bg-primary">
                <tr>
                    <td>模块</td>
                    <td>参数</td>
                </tr>
            </thead>
            <tbody>
                {% for mod in modules %}
                    <tr>
                        <td>{{ mod.modulename }}</td>
                        <td>
                            <ul class="list-unstyled">
                                {% for arg in mod.argument_set.all %}
                                    <li>{{ arg.arg_text }}</li>
                                {% endfor %}
                            </ul>
                        </td>
                    </tr>
                {% endfor %}
            </tbody>
        </table>
    </div>
{% endblock %}

# templates/index.html
<a href="{% url 'add_modules' %}" target="_blank">
    <img src="{% static 'imgs/linux.jpg' %}" width="150px"><br>
    添加模块
</a>
```

## 制作执行任务页面

```python
# webadmin/urls.py
... ...
    url(r'^tasks/$', views.tasks, name='tasks'),
... ...

# webadmin/views.py
def tasks(request):
    if request.method == 'POST':
        ip = request.POST.get('host')
        group = request.POST.get('group')
        module = request.POST.get('module')
        args = request.POST.get('param')
        # 确定在主机上，还是在组上执行任务，在谁上面执行任务，就把它赋值给目标dest
        if ip:   # 如果ip非空
            dest = ip
        elif group:
            dest = group
        else:
            dest = None

        if dest:  # None为假，如果dest的值是ip或group，则为真。为真就开始在目标执行任务
            adhoc(['ansible_cfg/dhosts.py'], dest, module, args)


    groups = HostGroup.objects.all()
    hosts = Host.objects.all()
    modules = Module.objects.all()
    data = {'groups': groups, 'hosts': hosts, 'modules': modules}
    return render(request, 'tasks.html', data)

# templates/tasks.html
{% extends 'basic.html' %}
{% load static %}
{% block title %}执行任务{% endblock %}
{% block content %}
    <div class="row h4">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#server" data-toggle="tab">主机</a></li>
            <li><a href="#servergroup" data-toggle="tab">主机组</a></li>
        </ul>
        <form action="" method="post">
            {% csrf_token %}
            <div class="tab-content" style="margin: 10px 0">
                <div class="tab-pane active fade in" id="server">
                    <select class="form-control" name="host">
                        <option value="">无</option>
                        {% for host in hosts %}
                            <option value="{{ host.ip }}">{{ host.hostname }}:{{ host.ip }}</option>
                        {% endfor %}
                    </select>
                </div>
                <div class="tab-pane fade" id="servergroup">
                    <select class="form-control" name="group">
                        <option value="">无</option>
                        {% for group in groups %}
                            <option value="{{ group.groupname }}">{{ group.groupname }}</option>
                        {% endfor %}
                    </select>
                </div>
            </div>
            <table class="table table-bordered table-hover table-striped">
                <thead class="bg-primary">
                    <tr>
                        <td>模块</td>
                        <td>参数</td>
                    </tr>
                </thead>
                <tbody>
                    {% for mod in modules %}
                        <tr>
                            <td>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="module" value="{{ mod.modulename }}">
                                        {{ mod.modulename }}
                                    </label>
                                </div>
                            </td>
                            <td>
                                <ul class="list-unstyled">
                                    {% for arg in mod.argument_set.all %}
                                        <li>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="param" value="{{ arg.arg_text }}">
                                                    {{ arg.arg_text }}
                                                </label>
                                            </div>
                                        </li>
                                    {% endfor %}
                                </ul>
                            </td>
                        </tr>
                    {% endfor %}
                </tbody>
            </table>
            <div class="form-group text-center">
                <input class="btn btn-primary" type="submit" value="执 行">
                <input class="btn btn-primary" type="reset" value="重 置">
            </div>
        </form>
    </div>
{% endblock %}
```

## 实现删除参数功能

思路：

- 删除参数，需要通过执行函数实现
- 调用函数，可以通过访问url来实现

```python
# webadmin/urls.py
... ...
    url(r'^del/(\d+)/$', views.del_arg, name='del_arg'),
... ...

# webadmin/views.py
from django.shortcuts import render, redirect
from webadmin.models import HostGroup, Module, Host, Argument

def del_arg(request, arg_id):
    arg = Argument.objects.get(id=arg_id)
    arg.delete()
    return redirect('add_modules')

# templates/add_modules.html
<ul class="list-unstyled">
{% for arg in mod.argument_set.all %}
    <li>
        {{ arg.arg_text }}
        <a class="btn btn-primary btn-xs" href="{% url 'del_arg' arg.id %}">delete</a>
    </li>
    {% endfor %}
</ul>
```

