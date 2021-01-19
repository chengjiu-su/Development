import logging
import os
import subprocess
# import pymysql
import time
import sys

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

def mkdir(path):
    # 去除首位空格
    path = path.strip()
    # 判断路径是否存在
    isExists = os.path.exists(path)
    # 判断结果
    if not isExists:
        """
        如果不存在则创建目录
        Args:
          path: 创建备份路径操作函数
        """
        os.makedirs(path)
        # print('备份路径创建成功,开始执行数据备份')
        return True
    else:
        # 如果目录存在则不创建，并提示目录已存在
        # print('备份路径已存在,开始执行数据备份')
        return False


def backup_database(database):
    """
    备份指定数据库的数据和表结构
    Args:
        database: 待备份的数据库名称
    """
    logging.info('\033[1;30m 开始备份数据库 {}...\033[0m'.format(database))
    time.sleep(2)
    # 通过调用mysqldump完成指定数据库的备份                                                                      format 函数可以接受不限个参数，位置可以不按顺序
    command = 'mysqldump -h{host} -u{user} -p{password} -t -c --no-tablespaces {database}  > {backup_path}/{database}.sql'.format(
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
        raise Exception('\033[1;35m在备份数据库的过程中出错，请检查！\033[0m')
    logging.info('\033[32m 数据库 {} 备份完毕！\033[0m'.format(database))

def backup(*sou_databases):
    """
    读取全部数据库名称，并对这些数据库的数据和结构进行备份
    """
    # 检查备份路径是否存在，不存在则进行创建
    mkdir(mkpath)
    # 读取全部待备份数据库名称
    databases = sou_databases
    # 逐个对数据库进行备份
    for database in databases:
        logging.info('\033[1;35m对源数据库 {} 进行数据查询\033[0m'.format(database))
        command3 = 'bash  /data/shells/sql_inquiry.bash %s' % database
        subprocess.call(command3,shell=True)
        backup_database(database)

def merge():
    logging.info('\033[34m开始获取需要恢复的数据库文件...\033[0m')
    files = list(os.listdir(BACKUP_PATH))

    logging.info('\033[34m文件列表：{}\033[0m'.format(files))
    dest_database = sys.argv[1]
    logging.info('\033[1;35m对目标数据库 {} 进行数据查询\033[0m'.format(dest_database))
    command4 = 'bash /data/shells/sql_inquiry.bash %s' % dest_database
    subprocess.call(command4, shell=True)
    # 开始逐个恢复数据库
    for file in files:
        logging.info('\033[33m开始将数据 {}库,合并至目标%s数据库...\033[0m'.format(file.split('.')[0]) % dest_database)
        time.sleep(2)
        command = 'mysql -h{host}  -u{user} -p{password}   {dset_database}  < {path}/{file}'.format(host=MYSQL_HOST,
                                                                                                       user=MYSQL_USERNAME,
                                                                                                       password=MYSQL_PASSWORD,
                                                                                                       port=MYSQL_PORT,
                                                                                                       file=file,
                                                                                                       path=BACKUP_PATH,
                                                                                                       dset_database=dest_database
                                                                                                    )
        exit_code = subprocess.call(command, shell=True)
        # 判断命令是否正常执行，异常则直接抛出
        if exit_code != 0:
            raise Exception('\033[31m在合并数据库的过程中出错，请检查！\033[0m')
    logging.info('\033[1;35m对目标数据库 {} 进行最终数据查询\033[0m'.format(dest_database))
    command5 = 'bash /data/shells/sql_inquiry.bash %s' % dest_database
    subprocess.call(command5, shell=True)
    logging.info('\033[32m完毕！\033[0m')

if __name__ == '__main__':
    # 定义要创建的目录
    mkpath = BACKUP_PATH
    mkdir(mkpath)
    #备份源数据库
    backup('ltnz_test_2','ltnz_test_3','ltnz_test_4','ltnz_test_5')
    #想目标数据库合并数据
    merge()