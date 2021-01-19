## 操作模型

```python
# 进入python shell
[root@localhost mysite]# python3 manage.py shell

# 导入模型
>>> from polls.models import Question, Choice

# 创建问题方法一：直接通过实例化的方式创建
>>> q1 = Question(question_text="你计划到哪个城市工作？", pub_date="2020-3-3 8:00:00")
>>> q1.save()
>>> q1.id
3
>>> q1.question_text
'你计划到哪个城市工作？'
>>> q1.pub_date
'2020-3-3 8:00:00'

# 创建问题方法二：在django中，每个模型都拥有一个名为objects的管理器，通过它，可以实现对模型的增删改查等操作。
# 在数据库中取出实例，如果没有则创建它
>>> r2 = Question.objects.get_or_create(question_text="散伙饭哪吃？", pub_date="2020-3-4")
>>> r2   # 返回值是元组：(实例, True/False)
(<Question: 问题:散伙饭哪吃？>, True)
>>> q2 = r2[0]   # 在元组中取出实例
>>> q2.id
4
>>> q2.question_text
'散伙饭哪吃？'
>>> q2.pub_date
'2020-3-4'

# 创建选项方法一：实例化
>>> c1 = Choice(choice_text="广州", question=q1)
>>> c1.save()
>>> c1.id
5
>>> c1.choice_text
'广州'
>>> c1.votes
0
>>> c1.question
<Question: 问题:你计划到哪个城市工作？>

# 创建选项方法二：通过objects管理器
>>> c2 = Choice.objects.get_or_create(choice_text="石家庄", question=q1)[0]

# 创建选项方法三：问题和选项有主外键约束，一个问题可以对应很多选项。选项的模型叫做Choice，那么每个问题实例都会有一个管理器叫choice_set，通过它，可以对该问题的选项进行增删改查。如果模型叫XuanXiang，那么管理器叫xuanxiang_set。
>>> r3 = q1.choice_set.get_or_create(choice_text="上海")
>>> r3
(<Choice: 问题:你计划到哪个城市工作？:上海>, True)
>>> c3 = r3[0]
>>> c3.choice_text
'上海'
>>> c3.id
7
>>> c3.votes
0


# 查询所有的问题，由问题实例构成列表
>>> Question.objects.all()
>>> for q in Question.objects.all():
...   print(q.question_text, q.pub_date)

# 查询所有的问题，通过时间进行升序排列
>>> for q in Question.objects.order_by('pub_date'):
...   print(q.question_text, q.pub_date)

# 查询所有的问题，通过时间进行降序排列
>>> for q in Question.objects.order_by('-pub_date'):
...   print(q.question_text, q.pub_date)

# get方法必须获取一项数据，0或多项都会报错。返回值是实例
>>> Question.objects.get(id=1)
<Question: 问题:你期望第一份工作的工资是多少？>
>>> Choice.objects.get(votes=0)   # 报错，因为返回值太多了

# filter方法获取0到多项数据。返回值是列表
>>> Question.objects.filter(id=1)
<QuerySet [<Question: 问题:你期望第一份工作的工资是多少？>]>
>>> Question.objects.filter(id=1)[0]
<Question: 问题:你期望第一份工作的工资是多少？>
>>> Choice.objects.filter(votes=0)  # 返回所有0票的选项

# 过滤条件。django在过滤时，将属性都写为双下划线。
>>> Question.objects.get(id=1)  # 实际上是以下的简写
>>> Question.objects.get(id__exact=1)
<Question: 问题:你期望第一份工作的工资是多少？>
# 其他数值大小判断
>>> Question.objects.filter(id__gt=2)   # id > 2
>>> Question.objects.filter(id__gte=2)  # id >= 2
>>> Question.objects.filter(id__lt=2)   # id < 2
>>> Question.objects.filter(id__lte=2)  # id <= 2
>>> Question.objects.filter(pub_date__month=2)  # 2月发布的问题
>>> Question.objects.filter(question_text__startswith="你计划")
# filter支持多项操作
>>> Question.objects.filter(pub_date__month=3).filter(pub_date__day=3)
<QuerySet [<Question: 问题:你计划到哪个城市工作？>]>
# 对filter结果可以进一步排序
>>> Question.objects.filter(pub_date__month=3).order_by('-pub_date')
<QuerySet [<Question: 问题:你计划到哪个城市工作？>, <Question: 问题:你期望第一份工作的月薪是多少？>]>


# 修改问题
# 取出问题内容中包含'工资'的问题
>>> q = Question.objects.get(question_text__contains='工资')
>>> q
<Question: 问题:你期望第一份工作的工资是多少？>
>>> q.question_text="你期望第一份工作的月薪是多少？"
>>> q.save()

# 删除问题
>>> q = Question.objects.get(question_text__contains='散伙饭')
>>> q
<Question: 问题:散伙饭哪吃？>
>>> q.delete()   # 删除时，需要它不包含选项
(1, {'polls.Choice': 0, 'polls.Question': 1})
```

