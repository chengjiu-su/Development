# info = {
#     'name': "chengjiu",
#     'age': 21
# }
#
# f = open("test.text", 'w')
#
# f.write(str(info))
# f.close()

# import json
#
# # def sayhi(name):
# #     print('hello',name)
# info = {
#     'name': "chengjiu",
#     'age': 21,
#     #'func': sayhi
# }
#
# f = open("test.text", 'w')
# f.write( json.dumps(info))
# print( json.dumps(info))
#
# # f.write(str(info))
# f.close()

import json

info = {
    'name': "chengjiu",
    'age': 21,
}

f = open("test.text", 'w')
f.write( json.dumps(info))
print( json .dumps(info))

info['age'] = 20
f.write( json.dumps(info))
print( json .dumps(info))
f.close()

















