文件是计算机存储设备中保留的某些信息或数据。您已经知道各种文件，例如音乐文件，视频文件，文本文件。Python为您提供了操作这些文件的简便方法。通常，我们将文件分为两类，文本文件和二进制文件。文本文件是简单的文本，其中二进制文件包含只能由计算机读取的二进制数据。

## 打开文件

要打开文件，我们使用*open（）*函数。它需要两个参数，第一个是文件路径或文件名，第二个应该打开哪种模式。模式就像

- “ r”->打开只读，您可以读取文件，但不能编辑/删除其中的任何内容
- “ w”->以写权限打开，表示如果文件存在，则删除所有内容并打开以进行写入
- “ a”->以追加模式打开

默认模式是只读的，即，如果您不提供任何模式，它将以只读方式打开文件。让我们打开一个文件

```python
>>> fobj = open("love.txt")
>>> fobj
<_io.TextIOWrapper name='love.txt' mode='r' encoding='UTF-8'>
```

## 关闭文件

打开文件后，应始终关闭打开的文件。为此，我们使用*close（）*方法。

```python
>>> fobj = open("love.txt")
>>> fobj
<_io.TextIOWrapper name='love.txt' mode='r' encoding='UTF-8'>
>>> fobj.close()
```

**重要**

作业完成后，请务必确保*明确*关闭每个打开的文件，并且没有理由保持打开状态。因为

- 程序可以打开的文件数有一个上限。如果超过该限制，则没有可靠的恢复方法，因此该程序可能会崩溃。
- 每个打开的文件都会消耗一些与其相关的数据结构的主内存，例如文件描述符/句柄或文件锁等。因此，如果您打开了更多无用或不可用的文件，则可能最终浪费大量内存。 。
- 打开的文件总是有损坏和丢失数据的机会。

## 读取文件

要一次读取整个文件，请使用*read（）*方法。

```python
>>> fobj = open("sample.txt")
>>> fobj.read()
'I love Python\nPradeepto loves KDE\nSankarshan loves Openoffice\n'
```

如果再次调用read（），它将返回空字符串，因为它已经读取了整个文件。readline（）可以帮助您每次从文件中读取一行。

```python
>>> fobj = open("sample.txt")
>>> fobj.readline()
'I love Python\n'
>>> fobj.readline()
'Pradeepto loves KDE\n'
```

要读取列表中的所有行，我们使用readlines（）方法。

```python
>>> fobj.readlines()
['I love Python\n', 'Pradeepto loves KDE\n', 'Sankarshan loves Openoffice\n']
```

您甚至可以遍历文件对象中的各行。

```python
>>> fobj = open("sample.txt")
>>> for x in fobj:
...     print(x, end=' ')
...I love Python
Pradeepto loves KDE
Sankarshan loves Openoffice
```

让我们编写一个程序，它将文件名作为用户的输入并在控制台中显示文件的内容。

```python
#!/usr/bin/env python3
name = input("Enter the file name: ")
fobj = open(name)
print(fobj.read())
fobj.close()
```

在最后一行中，您可以看到我们借助close（）方法关闭了文件对象。

输出

```python
$ ./showfile.py
Enter the filename: sample.txt
I love Python
Pradeepto loves KDE
Sankarshan loves Openoffice
```

## 使用with语句[¶](https://pymbook.readthedocs.io/en/latest/file.html#using-the-with-statement)

在现实生活中，我们应该尝试使用with语句。它将为您关闭文件

```python
>>> with open('setup.py') as fobj:
...     for line in fobj:
...         print line,
...#!/usr/bin/env python3
"""Factorial project"""
from setuptools import find_packages, setup

setup(name = 'factorial',
    version = '0.1',
    description = "Factorial module.",
    long_description = "A test module for our book.",
    platforms = ["Linux"],
    author="Kushal Das",
    author_email="kushaldas@gmail.com",
    url="https://pymbook.readthedocs.io/en/latest/",
    license = "http://www.gnu.org/copyleft/gpl.html",
    packages=find_packages()
    )
```

## 写在文件[¶](https://pymbook.readthedocs.io/en/latest/file.html#writing-in-a-file)