## 制作投票首页

```python
# 取出所有的问题，按时间降序排列，发给前台
# polls/views.py
from django.shortcuts import render
from polls.models import Question

# 用户发来的请求，将会作为第一个参数传给函数，所以需要用一个变量来接收
def index(request):
    questions = Question.objects.order_by('-pub_date')
    # 通过render函数找到名为index.html的模板文件，返回给用户
    return render(request, 'index.html', {'questions': questions})

# 修改首页
# 模板中以{}包围起来的结构是模板语法，比如变量、for循环标签。没有{}包围的就是html语法
# templates/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>投票首页</title>
</head>
<body>
<h1>投票首页</h1>
<ol>
    {% for question in questions %}
        <li>
            <a href="{% url 'detail' question.id %}" target="_blank">
                {{ question.question_text }}
            </a>
            {{ question.pub_date }}
        </li>
    {% endfor %}
</ol>
</body>
</html>
```

### 引入bootstrap

```python
# 把day02/static拷贝到polls目录下。django默认在每个应用下的static目录查找静态内容
# templates/index.html
{% load static %}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>投票首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{% static 'css/bootstrap.min.css' %}">
</head>
<body>
<h1>投票首页</h1>
<ol>
    {% for question in questions %}
        <li>
            <a href="{% url 'detail' question.id %}" target="_blank">
                {{ question.question_text }}
            </a>
            {{ question.pub_date }}
        </li>
    {% endfor %}
</ol>
</body>
</html>
# 重启开发服务器
```

#### 修改index.html

```python
{% load static %}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>投票首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{% static 'css/bootstrap.min.css' %}">
</head>
<body>
<div class="container">
    <div class="row">
        <div id="linux-carousel" class="carousel slide">
        <ol class="carousel-indicators">
            <li class="active" data-target="#linux-carousel" data-slide-to="0"></li>
            <li data-target="#linux-carousel" data-slide-to="1"></li>
            <li data-target="#linux-carousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <a href="http://www.sogou.com" target="_blank">
                    <img src="{% static 'imgs/first.jpg' %}">
                </a>
            </div>
            <div class="item">
                <img src="{% static 'imgs/second.jpg' %}">
            </div>
            <div class="item">
                <img src="{% static 'imgs/third.jpg' %}">
            </div>
        </div>
        <a href="#linux-carousel" data-slide="prev" class="carousel-control left">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a href="#linux-carousel" data-slide="next" class="carousel-control right">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
    </div>
    <div class="row h4">
        <h1 class="text-center text-warning">投票首页</h1>
        <ol>
            {% for question in questions %}
                <li>
                    <a href="{% url 'detail' question.id %}" target="_blank">
                        {{ question.question_text }}
                    </a>
                    {{ question.pub_date }}
                </li>
            {% endfor %}
        </ol>
    </div>
    <div class="row text-center h4">
        达内云计算 <a href="#">NSD1909</a>
    </div>
</div>

<script src="{% static 'js/jquery.min.js' %}"></script>
<script src="{% static 'js/bootstrap.min.js' %}"></script>
<script type="text/javascript">
    $('#linux-carousel').carousel({
        interval : 3000
    });
</script>
</body>
</html>
```

### 模板继承

- 为了使得多个模板文件具有一致的风格，可以使用模板继承
- 将各个页面共性的内容放到基础模板中，在基础模板中，个性内容使用block占位
- 在具体的页面中，继承基础模板，将个性化的内容写到block中

