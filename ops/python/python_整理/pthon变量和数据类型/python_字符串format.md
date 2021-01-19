>Python的字符串format
字符串是Python程序重要的数据类型，到目前为止，我们输出的字符串的内容都是固定的，但有时候通过字符串输出的内容不是固定的，这个时候需要使用format来处理字符串，输出不固定的内容。
字符串format由两个部分组成，字符串模板和模板数据内容组成，通过大括号{}，就可以把模板数据内容嵌到字符串模板对应的位置。
字符串模板
```python
template = 'Hello {}'
```
模板数据内容
```python
world = 'World'
result = template.format(world)
print(result) # ==> Hello World
```
如果模板中{}比较多，则容易错乱，那么在format的时候也可以指定模板数据内容的顺序。

指定顺序
```python
template = 'Hello {0}, Hello {1}, Hello {2}, Hello {3}.'
result = template.format('World', 'China', 'Beijing', 'imooc')
print(result) # ==> Hello World, Hello China, Hello Beijing, Hello imooc.
```
调整顺序
```python
template = 'Hello {3}, Hello {2}, Hello {1}, Hello {0}.'
result = template.format('World', 'China', 'Beijing', 'imooc')
print(result) 
# ==> Hello imooc, Hello Beijing, Hello China, Hello World.
```
除了使用顺序，还可以指定对应的名字，使得在format过程更加清晰。

指定{}的名字w,c,b,i
```python
template = 'Hello {w}, Hello {c}, Hello {b}, Hello {i}.'
world = 'World'
china = 'China'
beijing = 'Beijing'
imooc = 'imooc'
```
指定名字对应的模板数据内容
```python
result = template.format(w = world, c = china, b = beijing, i = imooc)
print(result) # ==> Hello World, Hello China, Hello Beijing, Hello imooc.
```