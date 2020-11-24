# 目录结构

```
/bin 可执行文件，可在终端输入即可执行
/etc 	 配置文件
/home    除root用户的其他用户的家目录
/tmp     临时文件，系统运行时产生的临时文件
/mnt     外接设备需要挂载时，就挂在在这个目录
/opt	 用户自己下载的应用存在这(个人习惯)
```

# 常用命令

```bash
rsync -avPr 源文件 目标文件	//快速复制大文件
cat test1.txt test2.txt > test.txt //合并test1和test2到test,比如可制作马
df -h	//以较高可读性查看磁盘空间
管道 |：ls / | grep abc	//查询根目录下包含“abc”的文件，后面是在前面输出的基础上过滤的
top //动态展示进程占得资源，按M(MEM)表示按内存从高到低排列，P表示按CPU使用率从高到低排列
find 路径范围 -name 文件名称  //如find /etc -name *.conf
ps -ef	//查看进程信息，如查询appache的httpd服务是否开启，ps -ef | grep httpd
service 服务名 start/stop/restart	//如service httpd start
kill -9 进程id	//如kill 29867,进程id可通过top或ps -ef获得
killall 进程名称	//如killall httpd
ifconfig	//常用于查看ip信息，不一定只有两个
man 指令名		//用于查询某指令的用法，如man mv
tar -zxvf 压缩包	//解压压缩包
sudo dpkg -i test.deb	//安装deb包
export http_proxy="http://127.0.0.1:12333"	//终端暂时使用代理(推荐用proxychains)
chown -R 用户名 文件夹	//更改指定文件夹下所有文件所有者，
zip -r myFile.zip ./*  	//将当前所有文件压缩成zip包
alien xxx.rpm	//将rpm转换成deb
neofetch	//查看系统基本信息
```

# 使用技巧

- 使用**Ctrl+u删除光标前所有内容**，Ctrl+k删除光标后所有内容

- Ctrl+R输入执行命令的一部分选择提示的历史命令

- rm ~/.config/SweetScape/010\ Editor.ini  可无限试用010editor

