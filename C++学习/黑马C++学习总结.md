视频地址：[2017 黑马 C++ 教学视频](https://www.bilibili.com/video/BV1Tb411j7uM/)

# 第一天

1.C++头文件为什么没有.h（P3 1-3）

答：C语言中头文件拓展名使用.h，而C++没有使用这种方法，而是加上前缀c

例如，c版本中的math.h在C++中是cmath

2.作用域运算符::（P4 1-4）

- ::可以用来解决局部变量与全局变量的命名问题

- ```c++
  int a = 10;
  int main()
  {
      int a = 20;
      cout << "局部变量a为" << a << endl;
      cout << "全局变量a为" << ::a << endl;
      return 0;
  }
  ```

3.命名空间namesapce（P5 1-5）

- 用途：解决大规模程序中名称冲突问题

- 必须在全局作用域下声明

- 命名空间下可以放入 函数、变量、结构体、类…

- 命名空间可以嵌套命名空间

- 命名空间是开放的，可以加入新的成员

  - ```C++
    namespace lol{int atk = 10;}
    namespace lol{int wake = 20;}
    ```

- 声明和实现可以分离

- 无名/匿名命名空间相当于加了static，只能在本文件内访问

  - ```c++
    namespace{int atk = 10;}
    ```

- 可以起别名

  - ```c++
    namespace shortName=veryLongName
    ```

4.using声明（P6 1-6）

- ```c++
  // using声明可以使得指定的标识符可用
  namespace lol
  {
      int atk = 10;
      int wake = 20;
  }
  int main()
  {
      using lol::atk;
      cout << atk << endl;
      // cout << wake << endl;    // 没有声明，无法访问
      // int atk = 30;   // 同名冲突，编译器不知道是namespace里的atk还是局部变量atk
  }
  ```

- 命名空间里如果有一组同名的函数重载，using声明后即声明了所有同名函数

5.using编译指令（P6 1-6）

```c++
namespace lol{int atk = 10;}
int main()
{
    using namespace lol;
    cout << atk << endl;	// 10
    int atk = 20;
    cout << atk << endl;    // 20，不会产生同名冲突
    // 如果using另一个命名空间，其里面也有atk变量，则会产生二义性(命名冲突)
}
```

6.C++相较于C的增强（P7 1-7）

- 全局变量检测增强

  - ```C++
    // 下列代码C可编译通过，而C++无法编译通过
    // 注意仅在全局作用域下C可编译通过，main等函数里面还是无法编译通过
    int a=10;   // 赋值，当做定义
    int a;  // 没有赋值，当做声明
    ```

- 函数检测增强

  - 参数类型检测

    - ```c++
      int test(w, h){}	// C中没写类型可以是任何类型，而C++无法编译通过
      ```

    - C语言中int fun()表示返回值为int接受任意参数，int fun(void)表示返回值为int的无参函数
    - C++中int fun()和int fun(void)都表示返回值为int的无参参数

  - 传参个数检测

    - ```c++
      // C语言中可传多个参数，而C++不行
      int test(w, h){}
      test(10,10,10)
      ```

  - 返回值检测

    - 视频中C++的函数必须要有返回值，而我在自己电脑上(g++ (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0)编译并没报错，只是warning

- 类型转换检测增强

  - ```c++
    // malloc返回void* ，C中可以不用强转，C++必须强转
    char *p=malloc(sizeof(64));
    ```

- struct增强
  - C中struct内不许有函数 而C++可以
  - C必须加关键字 struct(struct Person P1) ，C++可以不加(Person P1) 
- bool数据类型增强
  - C中没有bool类型，而C++中有，true为真(非0)，false为假(0)

- 三目运算符增强

  - ```c++
    // C中返回的是值，而C++中返回的是变量
    int a = 10, b = 20;
    a > b ? a : b = 30; // 相当于b=30
    ```

7.const增强（P8 1-8）

- C和C++中const全局变量是真常量。C中的const局部变量是伪常量，会分配内存，可以通过指针修改，而C++中的局部const变量不会分配内存而是放到符号表中无法通过指针修改

  - 通过指针去修改C++中的const变量实际是修改的临时开辟内存空间的地址内容，而C++还是会根据符号表取值，所以依然无法修改数值

  - ```c++
    int tmp = a;	// tmp会分配内存
    int *p = (int *)&tmp;	// *p指的是临时的空间，临时空间看不到
    ```

- C中的const默认为外部链接，而C++中的const默认为内部链接(声明时加上extern提高作用域变成外部链接)

  - ```c++
    const int a=10;
    // 另一个文件
    extern const int a;	// 告诉编译器去其他外部文件寻找变量a
    cout << a <<endl;	// 外部链接时能找到a，而内部链接时上面定义的a=10只在它那个文件内有效
    ```

- C++中会分配内存的情况

  - 对变量取地址，会分配临时内存(如const增强中的第一点)

  - extern关键字下的const会分配内存(extern const int a;)

  - 用普通变量初始化const变量

    - ```c++
      int a = 10;
      const int b = a;	// 会给b分配内存
      int *p = (int *)&b;	// 既然分配了内存，那就可以通过指针修改其内容
      *p = 20;
      cout << b << endl;	// 20
      ```

  - 自定义数据类型会分配内存，比如struct结构体

- 尽量用const替代#define

  - const有类型，编译器可以进行安全检查。#define无类型，预处理阶段就处理好了，编译器实际上并未看到宏，因此不能进行安全检查
  - const有作用域，而#define不重视作用域，默认定义处到文件结尾，可以通过#undef手动卸载宏



















