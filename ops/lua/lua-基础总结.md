##### lua
-- 单行注释
--[[
  多行注释
--]]
--标识符：字母，下划线，数字
--特殊字符不可使用
--区分大小写
--关键字
and，break，do,else,elseif end false for function if
in local nil not or repeat return then true,until,while
--一般约定，以下划线开头连接一串写字母的名字比如：_VERSION,被保留用于lua内部全局变量

--全局变量（默认情况下默认为全局变量）
print("b");
b = 10; 
print("b");

b = nil; --删除一个全局变量，只要将变量赋值为nil，当且仅当一个变量不等于nil时，这个变量即存在


##### lua 002
--lua的数据类型
--nil, boolean, number, string, userdata, function, thread, table

print(type("Heloo World"));   [[string]]
print(type(10.3 * 3));        [[number]]
print(type(print));           [[function]]
print(type(true));            [[boolean]]
print(type(nil));             [[nil]]
print(type(type(x)));         [[string]]
```lua
tab1 = {key1 = "val1", key2 = "val2", "val3"}
for k, v in pairs(tab1) do
	print(k.." - "..v)
end
tab1.key1=nil;

for k, v inpairs(tab1) do
	print(k.." - "..v)
end
```
```
type(x);         [[nil]]
> type(x) == "nil";
true
````
##### lua 003
>--boolean
--lua把false和nil看作是假，其他都为真
```lua
> return print(type(true));
boolean
> return print(type(false));
boolean
> return print(type(nil));
nil
> 
> if false or nil then
>> print("至少有一个true")
>> else
>> print("false nil 都为false")
>> end
false nil 都为false
```
##### lua 004
>--number数字
```lua
> print(type(2))
number
> print(type(2.2))
number
> print(type(2e+1))
number
> print(2e+1)       [[10的2]]次方
20.0
> print(type(0.2e-1))
number
> print(type(1.25489e-06))
number
```
##### lua 005
--string
```lua
> string1 = "This is string1"
> string2 = "This is string2"
> html = [[
>> <html>
<head>
<body>
	<a href = "www.hao123.com">Lua</a></body>
</body>
</html>
]]

