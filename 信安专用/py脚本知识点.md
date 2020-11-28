1.两个列表(list)组成字典(dict)

```
keys = ['a', 'b', 'c'] 
values = [1, 2, 3]
dicts = dict(zip(keys, values))
```

2.字典取值

```python
temp=dicts.get(chiper[i][0])   #也可dicts['a'],但这个里面有[],所以用get
```

3.从文件读取数值

```python
fp = open('out.txt','r')
a = fp.readlines()	#a为列表
```

4.列表

```python
空列表：ls=[]
列表添加元素：ls.append(3)
```

5.进制转换

```python
二转十：int('011',2)
十转二： bin(10)

十六转十：int("0xA",16)
十转十六：hex(1033)

十转ascii：chr(int(i))
```

6.unicode转中文

```python
s = '\u82e6\u6d77\u65e0\u6daf\u56de\u5934\u662f\u5cb8' 
print(s.encode("utf-8").decode("unicode_escape"))   #苦海无涯回头是岸
```

```python
s = u'\u82e6\u6d77\u65e0\u6daf\u56de\u5934\u662f\u5cb8' 
print(s) 苦海无涯回头是岸
```

