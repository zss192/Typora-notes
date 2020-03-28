# 目录结构

```
/usr/bin 可执行文件，可在终端输入即可执行
/etc 	 配置文件
/home    除root用户的其他用户的家目录
/tmp     临时文件，系统运行时产生的临时文件
/mnt     外接设备需要挂载时，就挂在在这个目录
/opt	 用户自己下载的应用存在这(个人习惯)
```

# 常用命令

```bash
cat test1.txt test2.txt > test.txt //合并test1和test2到test,比如可制作马
df -h	//以较高可读性查看磁盘空间
管道 |：ls / | grep abc	//查询根目录下包含“abc”的文件，后面是在前面输出的基础上过滤的
top //动态展示进程占得资源，按M(MEM)表示按内存从高到低排列，P表示按CPU使用率从高到低排列
find 路径范围 -name 文件名称  //如find /etc -name *.conf
ps -ef	//查看进程信息，如查询appache的httpd服务是否开启，ps -ef | grep httpd
service 服务名 start/stop/restart	//如service httpd start
kill 进程id	//如kill 29867,进程id可通过top或ps -ef获得
killall 进程名称	//如killall httpd
ifconfig	//常用于查看ip信息，不一定只有两个
man 指令名		//用于查询某指令的用法，如man mv
tar -zxvf 压缩包	//解压压缩包
sudo dpkg -i test.deb	//安装deb包
export http_proxy="http://127.0.0.1:12333"	//终端暂时使用代理
chown -R 用户名 文件夹	//更改指定文件夹下所有文件所有者，
```

# 使用技巧

- 使用**Ctrl+u删除光标前所有内容**，Ctrl+k删除光标后所有内容
- rm ~/.config/SweetScape/010\ Editor.ini  可无限试用010editor

# 常见问题解决方案

1.将一个py文件添加到bash直接在终端输入不用切换到想用目录

ln -s /opt/dirsearch/dirsearch.py /bin/bash/dirsearch   //在终端输入dirsearch即可运行这个py文件

2.deepin中默认的编辑器用dedit(ded按tab即可)

3..普通用户使用sudo免密码：vi /etc/sudoers 修改your_user_name ALL=(ALL) NOPASSWD: ALL

4.sudoers文件修改错误导致无法使用sudo：pkexec 代替sudo更改sudoers文件

5.为bat文件创建含图标快捷方式：在/usr/bin下创建如burpsuite把bat文件复制粘贴(注意路径换成绝对路径)，这样就可在命令行直接运行bat文件，然后用桌面文件创建工具创建快捷方式即可

6.运行wine报错程序错误：删除/~.wine目录，然后运行winecfg（会重新生成.wine）

7.安装wine-mono和wine-gecko可去官网：https://dl.winehq.org/wine/安装msi文件，移动到/home/用户名/.wine目录下

```bash
wine  msiexec /i  wine-mono-4.9.4.msi  //例如安装wine-mono
```

8.qq无法加载图片

打开/etc/sysctl.conf 在末尾加上下面代码

```
# IPv6 disabled net.ipv6.conf.all.disable_ipv6 =1 net.ipv6.conf.default.disable_ipv6 =1 net.ipv6.conf.lo.disable_ipv6 =1
```

