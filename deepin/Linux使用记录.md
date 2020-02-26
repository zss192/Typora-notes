1.将一个py文件添加到bash直接在终端输入不用切换到想用目录

ln -s /opt/dirsearch/dirsearch.py dirsearch   //在终端输入dirsearch即可运行这个py文件

2.deepin中默认的编辑器用dedit(ded按tab即可)

3.普通用户使用sudo免密码：vi /etc/sudoers 修改your_user_name ALL=(ALL) NOPASSWD: ALL

4.sudoers文件修改错误导致无法使用sudo：pkexec 代替sudo更改sudoers文件

5.为bat文件创建含图标快捷方式：在/usr/bin下创建如burpsuite把bat文件复制粘贴(注意路径换成绝对路径)，这样就可在命令行直接运行bat文件，然后用桌面文件创建工具创建快捷方式即可

