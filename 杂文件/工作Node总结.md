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
- forEach()不会返回数据；而`map()`会返回一个新的数组，用变量接收进行后续操作

7.增删改查

```typescript
// 增：示例文件/user/jwb/salary/addSalaryOtherItem
let item = await util.Model.salary.salary_other_item.create({
    branch_id: branch_id,
    title: title,
    state: 0,
    create_at: util.changeTimeZone.getChinaTime(new Date()),
    update_at: util.changeTimeZone.getChinaTime(new Date()),
});
util.ResponseWithData(ctx, item);
```

```typescript
// 改：示例文件/card/b/team/hideTeam
// 先查一个，再update更改
let team = await util.Model.Team.findOne({
        where: {
            branch_id: branch_id,
            id: team_id,
            del: 0
        },

    });
await team.update({
            card_open: 2
    });

```

```typescript
// 删：示例文件/user/jwb/erp_inv/change/deleteChange
// 删除项目不是用delete删除，而是更新字段用来代表已经删除
let finance = await util.Model.jwb.finance.findOne({
    where: {
        id: change.finance_id,
        del: 0,
        branch_id: branch_id,
    }
});
await finance.update({
            del: 1,
            del_time: util.changeTimeZone.getChinaTime(new Date()),
        });
```

```typescript
// 查：示例文件/internal/report/branchWeekReport
// 查找一个用findOne查找多个用findAll
let lessons = await util.Model.Lesson.findAll({
    attributes: ['id', 'cal_id', 'sign', 'wipe', 'price'],
    where: {
        branchId: branch_id,
        cal_id: {
            [sequelize.Op.in]: cal_ids,
        },
        del: 0,
    }
});
// 有时需要取下dataValues才是真正的数据
lessons = lessons.map(item => item.dataValues);
```

8.获取变量类型

```typescript
let a=1;
console.log(typeof a);
```



















































```typescript

```
