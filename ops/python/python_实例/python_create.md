```python
# 创建一个sh结尾文件，文件名为mytfile,并向文件写入msg
def text_create(name, msg):
    path = '/home/chengjiu_su/PycharmProjects/automatic/'  # 新创建的bash文件的存放路径
    full_path = path + name + '.bash'
    file = open(full_path, 'w')
    file.write(msg)  # msg也就是下面的Hello world!
    file.close()


text_create('test', '#!/bin/bash\necho Hello world!')
# 调用函数创建一个名为test.bash文件，并向其写入Hello world!
```