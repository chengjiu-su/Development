我们已经知道，List 和 tuple 可以用来表示顺序集合，例如，班里同学的名字：
```python
['Alice', 'Bob', 'Candy', 'David', 'Ellena'] # List
('Alice', 'Bob', 'Candy', 'David', 'Ellena') # tuple
```
或者考试的成绩：
```python
[45, 60, 75, 86, 49] # list
(45, 60, 75, 86, 49) # tuple
```
如果同学名字的列表和同学成绩的列表是一一对应的，那么通过下标，我们也可以找到每个同学的成绩。
```python
names = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
scores = [45, 60, 75, 86, 49]
index = 0
for name in names:
    score = scores[index]
    print('name = {}, score = {}'.format(name, score))
    index = index + 1
```
事实上，我们可以得到这样的映射。
```python
'Alice' ==> 45
'Bob' ==> 60
'Candy' ==> 75
'David' ==> 86
'Ellena' ==> 49
```
但是使用两个list，始终有些麻烦的，尤其是需要变换一个列表的顺序后，另外一个列表也需要做同样的变换，否则就可能出现对应不上的问题。
python的dict就是专门保存这种映射的，使用dict可以方便的保存“名字”->“成绩”的映射。
在dict中，每一项包含一个key和一个value，key和value是一一对应的，在解决上面的问题中，我们可以使用名字作为key，成绩作为value，那么dict的定义如下：
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49
}
```
在定义里，我们使用花括号{}表示这是一个dict，然后key和value之间使用冒号:分割，并且每一组key:value的最后，以逗号,表示这一组的结束。
我们也可以使用以下的方式定义一个dict。
```python
d = dict()
print(d) # ==> {}
```
不过这种定义方式，默认得到的是一个空dict，需要调用函数往里面添加数据，我们后面会继续学习。