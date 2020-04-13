# systemctl

**systemctl命令**是系统服务管理器指令，它实际上将 [service](http://man.linuxde.net/service) 和 [chkconfig](http://man.linuxde.net/chkconfig) 这两个命令组合到一起。

| 任务                 | 旧指令                                                       | 新指令                                                       |
| -------------------- | ------------------------------------------------------------ | :----------------------------------------------------------- |
| 使某服务自动启动     | chkconfig --level 3 [httpd](http://man.linuxde.net/httpd) on | systemctl [enable](http://man.linuxde.net/enable) httpd.service |
| 使某服务不自动启动   | chkconfig --level 3 httpd off                                | systemctl disable httpd.service                              |
| 检查服务状态         | service httpd status                                         | systemctl status httpd.service （服务详细信息） systemctl is-active httpd.service （仅显示是否 Active) |
| 显示所有已启动的服务 | chkconfig --list                                             | systemctl list-units --[type](http://man.linuxde.net/type)=service |
| 启动某服务           | service httpd start                                          | systemctl start httpd.service                                |
| 停止某服务           | service httpd stop                                           | systemctl stop httpd.service                                 |
| 重启某服务           | service httpd restart                                        | systemctl restart httpd.service                              |

# crontab

```shell
crontab -e 		//进入corntab文件
crontab -l 		//查看corntan文件
```

- 其中 f1 是表示分钟，f2 表示小时，f3 表示一个月份中的第几日，f4 表示月份，f5 表示一个星期中的第几天。program 表示要执行的程序。
- 当 f1 为 * 时表示每分钟都要执行 program，f2 为 * 时表示每小时都要执行程序，其馀类推
- 当 f1 为 a-b 时表示从第 a 分钟到第 b 分钟这段时间内要执行，f2 为 a-b 时表示从第 a 到第 b 小时都要执行，其馀类推
- 当 f1 为 */n 时表示每 n 分钟个时间间隔执行一次，f2 为 */n 表示每 n 小时个时间间隔执行一次，其馀类推
- 当 f1 为 a, b, c,… 时表示第 a, b, c,… 分钟要执行，f2 为 a, b, c,… 时表示第 a, b, c…个小时要执行，其馀类推
- ![image-20200413180430216](https://raw.githubusercontent.com/zss192/Typora-notes/master/images/image-20200413180430216.png)