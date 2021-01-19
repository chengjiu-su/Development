```python
import logging
import os
import subprocess
import pymysql
import time

# 设置日志输出格式
logging.basicConfig(format='%(asctime)s - %(pathname)s[line:%(lineno)d] - %(levelname)s: %(message)s',
                    level=logging.INFO)

# MySQL数据库用户名
MYSQL_USERNAME = 'ltnz'
# 数据库密码
MYSQL_PASSWORD = 'ltnz'
# 数据库主机地址
MYSQL_HOST = '127.0.0.1'
# 数据库端口
MYSQL_PORT = 3306
# 备份文件存放路径
Date = time.strftime("%Y-%m-%d")
BACKUP_PATH = '/data/backup_db/{date}'.format(date=Date)
# 排除，不进行备份操作的数据库名称集合
DISABLED_DATABASES = {'information_schema', 'ltnz_test_1'}

def mkdir(path):
    # 去除首位空格
    path = path.strip()
    # 判断路径是否存在
    # 存在     True
    # 不存在   False
    isExists = os.path.exists(path)
    # 判断结果
    if not isExists:
        """
        如果不存在则创建目录
        Args:
          path: 创建备份路径操作函数
        """
        os.makedirs(path)
        print('备份路径创建成功,开始执行数据备份')
        return True
    else:
        # 如果目录存在则不创建，并提示目录已存在
        print('备份路径已存在,开始执行数据备份')
        return False

# 定义要创建的目录
mkpath = "%s" % (BACKUP_PATH)
# # 调用函数
# mkdir(mkpath)

def create_mysql_conn(db='ltnz_test_1'):
    """
    创建并返回一个数据库连接
    Args:
        db: 要连接的数据库名称
    Returns:

    """
    conn = pymysql.connect(host=MYSQL_HOST, port=MYSQL_PORT, user=MYSQL_USERNAME, password=MYSQL_PASSWORD, db='ltnz_test_1')
    return conn


def read_all_databases():
    """
    从数据库中读取全部数据库名称
    Returns:
        list,数据库名称列表
    """
    logging.info('读取全部数据库名称...')
    conn = create_mysql_conn()
    cursor = conn.cursor()
    # 查询服务器上有哪些数据库
    cursor.execute('show databases')
    res = cursor.fetchall()
    databases = {item[0] for item in res}
    # 排除掉指定不备份的数据库
    databases = list(databases - DISABLED_DATABASES)
    """
    # 指定备份的数据库 上面是遍历所有数据库，排除指定不备份数据库
    #databases = list(DISABLED_DATABASES)
    """
    cursor.close()
    conn.close()
    logging.info('读取完毕，数据库列表如下：{}'.format(databases))
    return databases

def backup_database(database):
    """
    备份指定数据库的数据和表结构
    Args:
        database: 待备份的数据库名称
    """
    logging.info('开始备份数据库 {}...'.format(database))
    time.sleep(2)
    # 通过调用mysqldump完成指定数据库的备份                                                                      format 函数可以接受不限个参数，位置可以不按顺序
    command = 'mysqldump -h{host} -u{user} -p{password} -P{port} -t -c {database}  > {backup_path}/{database}.sql'.format(
                                                                                                            host = MYSQL_HOST,
                                                                                                            user = MYSQL_USERNAME,
                                                                                                            password = MYSQL_PASSWORD,
                                                                                                            port = MYSQL_PORT,
                                                                                                            database=database,
                                                                                                            backup_path=BACKUP_PATH
                                                                                                            )
    exit_code = subprocess.call(command, shell=True)
    # 判断命令是否正常执行，异常则直接抛出
    if exit_code != 0:
        raise Exception('在备份数据库的过程中出错，请检查！')
    logging.info('数据库 {} 备份完毕！'.format(database))

def backup():
    """
    读取全部数据库名称，并对这些数据库的数据和结构进行备份
    """
    # 检查备份路径是否存在，不存在则进行创建
    mkdir(mkpath)
    # 读取全部待备份数据库名称
    databases = read_all_databases()
    # 逐个对数据库进行备份
    for database in databases:
        backup_database(database)


def merge():
    logging.info('开始获取需要恢复的数据库文件...')
    files = list(os.listdir(BACKUP_PATH))

    logging.info('文件列表：{}'.format(files))

    # 开始逐个恢复数据库
    for file in files:
        logging.info('开始将数据 {} 合并至目标数据库...'.format(file.split('.')[0]))
        time.sleep(2)
        command = 'mysql -h{host}  -u{user} -p{password} -P{port} --verbose ltnz_test_1  < {path}/{file}'.format(host=MYSQL_HOST,
                                                                                                       user=MYSQL_USERNAME,
                                                                                                       password=MYSQL_PASSWORD,
                                                                                                       port=MYSQL_PORT,
                                                                                                       file=file,
                                                                                                       path=BACKUP_PATH)
        #subprocess.call(command, shell=True)
        exit_code = subprocess.call(command, shell=True)
        # 判断命令是否正常执行，异常则直接抛出
        if exit_code != 0:
            raise Exception('在合并数据库的过程中出错，请检查！')
    logging.info('完毕！')

if __name__ == '__main__':
    backup()
    merge()
```