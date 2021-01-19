# 模块

在本章中，我们将学习Python模块。

## 简介

到目前为止，当我们退出解释器时，我们在Python解释器中编写的所有代码都丢失了。但是，当人们编写大型程序时，他们倾向于将其代码分成多个不同的文件，以易于使用，调试和提高可读性。在Python中，我们使用*模块*来实现这些目标。模块不过是带有Python定义和语句的文件。文件名应为有效的Python名称（请考虑任何变量名），并使用小写字母。

您可以通过访问*__name__*变量来找到模块的名称。它是一个全局变量。

现在我们来看看模块是如何工作的。创建一个名为bars.py的文件。文件的内容如下。

```python
"""Bars Module============This is an example module with provide different ways to print bars."""
def starbar(num):
    """    Prints a bar with *    :arg num: Length of the bar    """
print("*" * num)

def hashbar(num):
    """    Prints a bar with #    :arg num: Length of the bar    """
print("#" * num)

def simplebar(num):
    """    Prints a bar with -    :arg num: Length of the bar    """
print("-" * num)
```

现在，我们将启动Python解释器并导入我们的模块。

这将导入模块栏。我们必须使用模块名称来访问模块内部的功能

```python
>>> import bars
>>> bars.hashbar(10)
##########
>>> bars.simplebar(10)
----------
>>> bars.starbar(10)
**********
```

## 导入模块

有多种导入模块的方法。我们已经看到了执行此操作的一种方法。您甚至可以从模块导入所选功能。为此：

```python
>>> from bars import simplebar, starbar
>>> simplebar(20)
--------------------
```

**警告**

建议避免*从模块导入*从模块导入*。

请记住，当我们导入模块时，Python解释器将执行整个文件，然后将其作为模块导入。即使我们从模块导入单个函数，也是如此。查看以下更新的bars.py示例。

```python
"""Bars Module============This is an example module which provides different ways to print bars."""

ANSWER = 42

def starbar(num):
    """    Prints a bar with *    :arg num: Length of the bar    """print("*" * num)

def hashbar(num):
    """    Prints a bar with #    :arg num: Length of the bar    """print("#" * num)

def simplebar(num):
    """    Prints a bar with -    :arg num: Length of the bar    """print("-" * num)

print(ANSWER)
```

现在，如果我们尝试仅从bars模块中导入simplebar函数，它将仍然输出值 ANSWER

```python
>>> from bars import simplebar
42
```

首次导入模块后，使用模块名称作为键将它们存储（作为缓存）在sys.modules词典中。如果您尝试再次导入它，Python将检查它是否在sys.modules中，然后从那里返回模块。所有导入的模块均为module类型。

```python
>>> sys.modules["bars"]
<module 'bars' from '/home/kdas/code/pym/code/bars.py'>
>>> dir(bars)
['ANSWER', '__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__spec__', 'hashbar', 'simplebar', 'starbar']
>>> type(bars)
<class 'module'>
>>> bars.__name__
'bars'
>>> bars.__file__
'/home/kdas/code/pym/code/bars.py'
>>> bars.__cached__
'/home/kdas/code/pym/code/__pycache__/bars.cpython-37.pyc'
```

## 包和子模块[¶](https://pymbook.readthedocs.io/en/latest/modules.html#packages-and-submodules)

我们可以在一个模块中有许多子模块。带有*__init__.py*的目录也可以用作模块，并且其中的所有*.py*文件都将成为子模块。

