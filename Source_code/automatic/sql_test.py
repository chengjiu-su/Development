import pymysql

# 建立连接
conn = pymysql.connect(host='127.0.0.1',
                       port=3306,
                       user='root',
                       passwd='123456',
                       db='t',
                       charset='utf8')
# 端口号3306，utf-8编码，否则中文有可能会出现乱码。
# 创建游标。游标类似于文件对象，通过文件对象可以对文件读写，通过游标对数据库进行操作
cur = conn.cursor()

# 编写并执行相应的sql语句

# order by 对查询结果进行排序 select 字段1,字段2,字段3 from 表名 order by 字段 desc(降序)||asc(升序)
select_a = """ select address,id from user order by id desc
"""
# 去重复查询 select distinct 字段 from 表名
select_b = """select distinct address from user
"""
# 精准查询 in 只查找括号内的数据； not in 则相反
select_c = """select * from user where ID in (1001,1003)
"""

# 精准查询 between and 查找1001-1003范围内的数据；not between and 相反
select_d = """select * from user where ID between 1001 and 1003
"""
# 模糊查询 like (% 代表任意字符 _ 代表单个字符)；not like相反
select_e = """select * from user where name like '_麻%'
"""

# 多条件查询 and 关键字
select_f = """select * from user where sex='女' and address='太古里77号'
"""

# 多条件查询 or 关键字 只需满足一个条件
select_g = """select * from user where name='su' or address='1' 
"""
#--------------------------------------------------------------------------------

# ------删除数据和更新数据 or,and,between and,like等关键字可以查询到多条数据然后批量删除或者更新-----------------------------------
# 删除数据
del_h = """delete from user where name='su' or address='1'
"""

# 更新数据
updata_j = """update user set name = '更新' where ID in (1005,1006)
"""

#cur.execute(mk_dep)   # execute -> 执行
cur.execute(select_a)
cur.execute(select_b)
cur.execute(select_c)
cur.execute(select_d)
cur.execute(select_e)
cur.execute(select_f)
cur.execute(select_g)
cur.execute(del_h)
cur.execute(updata_j)
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
