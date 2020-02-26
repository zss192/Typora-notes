### 原地址：https://gitee.com/liuzy1988/MyLinux/blob/master/Deepin_15.11.md

- 设置root密码
```
sudo passwd root
```

- 换源
```bash
cd /etc/apt/
sudo vim sources.list

# 深度
#deb [by-hash=force] http://packages.deepin.com/deepin lion main contrib non-free
#deb-src http://packages.deepin.com/deepin lion main contrib non-free
# 阿里
deb [by-hash=force] http://mirrors.aliyun.com/deepin lion main contrib non-free
deb-src http://mirrors.aliyun.com/deepin lion main contrib non-free
# 网易
deb [by-hash=force] http://mirrors.163.com/deepin lion main contrib non-free
deb-src http://mirrors.163.com/deepin lion main contrib non-free

sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt clean
sudo apt autoclean
```

- 终端
```bash
主题 azu
启动时最大化
选中文字时自动复制到剪切板
透明度 ctrl+滚
远程服务器 ctrl+/
vim ~/.bashrc
vim ~/.useProxy
sudo cp ~/.useProxy /root/

# 关闭触摸板
sudo modprobe -r psmouse
# 打开触摸板
sudo modprobe psmouse
```

- 如果左上角提示“Firmware Bug”
```bash
sudo apt install intel-microcode
```

- 常用工具
```bash
sudo apt install curl gedit lsof dos2unix tree adb
```

- 使用sudo免验证密码
```bash
# 备份文件，这个文件很重要，如果改的格式不对，很有可能重启进不了系统
sudo cp /etc/sudoers .
# 编辑文件
sudo vi /etc/sudoers
# 在最后添加一行，你的用户名
liuzy ALL=(ALL:ALL) NOPASSWD:ALL
# 强制保存
:x!
```

- 标题栏高度
```bash
mkdir -p ~/.local/share/deepin/themes/deepin/light/
mkdir -p ~/.local/share/deepin/themes/deepin/dark/
cd ~/.local/share/deepin/themes/deepin/
vim light/titlebar.ini
[Active]
height=25
[Inactive]
height=25
cp light/titlebar.ini dark/titlebar.ini
```

- 字体优化
```bash
# 不要安装商店中的中文字体
# 推荐把Windows下的字体复制过来安装
# msyh.ttf msyhbd.ttf simfang.ttf simhei.ttf simkai.ttf simsun.ttc
# 推荐代码字体
# https://github.com/maxsky/Yahei-Monaco-Hybrid-Font/releases
```

- 应用商店
    - Wine系列
        - QQ
        - TIM
        - 微信
        - 迅雷极速版
        - Navicat（不要用商店的，自己下载破解版）
        - Foxmail（无奈使用，雷鸟和Evolution都不能实现分账号设置不同的代理）
    - 原生系列
        - FileZilla
        - RedisPlus
        - Remmina
        - SmartGit（官网下载更好）
        - VMware Workstation（英文界面、可直接复制粘贴）
        - Oracle VM VirtualBox（更小、中文界面、不能直接复制粘贴）
        - TeamViewer
        - XMind
        - mpv（除了深度播放器，只有这个顺眼一点）
        - 百度网盘linux（不稳定）
        - 网易云音乐
        - 福昕阅读器
    - 浏览器
        - Google Chrome（出墙用）
        - 360安全浏览器（平时用，登陆账号，收藏都回来了）
        - Opera（当备胎用）
    - 梯子
        - Shadowsocks-Qt5（不配系统代理，配应用代理单独给谷歌用即可）
        - electron-ssr（更好用）
    - 编程开发
        - IntelliJ IDEA
        - WebStorm
        - SublimeText（用hexed.it破解，中文宽度是硬伤！）
        - MySQL Workbench
- 自助安装
    - git git-gui
    - Evolution（对Exchange支持很好）
    - NodeJS
    - redis
    - MySQL
    - DbVisualizer（官网下载sh安装版）
    - Fiddler（官方mono版）
    - Wine4（用来运行Windows程序，比如SQLyog）
    - Navicat（12完美运行）
    - SQLyog（11完美运行，12,13界面刷新小问题）
    - Xshell5（可以用，界面渲染有点问题）
    - PanDownload（可以使用链接不限速下载，但不能登陆，需要作者解决）

