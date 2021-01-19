>选择rufus制作U盘引导启动

BIOS设置项
>- 关闭安全引导（Secure Boot）设置Disabled
>- 关闭Dell BIOS的PTT（非dell不需要改动）
>- 关闭Dell BIOS的CMS (ADvanced boot options) 设置Disabled
>- 设置BOOT 为 UFEI only
>- 设置硬盘模式为AHCI （NVME无需设置）

- 推荐选择200G或200G以上的硬盘安装

更换国内源
```pacman
sudo pacman-mirrors -i -c China -m rank
在第命令结束的时候会弹出一个窗口让你选择想要使用的源
```
直接编辑文件添加源地址
2.设置 archlinuxcn 源,antergos源,arch4edu源:
sudo vi /etc/pacman.conf
```bash
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
```
3.更新源列表
```shell
sudo pacman-mirrors -g
```
4.更新pacman数据库并全面更新系统
```shell
sudo pacman -Syyu
```
5.防止PGP签名错误
```shell
sudo pacman -S archlinuxcn-keyring
sudo pacman -S antergos-keyring
```
安装ARU包管理工具
```shell
sudo pacman -S yay
```
安装yaourt
```shell
pacman -S yaourt
```
安装vim
```
sudo pacman -S vim
```
安装chrome浏览器
```shell
sudo yay -S google-chrome
```
安装微信
```shell
yaourt -S deepin-wine-wechat
```
安装深度截图工具
```shell
yay -S deepin-screenshot
```
安装wps-office
```shell
sudo pacman -S wps-office
sudo pacman -S ttf-wps-fonts
sudo pacman -S wps-office-mui-zh-cn 

```
安装网易云
```shell
sudo pacman -S netease-cloud-music
```
manjaro系统安装无声音输出解决
```shell
sudo pacman -S sof-firmware
```
解决双系统时间不同步问题
```shell
timedatectl set-local-rtc true
```
中英词典翻译和医学词典
```shell
sudo pacman -S goldendict
```
安装TIM：
非官方的wine版本，可以当qq用（比官方的Linux QQ好用）
```shell
sudo pacman -S deepin.com.qq.office
```
Manjaro 安装deepin系列软件
首先安装deepin系列软件依赖,如果不安装部分软件可能会有些小问题：
```shell
sudo pacman -Sy deepin
sudo pacman -Sy deepin-terminal
```
Manjaro Linux
```bash
yay	yay -Syyu --noconfirm
yay -S    --noconfirm dingtalk
```
[[manjaro_安装deb包]]
[[manjaro_pacman管理]]