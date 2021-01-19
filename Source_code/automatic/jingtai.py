class Dog(object):
    name = "我是类变量"
    def __init__(self,name):
        self.name = name

    @classmethod
    def eat(self):
        print("%s is eating" % self.name)



d = Dog("ChenRonghua")
d.eat()