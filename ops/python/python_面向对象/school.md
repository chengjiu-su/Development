```python
class School(object):
    def __init__(self,name,addr):
        self.name = name
        self.addr = addr
        self.teacher = []
        self.students = []
        self.staffs = []
    def enroll(self,stu_obj):
        print("为学员%s 办理入学手续" %stu_obj.name)
        self.students.append(stu_obj)
    def hire(self,staff_obj):
        self.staffs.append(staff_obj)
        print("招聘教职工%s" % staff_obj.name)

class SchoolMember(object):
    def __init__(self,name,age,sex,):
        self.name = name
        self.age = age
        self.sex = sex
    def tell(self):
        pass

class Teacher(SchoolMember):
    def __init__(self,name,age,sex,salary,course):
        super(Teacher,self).__init__(name,age,sex)
        self.salary = salary
        self.course = course

    def tell(self):
        print("""
        ---info of Teacher:%s---
        Name:%s
        Age:%s
        Sex:%s
        Salary:%s
        Course:%s
        """ %(self.name,self.name,self.age,self.sex,self.salary,self.course))

    def teach(self):
        print("%s is teaching course [%s]" %(self.name,self.course))

class Student(SchoolMember):
    def __init__(self,name,age,sex,stu_id,grade):
        super(Student,self).__init__(name,age,sex)
        self.stu_id = stu_id
        self.grade = grade

    def tell(self):
        print("""
        ---info of Student:%s---
        Name:%s
        Age:%s
        Sex:%s
        Stu_id:%s
        Grade:%s
        """ %(self.name,self.name,self.age,self.sex,self.stu_id,self.grade))

    def pay_tution(self,amount):
        print("%s has paid tution  for $%s" %(self.name,amount))

school = School("皮皮虾俱乐部","成都")

t1 = Teacher("Lili",56,"MF",200000,"Linux")
t2 = Teacher("Tom",30,"M",2000,"DevOps")

s1 = Student("bob",20,"M",9527,"DevOps")

t1.tell()
s1.tell()
school.hire(t1)
school.enroll(s1)

print(school.students)
print(school.staffs)
school.staffs[0].teach()

for stu in school.students:
    print(stu.pay_tution(500))
```
输出
```python
/home/chengjiu_su/PycharmProjects/automatic/venv/bin/python /home/chengjiu_su/PycharmProjects/automatic/school.py

        ---info of Teacher:Lili---
        Name:Lili
        Age:56
        Sex:MF
        Salary:200000
        Course:Linux
        

        ---info of Student:bob---
        Name:bob
        Age:20
        Sex:M
        Stu_id:9527
        Grade:DevOps
        
招聘教职工Lili
为学员bob 办理入学手续
[<__main__.Student object at 0x7f604fcd9828>]
[<__main__.Teacher object at 0x7f604fcd97b8>]
Lili is teaching course [Linux]
bob has paid tution  for $500
None

Process finished with exit code 0
```