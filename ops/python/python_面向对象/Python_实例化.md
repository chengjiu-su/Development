##### 案例
```python
#执行顺序，先查询实例变量，实例变量不存在；则继续查询类变量  
#定义类  
class Role:  
    n = 123 #类变量  
 def __init__(self,name,role,weapon,life_value=100,money=15000):  
        # 构造函数  
 # 在实例化时做一些类的初始化的工作  
 self.name = name  #实例变量(静态属性)，作用域就是本身  
 self.role = role  
        self.weapon = weapon  
        self.life_value = life_value  
        self.money = money  
    #析构函数  
 def __del__(self):  
        print("%s GG了" % self.name)  
  
    #定义方法  
 def shot(self):  #类的方法，功能(动态属性)  
 print("shooting...")  
  
    def got_shot(self):  
        print("ah...,I got shot...")  
  
    def buy_gun(self,gun_name):  
        print("%s just bought %s" %(self.name, gun\_name))  
# 实例化（初始化一个类＝制造了一个对象）  
r1 = Role('zhangsan','police','AK47') #生成一个角色  
r1.buy_gun("95")  
r1.got_shot()  
#del r1   #调用析构函数  
r2 = Role('Jack','terrorist','B22')  #生成一个角色  
r2.buy_gun("ak47")  
r2.got_shot()  
# #r1.name = "test"  # 改名  
# #r1.got_shot() #调用函数方法  
# #r1.buy_gun("92")  
# r2 = Role('Jack','terrorist','B22')  #生成一个角色  
# r1.n = "改变变量"   # 改变类变量。生成新的内存类变量  
# print(r1.n)   # 打印"改变变量"  
# print(r2.n)   # 打印123  
# #print(r1.n,r1.name)   #未实例化，将类的方法打印  
# r1.buy_gun("AK47")  
# r2.buy_gun("95")
```
- ##### 析构函数
	- 在实例自动释放，销毁的时候执行；通常用于一些收尾工作，如： 关闭数据库连接，关闭打开的临时文件等

- ##### 私有方法
```bash
#执行顺序，先查询实例变量，实例变量不存在；则继续查询类变量
#定义类
class Role:
    n = 123 #类变量
    def __init__(self,name,role,weapon,life_value=100,money=15000):
        # 构造函数
        # 在实例化时做一些类的初始化的工作
        self.name = name  #实例变量(静态属性)，作用域就是本身
        self.role = role
        self.weapon = weapon
        #self.life_value = life_value
        self.__life_value = life_value    #私有属性
        self.money = money
    def show_status(self):
        print("name: %s weapon: %s life_value: %s" %(self.name,
                                                     self.weapon,
                                                     self.__life_value))

    #析构函数
    def __del__(self):
        pass #print("%s GG了" % self.name)

    #定义方法
    def __shot(self):   #私有方法   和私有属性一致
        print("shooting...")

    def got_shot(self): #类的方法，功能(动态属性)
        print("ah...,I got shot...")

    def buy_gun(self,gun_name):
        print("%s just bought %s" %(self.name, gun_name))
# 实例化（初始化一个类＝制造了一个对象）


r1 = Role('zhangsan','police','AK47') #生成一个角色
print(r1.show_status())     # 打印私有属性
```