- 输入法
```bash
# 千万别用搜狗输入法，有内存泄漏BUG，使用8小时占用2G内存不释放
# 卸载并删除配置
sudo apt purge fcitx*
rm -rf ~/.sogou*
rm -rf ~/.config/SogouPY*
rm -rf ~/.config/sogou*
# 重装，五笔大法好。拼音用户可使用中州韵、谷歌拼音、新酷等等
sudo apt fcitx-table-wbpy
# 注销登陆，配置
# 1.只保留键盘和五笔
# 2.候选改为8，竖排显示
# 3.把ctrl+space改成其他的，否则和IDEA冲突
# 3.把其他很多用不到的快捷键置空，如ctrl+shift+f等，和IDEA冲突
```

- Evolution（界面不错，和雷鸟一样的缺点，只能全局设置代理）
```bash
# 配置项中其实有分邮箱设置代理，但我反复使用，发现没有什么用
# 安装后第一件事，打开首选项，改成你想要的样子
# 推荐：勾上“应用同样的查看设置到所有文件夹”
# 推荐：回复和转发默认是把原邮件作为附件发出，推荐改为内嵌
sudo apt install evolution evolution-ews
# 公司的邮件服务器
sudo vim /etc/hosts
172.17.249.184 sysnew.com
172.17.249.184 pop.sysnew.com
172.17.249.184 imap.sysnew.com
172.17.249.184.smtp.sysnew.com
172.17.249.184 exchange.sysnew.com
```

- git
```bash
sudo apt install git git-gui
vim ~/.gitconfig

[gui]
    spellingdictionary = none

cd /usr/share/git-gui/lib/
sudo gedit git-gui.sh

#!/bin/bash
source ~/.useProxy
git gui

sudo chmod +x git-gui.sh

mkdir -p ~/.config/deepin/dde-file-manager/menuextensions
cd ~/.config/deepin/dde-file-manager/menuextensions
gedit git-gui.json
[
    {
        "MenuType": "EmptyArea",
        "Icon": "",
        "Text[zh_CN]": "Git GUI Here",
        "Exec": "/usr/share/git-gui/lib/git-gui.sh"
    },
    {
        "MenuType": "SingleDir",
        "Icon": "",
        "Text[zh_CN]": "Git GUI Here",
        "Exec": "/usr/share/git-gui/lib/git-gui.sh"
    }
]
```

- electron-ssr
```bash
# https://github.com/qingshuisiyuan/electron-ssr-backup
wget https://github.com/qingshuisiyuan/electron-ssr-backup/releases/download/v0.2.6/electron-ssr-0.2.6.deb
sudo apt install electron-ssr-0.2.6.deb
```

- IDEA 和 WebStorm  PhpStorm
```bash
# 支持2019.2.2及以下版本。不用改hosts，如果已修改，请去掉
wget https://download.jetbrains.8686c.com/idea/ideaIU-2019.2.2.tar.gz
wget https://download.jetbrains.8686c.com/webstorm/WebStorm-2019.2.2.tar.gz
# 下载破解补丁到安装目录
cd /usr/share/intellij-idea-ultimate/bin
wget http://upload.liuzy88.com/jetbrains-agent.jar
# 修改配置，末尾添加一行
sudo vim idea64.vmoptions
-javaagent:/usr/share/intellij-idea-ultimate/bin/jetbrains-agent.jar
# 查看激活码并输入
curl http://upload.liuzy88.com/jetbrains-key.txt
# 点击激活服务器输入(自动)
http://jetbrains-license-server
# 如果激活失败，请先退出软件，删除用户目录下配置文件夹，如.IntelliJIdea2019.2
# 作者 https://zhile.io/2018/08/17/jetbrains-license-server-crack.html
```

- SublimeText
    - A File Icon
    - ChineseLocalizations
    - HTML-CSS-JS Prettify（修改print_diagnostics为false）
    - Nodejs（修改build编码为utf8）
