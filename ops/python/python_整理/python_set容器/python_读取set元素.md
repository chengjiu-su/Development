由于set里面的元素是没有顺序的，因此我们不能像list那样通过索引来访问。访问set中的某个元素实际上就是判断一个元素是否在set中，这个时候我们可以使用in来判断某个元素是否在set中。
比如，存储了班里同学名字的set。
```python
names = ['Alice', 'Bob', 'Candy', 'David', 'Ellena']
name_set = set(names)
```
请问'Alice'是班里面的同学吗？
```python
'Alice' in name_set # ==> True
```
请问'Bobby'是班里面的同学吗？
```python
'Bobby' in name_set # ==>False
```
请问'bob'是班里面的同学吗？
```python
'bob' in name_set # ==> False
```
这个时候是否输出了不符合预期的结果？'Bob'是在name_set里面的，为什么输出了False呢？这是因为set元素是区分大小写的，必须大小写完全匹配，才能判断该元素在set里面。