上一节课我们学习了往dict中添加元素的方法，通过赋值语句就可以把元素添加到dict中去，但是赋值的时候，我们并不确定key是否已经在dict里面了，如果dict里面已经有对应的key了，那将会发生什么呢？
```python
d = {
    'Alice': 45,
    'Bob': 60,
    'Candy': 75,
    'David': 86,
    'Ellena': 49
}
d['Bob'] = 75
print(d)
# ==> {'Alice': 45, 'Bob': 75, 'Candy': 75, 'David': 86, 'Ellena': 49}
```
这个时候我们发现，原来Bob的成绩是60，现在变成75了，因为d['Bob'] = 75的缘故。
因此我们发现这个赋值语句其实有两个功能：

>当key不存在时，往dict中添加对应的key: value元素。
当key存在时，会更新dict，用新的value替换原来的value。
因此，在使用赋值语句往dict中添加元素时，为了避免不必要的覆盖问题，我们需要先判断key是否存在，然后再做更新。