```bash
# 基本配置
{
    "color_scheme": "Packages/Color Scheme - Default/Breakers.sublime-color-scheme",
    "dpi_scale": 1.0,
    "draw_white_space": "all",
    "file_exclude_patterns":
    [
        "*.pyc", "*.pyo", "*.exe", "*.dll", "*.obj", "*.o", "*.a", "*.lib", "*.so", "*.dylib", "*.ncb",
        "*.sdf", "*.suo", "*.pdb", "*.idb", ".DS_Store", "*.class", "*.psd", "*.db", "*.sublime-workspace", "*.iso"
    ],
    "folder_exclude_patterns":
    [
        ".svn", ".git", ".hg", "CVS", "node_modules", ".idea"
    ],
    "font_face": "YaHei Monaco Hybrid",
    "font_options": ["gdi"],
    "font_size": 10,
    "ignored_packages":
    [
        "Vintage"
    ],
    "show_encoding": true,
    "theme": "Adaptive.sublime-theme",
    "theme_font_options": ["gdi"],
    "translate_tabs_to_spaces": true
}

# 鼠标中键选择问题，详情https://searchcode.com/codesearch/view/46691531/
vim ~/.config/sublime-text-3/Packages/User/Default (Linux).sublime-mousemap
[{
    "button": "button3",
    "press_command": "drag_select",
    "press_args": { "by": "columns" }
}, {
    "button": "button1",
    "count": 1,
    "modifiers": ["alt"],
    "press_command": "drag_select",
    "command": "goto_definition"
}]

# 配置代理的方法
vim ~/.config/sublime-text-3/Packages/User/Package Control.sublime-settings
{
    "http_proxy": "http://172.16.1.245:8080",
    "https_proxy": "http://172.16.1.245:8080",
}
```

- NodeJS
```bash
# http://nodejs.cn/download/
cd /opt
sudo wget https://cdn.npm.taobao.org/dist/node/v10.16.3/node-v10.16.3-linux-x64.tar.xz
sudo tar xvf node-v10.16.3-linux-x64.tar.xz
sudo mv node-v10.16.3-linux-x64/ nodejs
sudo ln -s /opt/nodejs/bin/node /usr/bin/nodejs
sudo vim /etc/profile

### node
export PATH=$PATH:/opt/nodejs/bin

vim ~/.npmrc

registry=https://registry.npm.taobao.org/
proxy=http://172.16.1.245:8080/
https-proxy=http://172.16.1.245:8080

sudo cp ~/.npmrc /root/
node -v
npm -v
sudo npm i nodemon -g
```

- redis
```bash
sudo apt install redis*
```

- MySQL
```bash
# 避免_apt权限问题
cd /tmp
# deepin15.11其于debian9即stretch， 所以下载
wget http://mirror.bit.edu.cn/mysql/downloads/MySQL-5.7/mysql-server_5.7.27-1debian9_amd64.deb-bundle.tar
# 解压到指定目录
mkdir myql
tar xvf mysql-server_5.7.27-1debian9_amd64.deb-bundle.tar -C mysql
# 安装，会提示设置密码
cd mysql
sudo apt install ./*.deb
# 后悔药，卸载命令
sudo apt autoremove mysql-*
```

- DbVisualizer
```
cd /opt
sudo wget http://www.dbvis.com/product_download/dbvis-10.0.22/media/dbvis_linux_10_0_22.sh
chmod +x dbvis_linux_10_0_22.sh
./dbvis_linux_10_0_22.sh
```

- SmartGit
```bash
# 推荐使用官网最新版，为19.1.1，中文界面，无需破解
# https://www.syntevo.com/smartgit/download/
sudo apt install ./smartgit-19_1_1.deb

# 商店安装的版本为18.2.9，破解方法：
# 1.先运行一次，选择免费，打开软件
# 2.备份配置
cp ~/.config/smartgit/18.2/settings.xml ~/.config/smartgit/18.2/settings.xml.bak
# 3.修改启动脚本，每次启动时还原
sudo vim /usr/share/smartgit/bin/smartgit.sh
mv ~/.config/smartgit/18.2/settings.xml.bak ~/.config/smartgit/18.2/settings.xml
```