```python
# 将index.html复制成basic.html
[root@localhost mysite]# cp templates/index.html templates/basic.html
# templates/basic.html作为基础模板
{% load static %}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{% block title %}{% endblock %}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{% static 'css/bootstrap.min.css' %}">
</head>
<body>
<div class="container">
    <div class="row">
        <div id="linux-carousel" class="carousel slide">
        <ol class="carousel-indicators">
            <li class="active" data-target="#linux-carousel" data-slide-to="0"></li>
            <li data-target="#linux-carousel" data-slide-to="1"></li>
            <li data-target="#linux-carousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <a href="http://www.sogou.com" target="_blank">
                    <img src="{% static 'imgs/first.jpg' %}">
                </a>
            </div>
            <div class="item">
                <img src="{% static 'imgs/second.jpg' %}">
            </div>
            <div class="item">
                <img src="{% static 'imgs/third.jpg' %}">
            </div>
        </div>
        <a href="#linux-carousel" data-slide="prev" class="carousel-control left">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a href="#linux-carousel" data-slide="next" class="carousel-control right">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
    </div>
    {% block content %}{% endblock %}
    <div class="row text-center h4">
        达内云计算 <a href="#">NSD1909</a>
    </div>
</div>

<script src="{% static 'js/jquery.min.js' %}"></script>
<script src="{% static 'js/bootstrap.min.js' %}"></script>
<script type="text/javascript">
    $('#linux-carousel').carousel({
        interval : 3000
    });
</script>
</body>
</html>

# templates/index.html 继承模板，写入个性内容
{% extends 'basic.html' %}
{% load static %}
{% block title %}投票首页{% endblock %}
{% block content %}
    <div class="row h4">
        <h1 class="text-center text-warning">投票首页</h1>
        <ol>
            {% for question in questions %}
                <li style="margin: 10px 0;">
                    <a href="{% url 'detail' question.id %}" target="_blank">
                        {{ question.question_text }}
                    </a>
                    {{ question.pub_date }}
                </li>
            {% endfor %}
        </ol>
    </div>
{% endblock %}
```

### 制作投票详情页

```python
# 修改视图函数，取出具体的问题，发给模板文件
# polls/views.py
... ...
def detail(request, q_id):
    # url上的数字，将会作为参数传递给q_id
    question = Question.objects.get(id=q_id)
    # 字典内容将会以key=val的形式传给detail.html，detail.html就可以拥有变量了
    return render(request, 'detail.html', {'question': question})
... ...

# templates/detail.html
{% extends 'basic.html' %}
{% load static %}
{% block title %}问题详情{% endblock %}
{% block content %}
    <div class="row h4">
        <h1 class="text-center text-warning">{{ question.id }}号问题投票详情</h1>
        <h2>{{ question.question_text }}</h2>
        <form action="">
            {% csrf_token %}   {% comment %}django的安全选项，必须设置，固定格式{% endcomment %}
            {% for choice in question.choice_set.all %}
                <div class="radio">
                    <label>
                        <input type="radio" name="c_id" value="{{ choice.id }}">
                        {{ choice.choice_text }}
                    </label>
                </div>
            {% endfor %}
            <div class="form-group">
                <input class="btn btn-primary" type="submit" value="提 交">
            </div>
        </form>
    </div>
{% endblock %}

```

### 实现投票功能

- 实现投票功能，需要执行函数
- 在django中，访问一个url就可以调用相关函数

```python
# polls/urls.py
... ...
    # 定义用于投票的url
    url(r'^(\d+)/vote/$', views.vote, name='vote'),
... ...

# polls/views.py
from django.shortcuts import render, redirect

def vote(request, q_id):
    question = Question.objects.get(id=q_id)  # 取出给哪个问题投票
    # 在用于请求的POST对象中取出c_id的值。POST是一个字典，通过get方法取值
    c_id = request.POST.get('c_id')
    if c_id:  # 如果c_id不为空，取出具体的选项，将其票数加1
        choice = question.choice_set.get(id=c_id)
        choice.votes += 1
        choice.save()
    
    # 投票完成后，跳转到result结果页
    return redirect('result', q_id)

# templates/detail.html
... ...
        <form action="{% url 'vote' question.id %}" method="post">   {% comment %}表单默认的方法是get，通过method明确方法为post{% endcomment %}
... ...
```

## 制作投票结果页

```python
# polls/views.py
... ...
def result(request, q_id):
    question = Question.objects.get(id=q_id)
    return render(request, 'result.html', {'question': question})
... ...

# templates/result.html
{% extends 'basic.html' %}
{% load static %}
{% block title %}投票结果{% endblock %}
{% block content %}
<div class="row h4">
    <h1 class="text-center text-warning">{{ question.id }}号问题投票结果</h1>
    <h2>{{ question.question_text }}</h2>
    {{ question.choice_set.all }}
</div>
{% endblock %}

```

> 《django by example》：https://www.jianshu.com/p/c024662bbb22







