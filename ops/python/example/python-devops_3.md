## ansible

- ansible使用python语言编写

```python
# 查询ansible版本
[root@localhost day03]# pip3 install ansible==

# 安装2.7.2
[root@localhost day03]# pip3 install ansible==2.7.2
[root@localhost myansible]# yum install -y sshpass

# 创建工作环境
[root@localhost day03]# mkdir myansible
[root@localhost day03]# cd myansible
[root@localhost myansible]# vim ansible.cfg
[defaults]
inventory = hosts
remote_user = root

[root@localhost myansible]# vim hosts
[dbservers]
192.168.113.133

[webservers]
127.0.0.1

# 收集远程主机密钥
[root@localhost myansible]# ssh-keyscan 127.0.0.1 192.168.113.133 >> ~/.ssh/known_hosts 

# 测试
[root@localhost myansible]# ansible all -m ping -k
SSH password: 
```

### ansible应用

执行ansible任务的两大方式：

- adhoc临时命令

```python
# ansible 主机清单 -m 模块 -a 参数
```

- playbook

```python
# ansible-playbook xxx.yml
```

- 配置vim，方便书写yaml文件

```python
[root@localhost myansible]# vim ~/.vimrc 
autocmd FileType yaml setlocal sw=2 ts=2 et ai
```

- 执行playbook

```python
[root@localhost myansible]# vim lamp.yml
---
- name: configure dbservers
  hosts: dbservers
  tasks:
    - name: install mariadb
      yum:
        name: mariadb-server
        state: present
    - name: start mariadb
      service:
        name: mariadb
        state: started
        enabled: yes

- name: configure webservers
  hosts: webservers
  tasks:
    - name: install httpd
      yum:
        name: httpd
        state: present
    - name: start httpd
      service:
        name: httpd
        state: started
        enabled: yes
# 检查语法
[root@localhost myansible]# ansible-playbook --syntax-check lamp.yml

# 免密登陆
[root@localhost myansible]# ssh-keygen 
[root@localhost myansible]# for ip in 127.0.0.1 192.168.113.133
> do
> ssh-copy-id $ip
> done

# 执行
[root@localhost myansible]# ansible-playbook lamp.yml
```

## 编程

- 找到ansible的官方站点https://docs.ansible.com/ -> Ansible Documentation -> 2.7 -> 搜索python api
- 将搜索到python api页面中的代码示例拷贝到pycharm中

### 命名的元组

- 还是元组，元组的相关方法仍然可用
- 给每个元组的下标起名，可以通过下标的名字访问对应的值

```python
>>> from collections import namedtuple
>>> user = namedtuple('user', ['name', 'age', 'email', 'qq'])
>>> tom = user('Tom Smith', 20, 'tom@tedu.cn', '13435435')
>>> type(tom)
<class '__main__.user'>
>>> tom[:2]   # 元组取切片
('Tom Smith', 20)
>>> tom[2]    # 通过下标该问值
'tom@tedu.cn'
>>> tom.name  # 也可以通过下标的名字访问值
'Tom Smith'
>>> tom.qq
'13435435'
>>> len(tom)
4
```

> 如果ansible连接远程服务器时，使用的是普通用户，执行命令需要提权，做法如下：
>
> ```shell
> [root@localhost myansible]# vim ansible.cfg
> [defaults]
> inventory = hosts
> remote_user = tom
>
> [privilege_escalation]
> become = yes
> become_user = root
> become_method = sudo
> become_ask_pass = no
>
> # 在远程主机配置sudo
> [root@localhost myansible]# visudo
> tom     ALL=(ALL)   NOPASSWD: ALL
> ```

### yaml转换为python的数据类型

```yaml
[root@localhost myansible]# cat lamp.yml 
---
- name: configure dbservers
  hosts: dbservers
  tasks:
    - name: install mariadb
      yum:
        name: mariadb-server
        state: present
    - name: start mariadb
      service:
        name: mariadb
        state: started
        enabled: yes

- name: configure webservers
  hosts: webservers
  tasks:
    - name: install httpd
      yum:
        name: httpd
        state: present
    - name: start httpd
      service:
        name: httpd
        state: started
        enabled: yes
```