- SecureCRT 8.5 （官方下载，脚本破解）
```bash
# 下载需要注册账号，输入邮箱收密码登陆
# https://www.vandyke.com/cgi-bin/releases.php?product=securecrt
# 我选择的是Ubuntu18版本的scrt-8.5.4-1942.ubuntu18-64.x86_64.deb
# 安装时会陆续提示依赖，可提前在https://pkgs.org/下载
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8_8c-2ubuntu8_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_1.5.2-0ubuntu5_amd64.deb
# 安装上面三个依赖
sudo apt install ./libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb
sudo apt install ./libjpeg*
# 然后才安装SecureCRT
sudo apt install ./scrt-8.5.4-1942.ubuntu18-64.x86_64.deb
# 下载破解工具
wget http://download.boll.me/securecrt_linux_crack.pl
# 执行破解，会打印出注册信息，不要关掉
sudo perl securecrt_linux_crack.pl /usr/bin/SecureCRT
# 这个时候程序启动菜单中已经有SecureCRT了，找到它，放到桌面，并运行
# 1.点击Enter License Data...
# 2.输入上面破解时打印的License Key，下一步
# 3.点击Enter License Manually，手动输入所有信息
# 4.根据提示框依次输入：Name、Company、Serial Number、License Key、Issue Date即可完成破解
```

- Fiddler（安装到用户目录）
    - *https://www.telerik.com/download/fiddler*
    - *http://fiddler.wikidot.com/mono*
```bash
sudo apt install mono-complete
cd ~
wget http://telerik-fiddler.s3.amazonaws.com/fiddler/fiddler-linux.zip
unzip fiddler-linux.zip -d Fiddler2
cd Fiddler2
vim fiddler.desktop

[Desktop Entry]
Name=Fiddler
Exec=mono /home/liuzy/Fiddler2/Fiddler.exe
Terminal=false
Type=Application
Icon=/home/liuzy/Fiddler2/App.ico
StartupNotify=true

cp fiddler.desktop ~/Desktop
```

- Wine 4
```bash
cd /tmp
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
cd /etc/apt/sources.list.d/
sudo vim wine.list
deb https://dl.winehq.org/wine-builds/debian/ stretch main
sudo apt update
sudo apt install --install-recommends winehq-stable
wine --version
# 添加Windows字体
# msyh.ttf msyhbd.ttf simfang.ttf simhei.ttf simkai.ttf simsun.ttc
cp ~/Fonts/* ~/.wine/drive_c/windows/Fonts
# 配置Windows主题
cp ~/.deepinwine/Deepin-XXX/drive_c/windows/Resources/Themes/deepin/deepin.msstyles ~
# 启动，自动下载组件
winecfg
# 建议wine安装程序时，统一安装到C盘根目录，方便cd到目录进行操作

# 手动安装组件(mono和gecko)
https://github.com/madewokherd/wine-mono/releases
http://dl.winehq.org/wine/wine-mono/4.9.3/wine-mono-4.9.3.msi
https://wiki.winehq.org/Gecko#Installing
http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86.msi
http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi

# 安装辅助工具
sudo apt install cabextrac winbind
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo mv winetricks /usr/local/bin/

wget http://www.tatanka.com.br/ies4linux/downloads/ies4linux-latest.tar.gz
cd ies4linux-2.99.0.1

# 安装Windows常用工具组件
# 百度搜索“微软常用运行库合集”，比如 MSVBCRT.AIO.2019.09.25.X86 X64.exe
# 可解决某此软件缺少依赖
```

