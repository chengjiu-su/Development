不会报错的删除方法discard()
除了使用remove()方法删除元素以外，还可以使用discard()方法删除元素，并且，和remove()不同的是，当元素不存在时，使用discard()并不会引发错误，所以使用discard()是更加高效的一个方法。
```python
name_set = set(['Jenny', 'Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
name_set.discard('Jenny')
print(name_set) # ==> set(['Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
name_set.discard('Jenny')
print(name_set) # ==> set(['Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl']
```
清除所有元素的方法clear()
和dict一样，set也提供了clear()方法，可以快速清除set中的所有元素。
```python
name_set = set(['Jenny', 'Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
print(name_set) # ==> set(['Jenny', 'Ellena', 'Alice', 'Candy', 'David', 'Hally', 'Bob', 'Isen', 'Karl'])
name_set.clear()
print(name_set) # ==> set([])
```
集合的子集和超集
set提供方法判断两个set之间的关系，比如两个集合set，判断其中一个set是否为另外一个set的子集或者超集。
```python
s1 = set([1, 2, 3, 4, 5])
s2 = set([1, 2, 3, 4, 5, 6, 7, 8, 9])
```
判断s1是否为s2的子集
```python
s1.issubset(s2) # ==> True
```
判断s2是否为s1的超集
```python
s2.issuperset(s1) # ==> True
```
判断集合是否重合
有时候需要判断两个集合是否有重合的地方，如果使用传统的方法，需要使用for循环一个一个的去判断，非常麻烦，set提供isdisjoint()方法，可以快速判断两个集合是否有重合，如果有重合，返回False，否则返回True。
```python
s1 = set([1, 2, 3, 4, 5])
s2 = set([1, 2, 3, 4, 5, 6, 7, 8, 9])
s1.isdisjoint(s2) # ==> False，因为有重复元素1、2、3、4、5
```