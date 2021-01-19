>表3-1 字符串格式设置中的类型说明符
类型                                                    含 义
b                                           将整数表示为二进制数
c                                           将整数解读为Unicode码点
d                                           将整数视为十进制数进行处理，这是整数默认使用的说明符
e                                           使用科学表示法来表示小数（用e来表示指数）
E                                          与e相同，但使用E来表示指数
f                                           将小数表示为定点数
F                                          与f相同，但对于特殊值（nan和inf），使用大写表示
g                                          自动在定点表示法和科学表示法之间做出选择。这是默认用于小数的说明符，但在默认情况下至少有1位小数
G                                         与g相同，但使用大写来表示指数和特殊值
n                                          与g相同，但插入随区域而异的数字分隔符
o                                          将整数表示为八进制数
s                                          保持字符串的格式不变，这是默认用于字符串的说明符
x                                          将整数表示为十六进制数并使用小写字母
X                                          与x相同，但使用大写字母
%                                         将数表示为百分比值（乘以100，按说明符f设置格式，再在后面加上%）

**模块string      75**
>
虽然字符串方法完全盖住了模块string的风头，但这个模块包含一些字符串没有的常量
和函数。下面就是模块string中几个很有用的常量①。
 string.digits：                           包含数字0～9的字符串。
 string.ascii_letters：                包含所有ASCII字母（大写和小写）的字符串。
 string.ascii_lowercase：          包含所有小写ASCII字母的字符串。
 string.printable：                      包含所有可打印的ASCII字符的字符串。
 string.punctuation：                 包含所有ASCII标点字符的字符串。
 string.ascii_uppercase：          包含所有大写ASCII字母的字符串。
虽然说的是ASCII字符，但值实际上是未解码的Unicode字符串。

**格式化字符串**

这是使用*f-strings*的相同示例：
```python
**>>>** name = "Kushal"
**>>>** language = "Python"
**>>>** msg = f"*{name}* loves *{language}*."
**>>>** print(msg)
Kushal loves Python.
```
F字符串为将Python表达式嵌入字符串提供了一种简单易读的方式。这里还有一些例子。
```python
**>>>** answer = 42
**>>>** print(f"The answer is *{answer}*")
The answer is 42
**>>> import** **datetime>>>** d = datetime.date(2004, 9, 8)
**>>>** f"*{d}* was a {d:%A}, we started the mailing list back then."
'2004-09-08 was a Wednesday, we started the mailing list back then.'
```
如果您想了解更多有关此功能如何走进Python的，看这个 [谈话](https://www.youtube.com/watch?v=M4w4wKveVo4)从[Mariatta甲亮](https://twitter.com/mariatta)。

在Python3.8中，我们可以使用以下样式来帮助打印值以及变量名。
```python
**>>>** a = 1
**>>>** b = 2
**>>>** print(f"{a=} and {b=}")
a=1 and b=2
```
##### .format方法

我们也可以在字符串里面使用format方法。
```python
**>>>** name = "Kushal"
**>>>** language = "Python"
**>>>** msg = "*{0}* loves *{1}*.".format(name, language)
**>>>** print(msg)
Kushal loves Python.
```