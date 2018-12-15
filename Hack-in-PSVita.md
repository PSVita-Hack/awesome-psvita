## 一、3.60 PSV 破解指南

注：固化后的 PSV 已经不需要每次开机重新破解，已经离线破解的 PSV 请保存好游戏备份并格卡格机重新破解；

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
> [pkgj](https://github.com/blastrock/pkgj/releases)：forked from [mmozeiko/pkgi](https://github.com/mmozeiko/pkgi)
>
> GameInstaller：从文件夹安装游戏
>
> [Ardrenaline](https://github.com/TheOfficialFloW/Adrenaline/releases)： PSP 模拟器
>
> [RetroArch](https://buildbot.libretro.com/stable/1.7.1/playstation/vita/)：libretro出品的全能模拟器
>
> [pFBA](https://github.com/Cpasjuste/pfba/releases)：FBA 模拟器
>
> [GoHan](https://tieba.baidu.com/p/4803803268)：[一粒米饭](https://github.com/OneRice07) PSV 存档修改器
>
> [CTMANAGER](http://redsquirrel87.altervista.org/doku.php/custom-themes-manager)：PSV 主题一键安装工具
>
> [Updater365](https://github.com/TheOfficialFloW/update365/releases)：3.65 升级工具

12、断开 ftp 连接，打开『VitaShell』 依次安装上述软件。

13、打开『enso』，O键进入菜单，X 键安装固化，X 键写入配置文件。按照提示重启 PSV，破解完成。

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

注意：目前3.65变革 O 系统仅支持3.60系统的机器，暂不支持 3.65原生系统破解。



3.60已固化变革系统的机器请先卸载固化格卡格机；未固化变革系统的机器请从第三步开始阅读；

1、破解前请确保 PSV 是已固化3.60变革系统；已经破解 TF 卡套的机器请取出卡套；确保机器（原装卡）已经安装『enso』，否则请重新安装『enso』；

2、打开『enso』，O 键进入菜单，△键卸载固化，按任意键重弄器机器删除固化；

3、打开『设定』气泡，打开『格式化』选项卡，初始化本机并格式化内存卡；

4、参考 3.60 PSV 破解指南 1~12步，破解变革系统，得到『molecularShell』气泡，并安装『VitaShell』，并确保『VitaShell』是1.83以上版本，通过『VitaShell』安装『 [Updater](https://github.com/TheOfficialFloW/update365/releases)』；

5、 PSV 打开『VitaShell』，按select 键通过 USB 连接电脑，拷贝『 [PSP2UPDAT.PUP](https://github.com/TheOfficialFloW/update365/releases)』至 `/app/UPDATE365` 目录； PSV 打开『VitaShell』，确保『 [PSP2UPDAT.PUP](https://github.com/TheOfficialFloW/update365/releases)』已安装在`ux0:/app/UPDATE365`目录中；

6、运行『 [Updater](https://github.com/TheOfficialFloW/update365/releases)』，按照提示升级固化；重启机器后，就已经是3.65变革 O 系统了。



## 三、TF 破解 ux0

注：此教程对已固化的3.60、3.65变革系统均受用，破解前确保机器为已固化变革系统，未固化的变革系统请保存好游戏备份格卡格机重新破解并安装固化；

1、格式化 tf卡为 exFat 格式

2、写入 zzBlank.img 镜像

3、格式化 tf卡为 exFat 格式

4、将 PSV ux0:根目录下的所有文件（包括隐藏文件）拷贝至 TF 卡，也可以使用本教程准备好的系统文件；

5、PSV 内打开『VITA工具箱』，选择『 tf 卡和 USB 插件』选项卡，选择『 原装卡->uma0，tf 卡->ux0』，按照系统类型选择固化类型，重启机器，tf 卡破解成功。

> uma0：目前仅可在相应路径存放 Ardrenaline 和 RetroArch 的游戏文件和资源文件



##四、如何安装游戏、DLC、以及游戏补丁？

目前有三种主流方式安装游戏：

第一种是使用『 文件夹安装游戏工具』从文件夹安装游戏；

第二种是通过『 [maiDumpTool](https://github.com/BeniYukiMai/MaiDumpTool/releases)』安装游戏、DLC 和补丁；

第三种是通过『[pkgi](https://github.com/mmozeiko/pkgi/releases/tag/v0.05)』在线安装游戏。

前两种安装方式取决于你下载好的游戏资源。



1、若下载好的游戏为 zip 格式，请直接解压 zip；若为 vpk 格式，请更改后缀为 zip 并解压；

> 直接安装 vpk 格式游戏安装速度慢且不稳定，推荐更改格式后安装。

2、解压好的游戏文件夹如果为游戏名，将文件夹拷贝 ux0任意路径后，通过『 文件夹安装游戏工具』安装游戏；

解压好的游戏文件夹如果为代码格式，如:`PCSH10006`，请将文件夹拷贝至 psv `ux0:/mai` 目录内，通过通过『 [maiDumpTool](https://github.com/BeniYukiMai/MaiDumpTool/releases)』安装游戏。

> 建议玩家在 ux0根目录新建 `VitaGAME` 文件夹（名字任取），将文件夹名字为游戏名的游戏上传到该路径安装游戏，以便统一管理。

3、安装 DLC 以及游戏补丁

将下载好的游戏补丁改名为`gamecode_patch` （如`PCSH10006_patch`）上传至`ux0:/mai` 目录内通过通过『 [maiDumpTool](https://github.com/BeniYukiMai/MaiDumpTool/releases)』安装即可。

将下载好的 DLC 改名为`gamecode_addc` （如`PCSH10006_addc`）上传至`ux0:/mai` 目录内通过通过『 [maiDumpTool](https://github.com/BeniYukiMai/MaiDumpTool/releases)』安装，加载方式选择5即可。





pkgi 安装游戏：

在 PSV `ux0:` 目录下新建 `pkgi` 文件夹，将下载好的游戏列表文件`pkgi.txt` 上传至 pkgi 文件夹，安装好 `pkgi.vpk` 后就可以在线下载并安装游戏了。下载好游戏后会在 pkgi 目录生成对应游戏的缓存文件，安装好游戏后删除即可。



## 五、3.60或者3.65系统如何刷回正版系统？

注：其实无论破解还是重做系统都没有明确要求说一定要格卡格机，不过为了避免出现一些 bug，在你重做系统或者安装固化的时候，最好先备份好游戏资料，然后格卡格机重构数据库，重新安装破解。

1、3.60 未固化变革系统：

因为未固化系统每次重启系统后严格意义上其实都是正版系统，只不过破解文件还在对应的目录中，所以只需要格卡格机就可以升级正版系统玩最新游戏了；

2、3.60 已固化变革系统：

已经通过『enso』安装固化的变革系统，首先拔掉 tf 卡套，然后打开『enso』按照提示（O△）卸载固化，格卡格机重启机器即可回归正版系统；

3、3.65 已固化变革O 系统：

目前 3.65 已固化变革O 系统卸载时会出现一些潜在的问题，已经有不少网友反馈卸载固化导致 PSV 变砖



## 六、插件管理

## 七、VITASDK 使用手册



## 附录 ：名词详解