- SQLyog
```bash
# 推荐版本 SQLyog 11
cd ~
wget http://upload.liuzy88.com/SQLyog-11.2.4-0.x86.zip
unzip SQLyog-11.2.4-0.x86.zip
# 注册表写入注册信息
wine regedit SQLyog-11.2.4-0.x86.reg
# 安装到 C:\SQLyog
wine SQLyog-11.2.4-0.x86.exe

# SQLyog 12
cd ~
wget http://upload.liuzy88.com/SQLyog-12.0.9-0.x64.exe
# 安装到 C:\SQLyog12
wine SQLyog-12.0.9-0.x64.exe
# 注册 ddooo
# 密钥 8d8120df-a5c3-4989-8f47-5afc79c56e7c

# 最新的版本 SQLyog 13
cd ~
wget http://upload.liuzy88.com/SQLyog-13.1.1.exe
# 安装到 C:\SQLyog13
wine SQLyog-12.0.9-0.x64.exe
# 无需注册
```

- Navicat Premium 12
```bash
# （方式一）官网下载，工具破解
wget http://download.navicat.com.cn/download/navicat121_premium_cs_x64.exe
wine navicat121_premium_cs_x64.exe
# 安装到C:\Navicat12
# 双击快捷方式，打开软件，点试用，退出软件
cd ~/.wine/drive_c/Navicat12
wget http://upload.liuzy88.com/Navicat_Keygen_Patch_v4.8_By_DFoX.exe
wine Navicat_Keygen_Patch_v4.8_By_DFoX.exe
# 取消1)左边的“Backup”，没有必要占掉50多兆
# 点击1)右边的“Patch”，会弹出->Cracked
# 点击4)右边的“Generate”，会生成激活码，输入后激活，再“手动激活”
# 复制输入手动激活的“请求码”，点击4)下方的“Generate”，生成“响应码”
# 使用用“响应码”激活

# （方式二）先安装商店中的版本，再解压替换
cd /usr/share/navicat
sudo mv Navicat Navicat.bak
sudo wget http://upload.liuzy88.com/Navicat12.zip
sudo unzip Navicat12.zip
# 使用商店中的快捷方式打开程序，没有问题可删除原来的版本
sudo rm -rf Navicat.bak
```

- （方式三）应用商店Navicat版本无限试用脚本
``` python
#!/usr/bin/env python3
# -*- coding:utf-8 -*-
import os
import re
ps = (
        re.compile(r'\[Software\\\\PremiumSoft\\\\Data\\\\\{[^\}]*\}\\\\Info\].*?\n[^\[]*'),
        re.compile(r'\[Software\\\\Classes\\\\CLSID\\\\\{[^\}]*\}\\\\Info\].*?\n[^\[]*')
    )
regfile = os.path.join(os.environ['HOME'], '.navicat64', 'user.reg')
with open(regfile, 'r+') as f:
    regstr = f.read()
    for p in ps:
        regstr = p.sub(lambda m: '', regstr)
    f.seek(0, 0)
    f.truncate()
    f.write(regstr)
```

- Xshell 5
```bash
cd ~
wget http://upload.liuzy88.com/Xshell5.zip
unzip Xshell5.zip
# 安装到 C:\Xshell5
wine Xshell5.exe
# 安装失败没有关系，直接删除文件（安装的目的是为了安装.Net环境、注册dll、生成快捷方式）
rm -rf ~/.wine/drive_c/Xshell5/
# 把破解版的文件复制过去
mv Xshell5 ~/.wine/drive_c/
# 删除原版安装文件
rm -rf Xshell.exe
# 去Windows目录执行破解
cd ~/.wine/drive_c/Xshell5/
wine cmd
>install.bat
# 使用桌面图标运行
# 注意界面UI刷新会黑屏，可以隐藏“标准按钮”栏，临时解决
```

- FoxMail（自己安装官方最新版7.2.12.322）
```bash
# https://www.foxmail.com/
wget http://upload.liuzy88.com/Foxmail_7.2.zip
unzip Foxmail_7.2.zip -d ~/.wine/drive_c/
cd ~/.wine/drive_c/Foxmail_7.2
vim run.sh

#!/bin/bash
cd ~/.wine/drive_c/Foxmail_7.2
wine foxmail.exe

chmod +x run.sh
vim foxmail.desktop

[Desktop Entry]
Name=Foxmail 7.2
Exec=/home/liuzy/.wine/drive_c/Foxmail_7.2/run.sh
Terminal=false
Type=Application
Icon=deepin.com.foxmail
StartupNotify=true
StartupWMClass=Foxmail.exe
Categories=internet;

cp foxmail.desktop ~/Desktop/
```

