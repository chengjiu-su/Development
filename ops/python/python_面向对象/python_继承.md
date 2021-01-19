>python2 经典类是按深度优先来继承的，新式类是按广度优先来继承的
python3经典类和新式类都是统一按广度优先来继承的
```python
#class People:   经典类
class People(object):  #新式类
    def __init__(self,name,age):
        self.name = name
        self.age = age

    def work(self):
        print("%s is working..." % self.name)
    def play(self):
        print("%s is playing..." % self.name)
    def talk(self):
        print("%s is talking..." % self.name)

class Man(People):
#class Man(People,Animal):   # 调用多个父类
    def __init__(self,name,age,money):   #调用父类初始化
        People.__init__(self,name,age)
        #super.__init__(self,name,age) #新式写法(推荐)  #当同时调用多个父类时，推荐此方法；即全部默认调用
        self.money = money
        print("%s have money %s" % (self.name, self.money))
    #pass   #可直接继承发放
    def Adults(self):   # 可自定义方法
        print("%s is Earn money" % self.name)
    # def work(self):     # 可覆盖父级方法（重写）
    #     print("%s is work hard" % self.name)
    def talk(self):    #先行调用父类方法，再执行自定义方法
        People.talk(self)
        print("%s is talk" % self.name)

class Woman(People):    #第二个继承子类
    def make_up(self):
        print("%s is make_up" % self.name)

m1=Man("test_user",21,10)   # 因为调用父类初始化，即需要加入对应参数money
m1.play()
m1.Adults()
m1.work()
m1.talk()


w2 = Woman("test_user2",21)
w2.play()
w2.make_up()
```
输出
```python
/home/chengjiu_su/PycharmProjects/automatic/venv/bin/python /home/chengjiu_su/PycharmProjects/automatic/test.py
test_user have money 10
test_user is playing...
test_user is Earn money
test_user is working...
test_user is talking...
test_user is talk
test_user2 is playing...
test_user2 is make_up

Process finished with exit code 0
```
案例2  多继承
```python
class People(object):
    def __init__(self,name,age):
        self.name = name
        self.age = age

    def work(self):
        print("%s is working..." % self.name)
    def play(self):
        print("%s is playing..." % self.name)
    def talk(self):
        print("%s is talking..." % self.name)

class Relation(object):
    def make_friends(self,obj):
        print("%s is makeing friends with %s" % (self.name, obj.name))

class Man(People, Relation):
#class Man(People,Animal):
    def __init__(self,name,age,money):   #调用父类初始化
        super(Man,self).__init__(name,age)   #当同时调用多个父类时，推荐此方法；即全部默认调用
        self.money = money
        print("%s have money %s" % (self.name, self.money))
    #pass   #可直接继承发放
    def Adults(self):   # 可自定义方法
        print("%s is Earn money" % self.name)
    # def work(self):     # 可覆盖父级方法（重写）
    #     print("%s is work hard" % self.name)
    def talk(self):    #先行调用父类方法，再执行自定义方法
        People.talk(self)
        print("%s is talk" % self.name)

class Woman(People, Relation):    #第二个继承子类
    def make_up(self):
        print("%s is make_up" % self.name)


m1=Man("test_user",21,10)   # 因为调用父类初始化，即需要加入对应参数money
w2 = Woman("test_user2",21)
m1.make_friends(w2)
```
输出
```python
/home/chengjiu_su/PycharmProjects/automatic/venv/bin/python /home/chengjiu_su/PycharmProjects/automatic/test.py
test_user have money 10
test_user is makeing friends with test_user2

Process finished with exit code 0
```