```python
[
    {
        'name': 'configure dbservers',
        'hosts': 'dbservers',
        'tasks': [
            {
                'name': 'install mariadb',
                'yum': {
                    'name': 'mariadb-server',
                    'state': 'present'
                }
            },
            {
                'name': 'start mariadb',
                'service': {
                    'name': 'mariadb',
                    'state': 'started',
                    'enabled': 'yes'
                }
            }
        ]
    },
    {
        'name': 'configure webservers',
        'hosts': 'webservers',
        'tasks': [
            {
                'name': 'install httpd',
                'yum': {
                    'name': 'httpd',
                    'state': 'present'
                }
            },
            {
                'name': 'start httpd',
                'service': {
                    'name': 'httpd',
                    'state': 'started',
                    'enabled': 'yes'
                }
            }
        ]
    }
]
```

- 使用ansible-vault加解密

```shell
[root@localhost myansible]# cp /etc/passwd /tmp/
[root@localhost myansible]# cat /tmp/passwd 
# 加密
[root@localhost myansible]# ansible-vault encrypt /tmp/passwd
New Vault password: tedu.cn
Confirm New Vault password: tedu.cn 
[root@localhost myansible]# cat /tmp/passwd 
# 解密
[root@localhost myansible]# ansible-vault decrypt /tmp/passwd
Vault password: 
[root@localhost myansible]# cat /tmp/passwd
```

### ansible-cmdb插件

```shell
# 收集被管理的主机信息，将内容写到/tmp/nsd1909目录下
[root@localhost myansible]# ansible all -m setup --tree /tmp/nsd1909

# 安装ansible-cmdb
[root@localhost myansible]# pip3 install ansible-cmdb

[root@localhost myansible]# which ansible-cmdb
/usr/local/bin/ansible-cmdb
[root@localhost myansible]# vim $(which ansible-cmdb)  # 修改第8行为以下内容
PY_BIN=$(which python3)

# 使用ansbile-cmdb分析/tmp/nsd1909目录下的文件，生成html网页
[root@localhost myansible]# ansible-cmdb /tmp/nsd1909/ > /tmp/hosts.html

# 查看页面
[root@localhost myansible]# firefox /tmp/hosts.html &
```

### 编写模块

- 定义自定义模块路径

```shell
[root@localhost ~]# mkdir /opt/mymodules
[root@localhost myansible]# export ANSIBLE_LIBRARY=/opt/mymodules
```

- 编写模块

```python
# /opt/mymodules/rcopy.py
from ansible.module_utils.basic import AnsibleModule
import shutil

def main():
    # yuan和mubiao就是ansible命令中-a中的选项
    module = AnsibleModule(
        argument_spec=dict(
            yuan=dict(required=True, type='str'),
            mubiao=dict(required=True, type='str')
        )
    )
    shutil.copy(module.params['yuan'], module.params['mubiao'])
    module.exit_json(changed=True)

if __name__ == '__main__':
    main()
```

- 调用自己写的模块执行任务

```shell
[root@localhost myansible]# ansible dbservers -m rcopy -a "yuan=/etc/hosts mubiao=/tmp/zhuji"
```

- 编写download模块

```python
# /opt/mymodules/download.py
from ansible.module_utils.basic import AnsibleModule
import wget

def main():
    module = AnsibleModule(
        argument_spec=dict(
            url=dict(required=True, type='str'),
            dst=dict(required=True, type='str')
        )
    )
    wget.download(module.params['url'], module.params['dst'])
    module.exit_json(changed=True)

if __name__ == '__main__':
    main()

# 如果python2中没有wget，需要安装
[root@localhost myansible]# pip install wget

[root@localhost myansible]# ansible webservers -m download -a "url=http://n.sinaimg.cn/ent/4_img/upload/90ccc1d5/341/w1242h699/20200223/e38f-ipvnszf1053648.jpg dst=/tmp/g.jpg"
```







