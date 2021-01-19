```python
name.capitalize()  首字母大写
name.casefold()   大写全部变小写
name.center(50,"-")  输出 '---------------------Alex Li----------------------'
name.count('lex') 统计 lex出现次数
name.encode()  将字符串编码成bytes格式
name.endswith("Li")  判断字符串是否以 Li结尾
 "Alex\tLi".expandtabs(10) 输出'Alex      Li'， 将\t转换成多长的空格 
 name.find('A')  查找A,找到返回其索引， 找不到返回-1 

format :
    >>> msg = "my name is {}, and age is {}"
    >>> msg.format("alex",22)
    'my name is alex, and age is 22'
    >>> msg = "my name is {1}, and age is {0}"
    >>> msg.format("alex",22)
    'my name is 22, and age is alex'
    >>> msg = "my name is {name}, and age is {age}"
    >>> msg.format(age=22,name="ale")
    'my name is ale, and age is 22'
format_map
    >>> msg.format_map({'name':'alex','age':22})
    'my name is alex, and age is 22'


msg.index('a')  返回a所在字符串的索引
'9aA'.isalnum()   True   #阿拉伯数字和26英文字符

'9'.isdigit() 是否整数
name.isnumeric  
name.isprintable
name.isspace
name.istitle
name.isupper
 "|".join(['alex','jack','rain'])
'alex|jack|rain'


maketrans
    >>> intab = "aeiou"  #This is the string having actual characters. 
    >>> outtab = "12345" #This is the string having corresponding mapping character
    >>> trantab = str.maketrans(intab, outtab)
    >>> 
    >>> str = "this is string example....wow!!!"
    >>> str.translate(trantab)
    'th3s 3s str3ng 2x1mpl2....w4w!!!'

 msg.partition('is')   输出 ('my name ', 'is', ' {name}, and age is {age}') 

 >>> "alex li, chinese name is lijie".replace("li","LI",1)
     'alex LI, chinese name is lijie'

 msg.swapcase 大小写互换


 >>> msg.zfill(40)
'00000my name is {name}, and age is {age}'



>>> n4.ljust(40,"-")
'Hello 2orld-----------------------------'
>>> n4.rjust(40,"-")
'-----------------------------Hello 2orld'


>>> b="ddefdsdff_哈哈" 
>>> b.isidentifier() #检测一段字符串可否被当作标志符，即是否符合变量命名规则
True
```