import threading
import time
import hashlib
from shutil import copyfile

f_1 = '/home/chengjiu_su/PycharmProjects/test/test.txt'
f_2 = '/home/chengjiu_su/PycharmProjects/test/test_old.txt'
def get_file_md5(f):
    m = hashlib.md5()
    while True:
        data = f.read(1024)
        if not data:
            break
        m.update(data)
    return m.hexdigest()

def foo():
    print(time.ctime())
    # print(1)
    with open('/home/chengjiu_su/PycharmProjects/test/test.txt', 'rb') as f1, open('/home/chengjiu_su/PycharmProjects/test/test_old.txt', 'rb') as f2:
        file1_md5 = get_file_md5(f1)
        file2_md5 = get_file_md5(f2)
        print('file1_md5:',file1_md5)
        print('file2_md5:',file2_md5)
        if file1_md5 != file2_md5:
            print('file has changed')
            print('-------------------')
        else:
            print('file not changed')
            print('======================')
        copyfile(f_1,f_2)
WAIT_TIME_SECONDS = 5

ticker = threading.Event()
while not ticker.wait(WAIT_TIME_SECONDS):
    foo()