```python
$ tree mymodule
mymodule
|-- bars.py
|-- __init__.py
`-- utils.py
```

在此示例中，mymodule是模块名称，bar和utils是其中的两个子模块。您可以使用touch命令创建一个空的__init__.py。

$ touch mymodule/**init**.py

## __init__.py中的

如果__init__.py文件包含一个名为__all__的列表，则仅列出的名称是公用的。如果mymodule的__init__.py 文件包含以下内容

```python
from .bars import simplebar
__all__ = [simplebar, ]
```

然后从mymodule只有simplebar将可用。

**注意**

*from mymodule import **仅适用于模块级别的对象，尝试使用它导入函数或类将导致语法错误。

您还注意到， 从*mymodule*包内部导入*simplebar*函数时，我们使用了一种新样式。使用这个。该符号称为显式导入。

- [`](https://pymbook.readthedocs.io/en/latest/modules.html#id1)

    从。import foo`＃导入./foo.py

- [`](https://pymbook.readthedocs.io/en/latest/modules.html#id3)

    from .bars import foo`＃从./bars.py导入foo
```python
- 从.. import foo

    ＃导入../foo.py

- 从..life import foo

    ＃导入../life/foo.py
```
##### 默认模块

现在，您的Python安装附带安装了不同的模块，您可以根据需要使用它们，并可以出于其他任何特殊目的安装新模块。在以下几个示例中，我们将在同一示例上看到许多示例。

```python
>>> help()

Welcome to Python 3.5's help utility!

If this is your first time using Python, you should definitely check out
the tutorial on the Internet at http://docs.python.org/3.5/tutorial/.

Enter the name of any module, keyword, or topic to get help on writing
Python programs and using Python modules.  To quit this help utility and
return to the interpreter, just type "quit".

To get a list of available modules, keywords, symbols, or topics, type
"modules", "keywords", "symbols", or "topics".  Each module also comes
with a one-line summary of what it does; to list the modules whose name
or summary contain a given string such as "spam", type "modules spam".

help> modules
```

上面的示例显示了如何获取系统中所有已安装模块的列表。我没有在这里粘贴它们，因为这在我的系统中是一个很大的列表：)

您也可以在交互器中使用*help（）*函数查找有关任何模块/类的文档。假设您想了解字符串中所有可用的方法，则可以使用以下方法
```python
>>> help(str)
```
##### 模块[os¶](https://pymbook.readthedocs.io/en/latest/modules.html#module-os)

**`[os](https://docs.python.org/3/library/os.html#module-os)`**模块提供依赖于操作系统的功能。您可以使用以下导入语句将其导入。
```python
>>> import os
```
getuid（）函数返回当前进程的有效用户ID。

```python
>>> os.getuid()
500
```

getpid（）返回当前进程的ID。getppid（）返回父进程的ID。

```python
>>> os.getpid()
16150
>>> os.getppid()
14847
```

uname（）返回标识操作系统的不同信息，在Linux中，它返回您可以从uname命令获得的详细信息。返回的对象是一个元组，（系统名称，节点名称，发行版，版本，计算机）

```python
>>> os.uname()
('Linux', 'd80', '2.6.34.7-56.fc13.i686.PAE', '#1 SMP Wed Sep 15 03:27:15 UTC 2010', 'i686')
```

getcwd（）*返回当前工作目录。* chdir（path）将当前工作目录更改为path。在示例中，我们首先看到当前目录，这是我的主目录，并将当前目录更改为/ tmp，然后再次检查当前目录。

```python
>>> os.getcwd()
'/home/kushal'
>>> os.chdir('/tmp')
>>> os.getcwd()
'/tmp'
```

因此，让我们使用os模块提供的另一个函数并创建我们自己的函数以列出任何给定目录中的所有文件和目录

```python
def view_dir(path='.'):
    """    This function prints all files and directories in the given directory.    :args path: Path to the directory, default is current directory    """
		names = os.listdir(path)
    names.sort()
    for name in names:
        print(name, end =' ')
```

使用view_dir示例。

```
>>> view_dir('/')
.readahead bin boot dev etc home junk lib lib64 lost+found media mnt opt
proc root run sbin srv sys tmp usr var
```

OS模块中还有许多其他非常有用的功能，您可以[在此处](https://docs.python.org/3/library/os.html)阅读有关它们的[信息。](https://docs.python.org/3/library/os.html)

## 请求模块

request是一个Python模块，它改变了人们为许多项目编写代码的方式。它可以帮助您以非常简单但优雅的方式进行HTTP GET或POST调用。这是第三方模块，这意味着您必须从OS分发软件包中安装它，这不是默认设置。

```python
# dnf install python3-requests
```

上面的命令将在系统中安装Python3版本的requests模块。

### 获得一个简单的网页

您可以使用*get*方法来获取任何网站。

```python
>>> import requests>>> req = requests.get('http://google.com')
>>> req.status_code
200
```

该*文本*属性包含由服务器返回的HTML。

利用这些知识，让我们编写一个命令，该命令可以从Internet下载给定的文件（URL）。

```python
#!/usr/bin/env python3
import os
import os.path
import requestsdef download(url):
    '''Download the given url and saves it to the current directory.    :arg url: URL of the file to be downloaded.    '''
		req = requests.get(url)
    # First let us check non existing files.if req.status_code == 404:
        print('No such file found at %s' % url)
        returnfilename = url.split('/')[-1]
    with open(filename, 'wb') as fobj:
        fobj.write(req.content)
    print("Download over.")

if __name__ == '__main__':
    url = input('Enter a URL:')
    download(url)
```

在这里，我们使用了一些新内容，模块名称为*__main__时*，仅要求用户输入，然后下载给定的URL。当其他一些Python代码将此文件导入为Python模块时，这也可以防止此情况发生。

要了解有关请求模块的更多信息，请转到其[精美的文档](http://docs.python-requests.org/)。

您实际上可以修改上面的程序以变得更加用户友好。例如，您可以检查给定文件名在当前目录中是否已经存在。使用**`[os.path](https://docs.python.org/3/library/os.path.html#module-os.path)`**模块作为名称。

## 命令行参数

您还记得*ls*命令吗，您可以传递其他类型的选项作为命令行参数。您也可以这样做。.重要：您的应用程序。阅读[此操作](https://docs.python.org/3/howto/argparse.html)指南以了解更多信息。

## Python解释器中的TAB完成

首先创建一个*〜/ .pythonrc*文件，并将以下内容包含在该文件中

```python
import rlcompleter, readlinereadline.parse_and_bind('tab: complete')

history_file = os.path.expanduser('~/.python_history')
readline.read_history_file(history_file)

import atexitatexit.register(readline.write_history_file, history_file)
```

接下来，只需从〜/ .bashrc文件中导出指向该文件的PYTHONSTARTUP变量即可。
```pyton
export PYTHONSTARTUP=~/.pythonrc
```
从现在开始，无论何时打开bash shell，您都将在您的Python解释器中完成TAB的完成和代码的历史记录。

要在当前shell中使用它，请提供bashrc文件的源。
```shell
$ source ~/.bashrc
```