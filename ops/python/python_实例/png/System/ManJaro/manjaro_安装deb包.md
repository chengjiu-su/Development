使用 Yaourt 安装：
```shell
yaourt -S debtap
```
同时，你的 Arch 系统也应该已经安装好了 bash， binutils ，pkgfile 和 fakeroot 包。
在安装 Debtap 和所有上述依赖关系之后，运行以下命令来创建/更新 pkgfile 和 debtap 数据库。
```shell
sudo debtap -u
```
2 升级debtap
2.1 替换源，解决debtap同步仓库国内执行超慢
打开 /usr/bin/debtap，更换 debtap内容：
```shell
替换：http://ftp.debian.org/debian/dists
https://mirrors.ustc.edu.cn/debian/dists

替换：http://archive.ubuntu.com/ubuntu/dists
https://mirrors.ustc.edu.cn/ubuntu/dists/
```
2.2 执行升级
```shell
sudo debtap -u
```
##### 案例
debtap 转换包
```
debtap quadrapassel_3.22.0-1.1_arm64.deb
```
示例输出：
```shell
==> Extracting package data...
==> Fixing possible directories structure differencies...
==> Generating .PKGINFO file...
:: Enter Packager name:
quadrapassel         #输入包名
:: Enter package license (you can enter multiple licenses comma separated):
GPL                  #输入GPL即可（安装包许可证）
*** Creation of .PKGINFO file in progress. It may take a few minutes, please wait...
Warning: These dependencies (depend = fields) could not be translated into Arch Linux packages names:
gsettings-backend
==> Checking and generating .INSTALL file (if necessary)...
:: If you want to edit .PKGINFO and .INSTALL files (in this order), press (1) For vi (2) For nano (3) For default editor (4) For a custom editor or any other key to continue:            #直接回车
==> Generating .MTREE file...
==> Creating final package...
==> Package successfully created!
==> Removing leftover files...
```
如果在包转化的过程中，你不想回答任何问题，使用 -q 略过除了编辑元数据之外的所有问题。
```shell
debtap -q quadrapassel_3.22.0-1.1_arm64.deb
```
为了略过所有的问题（不推荐），使用 -Q。
```shell
debtap -Q quadrapassel_3.22.0-1.1_arm64.deb
```
转换完成后，可以使用 pacman 在 Arch 系统中安装新转换的软件包，如下所示
```shell
sudo pacman -U <package-name>
sudo pacman -U xxx.tar.xz
````
[[manjaro_install]]