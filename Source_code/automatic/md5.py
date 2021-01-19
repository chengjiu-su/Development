import hashlib
from shutil import copyfile

def get_file_md5(f):
    m = hashlib.md5()
    while True:
        data = f.read(1024)
        if not data:
            break
        m.update(data)
    return m.hexdigest()

f_1 = '/home/chengjiu_su/PycharmProjects/test/test.txt'
f_2 = '/home/chengjiu_su/PycharmProjects/test/test_old.txt'

with open('/home/chengjiu_su/PycharmProjects/test/test.txt', 'rb') as f1, open('/home/chengjiu_su/PycharmProjects/test/test_old.txt', 'rb') as f2:
    file1_md5 = get_file_md5(f1)
    file2_md5 = get_file_md5(f2)
    print('file1_md5:',file1_md5)
    print('file2_md5:',file2_md5)
    if file1_md5 != file2_md5:
        print('file has changed')
    else:
        print('file not changed')
copyfile(f_1,f_2)

