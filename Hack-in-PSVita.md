##一、3.60 PSV 破解指南

1、请确保 PSV 是第一次破解。打开『设定』气泡，查看系统信息，确认PSV 是3.60未破解系统；

2、打开『设定』气泡，打开『格式化』选项卡，初始化本机并格式化内存卡；

3、重启 PSV，初始化机器，连接 Wifi（先不要登录 PSN 账号，语言选择繁体中文，其他默认）

4、确认机器有50%以上电量，打开浏览器，输入`http://henkaku.xyz` 自动破解变革系统。

![破解变革系统](https://raw.githubusercontent.com/Yggdrasill-7C9/Hack-in-PSVita/master/SCREENSHOT/bf/2018-04-09-120335.jpg)

> 如果在跳转`http://henkaku.xyz/go`网页的过程中出现错误 `C2-12828-1`，玩家可以反复点击 OK按钮；
>
> 如果依然出现该错误，玩家可以**删除浏览器 Cookie** 或者 **wifi 连接手机热点**进行破解。
>
> ![C2-12828-1](https://raw.githubusercontent.com/Yggdrasill-7C9/Hack-in-PSVita/master/SCREENSHOT/dh/2018-04-09-120401.jpg)

5、如果破解后没有出现『molecularShell』气泡，证明本次破解失败。请重启机器打开浏览器进行破解。

> 破解失败时打开浏览器地址栏应该为`http://henkaku.xyz/go` 玩家不用手动输入地址。

![HENkaku 自动破解](https://raw.githubusercontent.com/Yggdrasill-7C9/Hack-in-PSVita/master/SCREENSHOT/df/2018-04-09-121737.jpg)

6、打开『设定』气泡，打开『HENkaku 设置』选项卡，勾选启用不安全自制软件；

7、打开『设定』气泡，打开『系统』选项卡，取消默认勾选的前两个选项；

![](https://raw.githubusercontent.com/Yggdrasill-7C9/Hack-in-PSVita/master/SCREENSHOT/ec/2018-04-09-122511.jpg)

8、确认无误后重启机器，打开『molecularShell』气泡，发现出现错误 `C1-6775-5` ，证明系统没有固化。

![](https://raw.githubusercontent.com/Yggdrasill-7C9/Hack-in-PSVita/master/SCREENSHOT/hc/2018-04-09-122704.jpg)

打开浏览器输入`http://henkaku.xyz/go` 重新破解。（此次破解仅仅会重新安装三个插件）

9、再次打开『molecularShell』气泡，按下 【SELECT】键，连接 FTP 服务器。

![](https://raw.githubusercontent.com/Yggdrasill-7C9/Hack-in-PSVita/master/SCREENSHOT/jj/2018-04-09-124740.jpg)

10、打开电脑，打开 FTP 软件，以[FileZilla](https://filezilla-project.org/) 为例：

主机填写『molecularShell』显示的 ip 地址，端口填写 `1337` 后，点击快速连接。

> 如果玩家跳过第六步直接连接 FTP 服务器上传 vpk 时，会出现 550 错误导致无法上传 vpk，玩家在『HENkaku 设置』勾选启用不安全自制软件 后，重启PSV打开浏览器即可解决该问题。如果出现其他问题导致上传文件失败，则是 FTP 软件或文件权限的问题，请确保上传文件是可读写的，其他问题请自行查阅 FTP 软件使用手册。

11、上传 vpk 文件夹☞`ux0:` 根目录

> **[vitashell](https://github.com/TheOfficialFloW/VitaShell/releases)**：可通过 USB 上传文件的文件管理工具
>
> **[enso](https://github.com/henkaku/enso/releases)**：一键固化工具
>
> **[vita 工具箱](https://tieba.baidu.com/p/5501262034?see_lz=1)**：一直改出品的vita 管理工具
>
> [maiDumpTool](https://github.com/BeniYukiMai/MaiDumpTool/releases)：mai 安装游戏、补丁、DLC
>
> [pkgi](https://github.com/mmozeiko/pkgi/releases/tag/v0.05)：mmozeiko自制的在线游戏安装工具
>
> GameInstaller：从文件夹安装游戏
>
> [Ardrenaline](https://github.com/TheOfficialFloW/Adrenaline/releases)： PSP 模拟器
>
> [RetroArch](https://buildbot.libretro.com/stable/1.7.1/playstation/vita/)：libretro出品的全能模拟器
>
> [GoHan](https://tieba.baidu.com/p/4803803268)：[一粒米饭](https://github.com/OneRice07) PSV 存档修改器
>
> [CTMANAGER](http://redsquirrel87.altervista.org/doku.php/custom-themes-manager)：PSV 主题一键安装工具
>
> [Updater365](https://github.com/TheOfficialFloW/update365/releases)：3.65 升级工具

12、断开 ftp 连接，打开『VitaShell』 依次安装上述软件。

13、打开『enso』，o键进入菜单，x 键安装固化，x 键写入配置文件。按照提示重启 PSV，破解完成。

> 『×』：安装或重新安装固化
>
> 『△』：卸载固化
>
> 『□』：如果taiHEN 没有 在 boot 中加载
>
> 『○』：退出菜单
>
> 重启开机后会多一个启动图标，代表固化写入成功

##二、3.65 PSV 破解指南

## 三、TF 破解 ux0

1、格式化 tf卡为 exFat 格式

2、写入 zzBlank.img 镜像

3、格式化 tf卡为 exFat 格式

4、将 PSV ux0:根目录下的所有文件（包括隐藏文件）拷贝至 TF 卡

5、PSV 内打开『VITA工具箱』，选择『 tf 卡和 USB 插件』选项卡，选择『 原装卡->uma0，tf 卡->ux0』，按照系统类型选择固化类型，重启机器，tf 卡破解成功。

> uma0：目前仅可在相应路径存放 Ardrenaline 和 RetroArch 的游戏文件和资源文件



##四、如何安装游戏、DLC、以及游戏补丁？

## 五、VITASDK 使用手册



## 附录 ：名词详解



