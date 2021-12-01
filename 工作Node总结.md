1.json有两种数据类型

- {}是对象，取值使用 objcet.key

- []是数组，取值使用索引访问 [index]

2.对js对象转换成json字符串输出

```typescript
console.log(JSON.stringify(obj));
```

3.json字符串转换为js对象

```typescript
JSON.parse(str) // 数组"[]"和对象“{}”都要先转换
```

4.json和js对象的区别

```typescript
let obj1={width:100,height:200}; //JS的对象
let obj2={'width':100,'height':200}; //JS的对象
let obj3={"width":100,"height":200}; //JSON格式的js对象，可以用obj3.width取值
var str1='{"width":100,"height":200}'; //JSON格式的字符串，必须用JSON.parse()转换再取值
```

- 区别：json仅仅是一种数据格式，而js对象表示类的实例

- 辨别：json键必须加**双**引号，而js对象键不加双引号，可以用这来判断是不是json

5.for..of 和 for..in 语句

- for..in迭代的是对象的键 的列表

- for..of则迭代对象的键对应的值。

```typescript
let list = [4, 5, 6];
for (let i in list) {console.log(i);} // "0", "1", "2",
for (let i of list) {console.log(i);} // "4", "5", "6"
```

6.map()和forEach()

- forEach()和map()都只能遍历数组，若遍历对象可以用for in或for of
- 都支持三个参数：当前项item、当前项索引index、原始数组arr
- forEach()不会返回数据（不修改数据用这个），而`map()`会返回一个新的数组（修改数据用这个）