让我们打开一个文件，然后使用*write（）*方法向其中写入一些随机文本。我们还可以将文件对象传递给打印函数调用，以便它写入文件中。

```python
>>> fobj = open("ircnicks.txt", 'w')
>>> fobj.write('powerpork\n')
>>> fobj.write('indrag\n')
>>> fobj.write('mishti\n')
>>> fobj.write('sankarshan')
>>> print("This is the last line.", file=fobj)
>>> fobj.close()
```

现在阅读我们刚刚创建的文件

```python
>>> fobj = open('ircnicks.txt')
>>> s = fobj.read()
>>> print(s)
powerpork
indrag
mishti
sankarshan
This is the last line.
```

## copyfile.py

在此示例中，我们将给定的文本文件复制到另一个文件。

```python
#!/usr/bin/env python3import sysif len(sys.argv) < 3:
    print("Wrong parameter")
    print("./copyfile.py file1 file2")
    sys.exit(1)
with open(sys.argv[1]) as f1:
    s = f1.read()
with open(sys.argv[2], 'w') as f2:
    f2.write(s)
```

**注意**

这种读取文件的方式并不总是一个好主意，文件可能很大，无法读取并适合内存。最好读取文件的已知大小并将其写入新文件。

您可以在*sys中*看到我们使用了一个新模块。*sys.argv*包含所有命令行参数。记住shell中的*cp*命令，在*cp*之后，我们首先键入要复制的文件，然后键入新文件名。

*sys.argv中*的第一个值是命令本身的名称。

```python
#!/usr/bin/env python3import sysprint("First value", sys.argv[0])
print("All values")
for i, x  in enumerate(sys.argv):
    print(i, x)
```

输出：

```python
$ ./argvtest.py Hi there
First value ./argvtest.py
All values
0 ./argvtest.py
1 Hi
2 there
```

在这里，我们使用了一个新函数*enumerate（iterableobject）*，该函数返回可迭代对象的索引号和值。

## 计算文件中的空格，制表符和换行符

让我们尝试编写一个应用程序，该应用程序将计算任何给定文件中的空格，制表符和行数。

```python
#!/usr/bin/env python3
import osimport sysdef parse_file(path):
    """    Parses the text file in the given path and returns space, tab & new line    details.    
					:arg path: Path of the text file to parse    
					:return: A tuple with count of spacaes, tabs and lines.    """
		fd = open(path)
    i = 0
    spaces = 0
    tabs = 0
    for i,line in enumerate(fd):
        spaces += line.count(' ')
        tabs += line.count('\t')
    #Now close the open filefd.close()

    #Return the result as a tuplereturn spaces, tabs, i + 1

def main(path):
    """    Function which prints counts of spaces, tabs and lines in a file.    :arg path: Path of the text file to parse    :return: True if the file exits or False.    """
		if os.path.exists(path):
        spaces, tabs, lines = parse_file(path)
        print("Spaces %d. tabs %d. lines %d" % (spaces, tabs, lines))
        return Trueelse:
        return Falseif __name__ == '__main__':
    if len(sys.argv) > 1:
        main(sys.argv[1])
    else:
        sys.exit(-1)
    sys.exit(0)
```

您可以看到程序中有两个函数，*main*和*parse_file*，其中第二个函数实际解析文件并返回结果，并在*main*函数中打印结果。通过将代码分成较小的单元（函数），可以帮助我们组织代码库，并且为函数编写测试用例也将更加容易。

##### 让我们写一些真实的代码

>您知道处理器中有多少个CPU吗？或型号名称是什么？让我们写一些代码来帮助我们了解这些事情。

>如果您使用的是Linux，则实际上可以先查看*lscpu*命令的输出。您实际上可以在*/ proc / cpuinfo*的文件中找到该信息。

>现在，尝试编写代码以只读模式打开文件，然后逐行读取文件并找出CPU的数量。

**小费**

始终记住逐行读取文件，而不是整体读取文件。有时，您可能需要读取比可用RAM大得多的文件。
完成此操作后，尝试在Python中编写自己的lscpu命令：）