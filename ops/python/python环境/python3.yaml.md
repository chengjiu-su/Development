```bash
#python 安装剧本
---
- hosts: "{{host}}"
  remote_user: root
  tasks:
    - name: create python path
      file:
        path: /usr/local/python
        state: directory
    - name: 安装python依赖
      yum:
        name: sqlite-devel,tk-devel,tcl-devel,readline-devel,zlib-devel,gcc,gcc-c++,openssl-devel,libffi-devel,libselinux-python
    - name: 解压python源码copy至remote_host
      unarchive:
        src: /data/packages/Python-3.6.11.tgz
        dest: /usr/local/python
        copy: yes
    - name: 更改python源码配置文件
      lineinfile:
        path: /usr/local/python/Python-3.6.11/Modules/Setup.dist
        regexp: "{{ item.regexp }}"
        line: "{{ item.line }}"
        backup: yes
      with_items:
        - name: open readline annotation
          regexp: '^#readline'
          line: 'readline readline.c -lreadline -ltermcap'
        - name: open SSL line annotation
          regexp: '^#SSL='
          line: 'SSL=/usr/local/ssl'
        - name: open _ssl line annotation
          regexp: '^#_ssl'
          line: '_ssl _ssl.c \'
        - name:  open -DUSE line annotation
          regexp: '^#\t-DUSE'
          line: '         -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \'
        - name: open -L$(SSL) line annotation
          regexp: '-lcrypto'
          line: '         -L$(SSL)/lib -lssl -lcrypto'
    - name: ./configure
      shell: cd /usr/local/python/Python-3.6.11/; ./configure --prefix=/usr/local/ --enable-optimizations --enable-shared
    - name: make && make install
      shell: cd /usr/local/python/Python-3.6.11/; . /etc/profile; make > make.log &&  make install > make_install.log
    - name: copy python3_lib.sh
      copy:
        src: /data/files/environment/python3_lib.sh
        dest: /etc/profile.d/
    - name: 刷新环境变量
      shell: source /etc/profile
```