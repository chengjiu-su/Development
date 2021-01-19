有时候，一维list并不能满足所有的要求（上述所有list均为一维list），这个时候需要二维list甚至更高维的list。
##### 比如：
>Alice最近的三次成绩分别是[100, 89, 92]
Bob最近的三次成绩分别是[70, 65, 81]
Candy最近的三次成绩分别是[88, 72, 77]
如果需要用一个列表存放三个同学的成绩，则需要这样：
```python
alice_scores = [100, 89, 92]
bob_scores = [70, 65, 81]
candy_scores = [88, 72, 77]
all_scores = [alice_scores, bob_scores, candy_scores]
print(all_scores) # ==> [[100, 89, 92], [70, 65, 81], [88, 72, 77]]
````
这个时候得到的就是一个二维list，对于二维list，列表里面的每一个元素仍然是一个列表。这个时候，如果需要从二维list all_scores获取Bob最近第三次考试的成绩，可以这样写
```python
alice_scores = [100,89,92]
bob_scores = [70,65,81]
candy_scores = [88,72,77]
all_scores = [alice_scores, bob_scores, candy_scores]
score = all_scores[1][2] # ==> 81
```
其中all_scores[1]得到Bob的最近三次成绩的列表，再通过下标[2]，则可以得到Bob第三次的成绩。