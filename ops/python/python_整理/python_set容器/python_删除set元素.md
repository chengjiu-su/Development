和list、dict一样，有时候我们也需要考虑删除set的元素。
set提供了remove()方法允许我们删除set中的元素。
```python
name_set = set(['Jenny', 'Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
name_set.remove('Jenny')
print(name_set) # ==> set(['Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
````
需要注意的是，如果remove的元素不在set里面的话，那么将会引发错误。
```python
name_set = set(['Jenny', 'Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
name_set.remove('Jenny')
print(name_set) # ==> set(['Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
name_set.remove('Jenny') # ==> 重复remove 'Jenny'
```
 引起错误
```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'Jenny'
```
因此，使用remove()方法，我们需要格外小心，需要提前判断要remove()的元素是否在set里面，确保存在后，再进行remove。