- PanDownload（注意使用时不要最小化到状态栏）
```bash
# http://pandownload.com/
wget http://dl.pandownload.club/dl/PanDownload_v2.1.3.zip
unzip PanDownload_v2.1.3.zip -d ~/.wine/drive_c/
vim run.sh

#!/bin/bash
cd ~/.wine/drive_c/PanDownload
wine PanDownload.exe

chmod +x run.sh
vim pandownload.desktop

[Desktop Entry]
Name=PanDownload
Exec=/home/liuzy/.wine/drive_c/PanDownload/run.sh
Terminal=false
Type=Application
Icon=baidunetdisk
StartupNotify=true
StartupWMClass=PanDownload.exe
Categories=Network;

cp pandownload.desktop ~/Desktop/
```

- 关于EFI引导
    - 了解什么是EFI https://zhuanlan.zhihu.com/p/25281151
```bash
# 查磁盘分区信息，理解EFI，观查ESP，弄清mount
sudo df -h
sudo fdisk -l
# 查看EFI分区文件，经试验，除了grub文件，其他的efi可删除
cd /boot/efi/EFI
# 奇怪的是，深度的引导其实是ubuntu下的efi，而非deepin下的efi
tree
├── boot                      
│   ├── grub.cfg              69a41611b8d74325ac763d5d65f25a2a
│   └── grubx64.efi           2acd8f17dfff5d3d959ea35915099779
├── deepin                    
│   ├── grub.cfg              69a41611b8d74325ac763d5d65f25a2a
│   └── grubx64.efi           2acd8f17dfff5d3d959ea35915099779
└── ubuntu                    
    ├── grub.cfg              69a41611b8d74325ac763d5d65f25a2a
    └── grubx64.efi           2acd8f17dfff5d3d959ea35915099779
# 查看EFI列表
sudo efibootmgr -v
# 删除记录（四位数字编号）
sudo efibootmgr -b 0000 -B
# 添加记录（名字、系统所在设备、引导磁盘、引导文件）
sudo efibootmgr -c -w -L "Windows10" -d /dev/sda3 -p 1 -l \\EFI\\Microsoft\\Boot\\bootmgfw.efi
sudo efibootmgr -c -w -L "Deepin" -d /dev/sdb3 -p 1 -l \\EFI\\Ubuntu\\grubx64.efi
# 修改启动顺序（数字编号排序）
sudo efibootmgr -o 0000,0001
# 设置下一次执行的引导
sudo efibootmgr -n 0000

# 我的华硕EFI启动列表
BootCurrent: 0000
Timeout: 2 seconds
BootOrder: 0000,0001
Boot0000* Deepin    HD(1,GPT,6656470e-4420-4547-a3e2-d7ef54450ffb,0x1000,0x31000)/File(\EFI\Ubuntu\grubx64.efi)
Boot0001* Windows10 HD(1,GPT,972cb96a-81ef-11e9-9a8a-d0dd588739a1,0x800,0x31800)/File(\EFI\Microsoft\Boot\bootmgfw.efi)

# 我的华硕磁盘详情
Disk /dev/sda: 232.9 GiB, 250059350016 bytes, 488397168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: CAF4E572-2AA1-4C6D-8CE4-EF93CEC30D80

Device         Start       End   Sectors  Size Type
/dev/sda1       2048    204799    202752   99M EFI System
/dev/sda2     204800 209904089 209699290  100G Microsoft basic data
/dev/sda3  209904096 398654056 188749961   90G Microsoft basic data
/dev/sda4  398655488 488396799  89741312 42.8G Linux filesystem


Disk /dev/sdb: 119.2 GiB, 128035676160 bytes, 250069680 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 362276B1-3775-4E3F-AAEE-60BA2B7364D2

Device         Start       End   Sectors  Size Type
/dev/sdb1       2048 125002047 125000000 59.6G Microsoft basic data
/dev/sdb2  125003776 250069646 125065871 59.7G Microsoft basic data

```