模块定义：
- 模块：用来从逻辑上组织python代码（定义变量，函数，类，逻辑：实现一个功能），本质就是以.py结尾python的文件(文件名：test.py，对应的模块名为test)
- 包： 用来从逻辑上组织模块，本质是一个目录(必须带有一个__init__.py文件)

导入方法：
 >- import  modile_name
   import module_name1, module_name2, ...
   from module_test import *  # 不推荐；推荐导入单个或所需用的多个模块
   from module_test import logger as logger_test  # 更改别名
   
import本质（路径搜索和搜索路径）：
>- 导入模块的本质就是将python文件解释一遍
>- 导入包的本质就是将包下的__init__.py文件解释一遍(from . import test test='test.py all code') # test.py文件的代码拿到__init__.py里来调用，即外面可直接import package_name 来调用包里的代码
>  from test import m1    m1 = 'code'
>- import module_name --> module_name.py --> module_name.py的路径 -->sys.path

导入优化：
- from module_test import test

模块分类：
- 1.标准库
  2.开源模块 
  3.自定义模块
  
 标注库：
 1.time与datatime
 
 strftime("格式"，struct_time)--->"格式化的字符串"
 strptime("格式化的字符串"，"格式")--->struct_time
 ```bash
 >>> time.strftime("%Y-%M:%d %H:%M:%S")
'2020-09:15 18:09:45'
>>> time.strptime('2020-12:15 18:12:57', "%Y-%m:%d %H:%M:%S")#后面指定时间格式 
time.struct_time(tm_year=2020, tm_mon=12, tm_mday=15, tm_hour=18, tm_min=12, tm_sec=57, tm_wday=1, tm_yday=350, tm_isdst=-1)

tm_year=2020
tm_mon=12
tm_mday=15
tm_hour=18
tm_min=12
tm_sec=57
```