- Navicat15破解：[点我查看](https://www.yuque.com/fank243/devops/crzwuq)

- ~/.local/share/applications/wine/Programs/下rm掉多余的wine软件菜单项，再到~/.config/menus/applications-merged/下去清理多余的垃圾。

- crontab可定时执行脚本

- 安装mysql:https://wangxin1248.github.io/linux/2018/07/ubuntu18.04-install-mysqlserver.html

- 终端暂时使用代理 proxychains + 命令

- 格式化U盘为ext4格式(timeshift备份到U盘)

  - \# 该命令查看你的设备
    lsblk -f

    \# 卸载U盘

    umount 你的U盘设备(如/dev/sdb1)

    \# 格式化成ext4格式
    mkfs.ext4 你的U盘设备(如/dev/sdb1)，之后等就行了
  
- 查看主目录下隐藏文件大小从大到小排序：du -sh .[!.]* | sort -hr

- 隐藏启动菜单指定图标：编辑图标添加NoDisplay=true

  

# 常用软件安装

- 安装Apache(推荐用Docker)

  - sudo apt install apache2

- 安装php(推荐用Docker)

  - sudo apt install php7.3 libapache2-mod-php7.3 php7.3-mysql	（7.3可以换成其他版本）

- 安装Docker：sudo apt install docker.io

  - 换源：sudo dedit /etc/docker/daemon.json(为空就新建) 添加

    {
      "registry-mirrors": ["https://vgpzl20e.mirror.aliyuncs.com"]
    }

  - 免sudo：sudo usermod -aG docker zss;sudo service docker restart;newgrp - docker
  
- 安装mysql(docker)：[点我查看](https://blog.csdn.net/zss192/article/details/105436623)

- 安装Apache和php(docker)：docker pull nimmis/apache-php7;docker run -d -p 80:80 -v /var/www/html:/var/www/html nimmis/apache-php7

# 常见问题解决方案

1.将一个py文件添加到bash直接在终端输入不用切换到想用目录

ln -s /opt/tools/dirsearch/dirsearch.py /bin/dirsearch   //在终端输入dirsearch即可运行这个py文件

2.deepin中默认的编辑器用dedit(ded按tab即可)

3.普通用户使用sudo免密码：dedit /etc/sudoers 修改your_user_name ALL=(ALL) NOPASSWD: ALL

4.sudoers文件修改错误导致无法使用sudo：pkexec 代替sudo更改sudoers文件

5.为bat文件创建含图标快捷方式：在/usr/bin下创建如burpsuite把bat文件复制粘贴(注意路径换成绝对路径)，这样就可在命令行直接运行bat文件，然后用桌面文件创建工具创建快捷方式即可

6.运行wine报错程序错误：删除~/.wine目录，然后运行winecfg（会重新生成.wine）

7.安装wine-mono和wine-gecko可去官网：https://dl.winehq.org/wine/安装msi文件，移动到/home/用户名/.wine目录下

```bash
wine  msiexec /i  wine-mono-4.9.4.msi  //例如安装wine-mono
```

8.qq无法加载图片

关闭ipv6

9.tmp下的mysql.sock文件被删，导致navicat打不开本地数据库

```bash
sudo /usr/local/mysql/support-files/mysql.server start  //启动mysql，重新生成mysql.sock文件
```

10.若有时pip安装失败可尝试在加上

```bash
-i http://pypi.douban.com/simple/ --trusted-host [pypi.douban.com](http://pypi.douban.com/)
```

11.鼠标变成十字架，无法使用鼠标

原因：在shell终端误输入了import命令

解决方法：ps -aux | grep import    找到对应pid,kill -9 pid 即可

12.运行py文件鼠标变十字架，无法使用鼠标

打开py文件，在最上方加上

```python
#!/usr/bin/env python3     //指定由哪个解释器来执行脚本
```

原因：python2和python3不兼容，加上这个就在输入./test.py默认由python3执行

13.应用选择默认程序页面没有我们想要的应用

打开/usr/share/applications找到比如typora

```
添加一行 MimeType=*/*  即可
```

14.telegram不要使用2.1.5的版本会出现无法输入中文的问题，使用2.1.4即可解决

15.更新最新版的QQ：将Windows的C:\Program Files (x86)\Tencent\QQ\下的文件覆盖~/.deepinwine/Deepin-QQ/drive_c/Program\ Files/Tencent/QQ/即可（先备份）

16.npm太慢可以用cnpm（镜像，第一次用要下载）

```
 npm install -g cnpm --registry=https://registry.npm.taobao.org
```

以后都可以用cnpm代替npm了

17.百度网盘无法登录

编辑百度网盘的图标把Exec内容前加上sudo(用管理员身份打开)

如果用的UTools，修改过图标后重启，UTools里打开才是修改后的

18.解决QQ崩溃问题(可减少崩溃次数)：

替换dwrite.dll，[点我下载](https://bbs.deepin.org/forum.php?mod=attachment&aid=OTg1MTJ8NjBlYzc3NTB8MTYwMTEwMzQxNnwwfDE5NjE4OQ%3D%3D)，解压后重命名为dwrite.dll然后替换~/.wine/drive_c/windows/system32/下的dwrite.dll。

之后在winecfg里面设置函数库添加dwrite，同时模拟windows版本只能设置成xp

19.无法弹出U盘(有程序正在使用)

```
df -h查看挂载点，例如/dev/sdb1
sudo fuser -mv /dev/sdb1查看U盘的uid，杀死这个进程
kill -9进程号
正常弹出U盘即可
```

20.不能自主降频的问题，导致风扇经常一直转

```bash
sudo apt install i7z
sudo i7z

安装tlp
sudo apt install tlp tlp-rdw
sudo tlp start
tlp-stat -s
启动之后再看一次i7z，完美解决。
sudo i7z
```


