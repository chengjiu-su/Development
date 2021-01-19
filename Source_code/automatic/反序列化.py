# f = open("test.text", 'r')
#
# data = eval(f.read() )
# f.close()
# print(data)
# print(data['age'])

import json

f = open("test.text", 'r')
data = json.load(f) #data = json.loads(f.read())

print(data)
f.close()