>print(html)  #输出
> print("2" + "3")
5.0
> print("a".."b")   #字符连接
ab
>print("123".."456")
123456
> len= "www.baidu.com"    #统计长度
> print([[len]])
13
> print(#"www.baidu.com")
13
```
##### lua 006 table
--table
--创建一个空表
```lua
> local tbl1 = {}
--直接初始化表
> local tbl2 = {"apple",  "pear", "orange"}
--关联数组
> a = {}
> a["key"] = "value"
> key = 10
> a[key] = 22
> a[key] = a[key] + 11
> for k, v in pairs(a)  do
>> print(k..":"..v)
>> end
#输出
key:value
10:33
> local tb1 = {"apple", "pear", "orange", "grape"}
> for key, val in pairs(tb1) do
print("Key", key)
end
#以上循环有问题
> a3 = {}
> for i = 1, 10 do
>> a3[i] = i 
>> end
> a3["key"] = "val"
> print(a3["key"])
val
> print(a3[none])
nil
```
##### 007 function
--function
```lua
> function factorial(n)
	if n == 0 then
		return 1
	else
		return n * factorial(n - 1)
	end
    end
> print(factorial(5))
120
> factorial2 = factorial
> print(factorial2(5)
120
------------------------
tab = {key1 = "val1", key2 = "val2"}
--faction可以通过匿名函数的方式通过参数传递
testFun(tab,function(key, val)  --匿名函数
    return key .. " = " .. val
 end)
#以上函数报错
stdin:1: attempt to call a nil value (global 'testFun')
stack traceback:
        stdin:1: in main chunk
        [C]: in ?
```
##### 008 thread
--thread  线程 
--coroutine

##### 009
--userdata  #自定义数据类型

##### 010 lua变量
-- 全局变量  局部变量  表中的域
```lua
> a = 5   全局
> local b = 5  局部> 
function joke()
   c = 5 
   local d = 6
 end
joke()
print(c, d)
#输出
5       nil

do 
   local a = 6  --局部
   b = 6 --对局部变量重新赋值
   print(a, b)
end
#输出
6	6
```
#####011 赋值语句
```lua
> a = "hello" .. "world"
> a, b, c = 0, 1
> print(a, b, c)
0       1       nil
> a ,b = a + 1, b + 1, b + 2
> print(a, b)
1       2
```
##### 012 lua索引
```lua
t[i]
--t.i --当索引为字符串类型时的一种很简化写法

--gettable_event(t.1) --采用索引访问本质上是一个类似这样的函数调用
site = {}
site["key"] = "www.baidu.com"
print(site["key"])
print(site.key)
```
##### 013 lua循环
```lua
--while ， for , repeat...until
--循环控制语句

> while(true)
>> do
>> print("一直执行")
>> end

```
##### 013 lua流程控制
```lua
--if  if else, if嵌套语句
> if (0) then
print("0为true")
>> end
0为true
```
##### 014 lua函数
```lua 
--完成指定的任务
--计算并返回值
> function max(num1,num2)
if (num1 > num2) then
result = num1
else
result = num2
end
return result
end
> print("两值比较最大值为",max(10,4))
两值比较最大值为        10

myprint = function(param)
print("这是打印函数-##",param, "##")
end
function add(num1, num2, functionPrint)
result = num1 + num2
functionPrint(result)
end
return myprint(10)
return add(2, 5, myprint)
#输出
这是打印函数-## 10      ##
这是打印函数-## 7       ##
---------------------------
```
##### 015 lua多返回值
```lua
> s, e = string.find("www.baidu.com","www.jd.com")
> print(s, e)
nil     nil
> s, e = string.find("www.baidu.com","www.baidu")  #返回相同位置的开始下标和结束下标
> print(s, e)
1       9


function maximum(a)
        local mi =1  --最大的索引
        local m =a[mi]  --最大值
        for i, val in pairs(a) do
        if val > m then
                mi = i
                m = val
            end
        end
        return m, mi
end
print(maximum({1, 2, 10, 3, 4}))

lua test.lua #输出
10    3
```
##### 016 lua函数_可变参数
```lua
function add(...)
   local s = 0
   for i, v in ipairs{...} do --{...}表示一个所有变长参数构成的数组
        s = s + v
   end

   return s
end

print(add(1, 2, 3, 4))

输出
lua test,lua
10
----------------------------------
function average(...)
result = 0 
local arg = {...}

for i, v in ipairs(arg) do
    result = result + v 
    end

    print("一共传入 "..[[arg]].." 个数")

    return result/[[arg]]
end

print("平均值为", average(1, 2, 3, 4))
[root@localhost ~]# lua test.lua 
一共传入 4 个数
平均值为        2.5
```
##### 017 lua函数_固定+可变参数
```lua
function fwrite(fmt, ...)
        return io.write(string.format(fmt, ...))
end

fwrite("abcdef\n")

fwrite("%d%d\n", 1, 2， 3) [[按10]]进制输出
[root@localhost ~]# lua test.lua 
abcdef
123
```
##### 018 lua运算符
```lua
a = 21
b = 10
c = a + b
print(" c的值为", c)
[root@localhost ~]# lua test.lua 
c的值为  31
--关系运算符
{ + - × / % ^(乘积) -(负数) }
--比较运算符
{ < > == ~=(不等于) <= => }
--逻辑运算符
{ and  not  or }
(a and b) false  # a为false返回a否则返回b a b 都为true则返回true


```
##### 019 lua运算符优先级
```lua
--[[
^
not
* /
+ -
< > <= => ~= ==
and or
--]]
```
##### 020 lua字符串
```lua
--字符串
--单引号， 双引号，[[]]

--字符串
--单引号， 双引号，[[]]

string1 = "lua"              --推荐固定一种写法
print("\"字符串1是\"",string1)

string2 = 'www.baidu.com'
print("字符串2是",string2)

string3 = [[www.jd.com]]
print("字符串3是",string3)
[root@localhost ~]# lua test.lua 
"字符串1是"	lua
"字符串2是"	www.baidu.com
"字符串3是"	www.jd.com

--转义字符 "\" \a \b 退格 \f 换页  \n 换行 \r 回车 \t 水平制表 \v 垂直制表 \\ 反斜线字符 \' 单引号
--\" 双引号  \0 空字符  \ddd 1-3位8进制字符   \xhh 1-2位16进制数任意字符
   
print(string.gsub("aaaa", "a", "z", 3))
[root@localhost ~]# lua test.lua 
zzza	3
print(string.find("Hello lua user", "lua")) 
[root@localhost ~]# lua test.lua 
7	9
print(string.find("Hello lua user", "lua"))   
print(string.reverse("lua")) [root@localhost ~]# lua test.lua 
7	9
aul
print(string.format("the value is:%d",4))  #以是10进制输出
[root@localhost ~]# lua test.lua 
the value is:4
print(string.char(97, 98, 99, 100))   #将ASCII码转为字符
[root@localhost ~]# lua test.lua 
abcd
print(string.byte("ABCD",2))
print(string.byte("ABCD"))  
[root@localhost ~]# lua test.lua 
66
65
print(string.len("abc"))
[root@localhost ~]# lua test.lua 
3
print(string.rep("abc", 2))
[root@localhost ~]# lua test.lua 
abcabc
```
```lua
--string.gmatch(str, pattern)
for word in string.gmatch("Hello Lua user", "%a+")
do
        print(word)
end
[root@localhost ~]# lua test.lua 
Hello
Lua
user

```