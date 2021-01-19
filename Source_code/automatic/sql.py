import pymysql
#import paramiko

# 建立连接
#pkey = paramiko.RSAKey.from_private_key_file('/home/chengjiu_su/.ssh/id_rsa')
conn = pymysql.connect(host='127.0.0.1',
                       port=3306,
                       user='ltnz',
                       passwd='ltnz',
                       db='ops',
                       charset='utf8')
# 端口号3306，utf-8编码，否则中文有可能会出现乱码。
# 创建游标。游标类似于文件对象，通过文件对象可以对文件读写，通过游标对数据库进行操作
cur = conn.cursor()

# 编写并执行相应的sql语句
select_1 = """show databases;
"""
cur.execute(select_1)
#确认
conn.commit()

# 使用fetchall()方法获取查询结果 (接收全部的返回结果)
data = cur.fetchall()
print(data)

# 解决游标遍历慢的方法：一行一行去遍历，而不是一下全部读取出来
# for i in cur:
#     print (i)

# 关闭游标、关闭连接
cur.close()
conn.close()