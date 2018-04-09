----------------strings------------------------

------------------关于--------------------------*
APP_NAME = "VITA工具箱"
APP_VERSION = "1.47_beta3"
APP_BUILD_DATE = "2018.03.16"
APP_NAME_VERSION = APP_NAME.." "..APP_VERSION

------------------弹窗--------------------------*
TIPS = "提示"
INTRODUCTION = "说明"
PLEASE_SELECT = "请选择"
BUTTON_POSITIVE = "○确定"
BUTTON_CANCEL = "X取消"
BUTTON_BACK = "X返回"
BUTTON_QUIT = "X退出"
BUTTON_PASS = "△跳过"
WAIT_LOADING = "加载中，请稍候..."
WAIT_EXECUTING = "执行中，请稍候..."
WAIT_CANCELING = "正在取消操作，请稍候..."
WAIT_CHECKING_APP = "正在检测游戏安全性..."
WAIT_INSTALLING_APP = "正在安装游戏%s，请稍候..."

------------------callbacks--------------------------*
CALLBACKS_COPYING = "正在复制"
CALLBACKS_DELETING = "正在删除"
CALLBACKS_EXTRACTING = "正在解压"
CALLBACKS_COMPRESSING = "正在压缩"
CALLBACKS_DOWNLOADING = "正在下载"
CALLBACKS_SCANING = "正在扫描"
CALLBACKS_FILE_NAME = "名称: %s"
CALLBACKS_PERCENT = "当前进度: %s %%"
CALLBACKS_FILE_SIZE = "文件大小: %s"
CALLBACKS_TOTAL_PERCENT = "总进度: %s %%"
CALLBACKS_TOTAL_FILE_SIZE = "文件总大小: %s"
CALLBACKS_HAVE_COPYED = "已复制: %s"
CALLBACKS_HAVE_EXTRACTED = "已解压: %s"
CALLBACKS_HAVE_DOWNLOADED = "已下载: %s"
CALLBACKS_HAVE_COPYED = "已复制: %s"

CALLBACKS_SCAN_APP_UNSAFE = "该软件包请求扩展权限。这将可能会获取你的个人信息。\n如果你不是从可靠来源获得此包，请谨慎处理。\n\n确定要继续安装？"
CALLBACKS_SCAN_APP_DANGEROUS = "警告！！！该软件包使用了重新挂载分区函数，\n并可能有让你的设备变砖的潜在风险。如果你\n不是从可靠来源获得此包，请谨慎处理。\n\n确定要继续安装？"

------------------主页--------------------------*
SAFE_MODE_TIP = "当前处于安全模式，请先在HENkaku设置里开启启用\n不安全自制软件，然后再回来操作。"
BATTERY_SHOW = "电量: %s%%"

PSP_MANAGER = "PSP游戏管理"
PSV_MANAGER = "PSV游戏管理"
MUSIC_PLAYER = "音乐播放器"
EXPLORE = "文件管理器"
ACCOUNT_MANAGER = "备份还原帐号"
IDENT_INFORMATION = "查看设备信息"
PLUGINS_MANAGER = "常用插件大全"
TF_USB_TOOL = "tf卡和usb插件"
REFRESH_APP = "刷新游戏气泡"
TAICFG_RELOAD = "重载变革设置"
RELIEVE_MC_BIND = "解除记忆卡关连"
UPDATE_DATABASE = "更新数据库"
REBUILD_DATABASE = "重构数据库"
REBOOT = "重启设备"
ABOUT = "关于"

MAIN_BUTTON_SELECT = "SELECT键:FTP服务"
MAIN_BUTTON_START = "START键:重启软件"
MAIN_BUTTON_POSITIVE = "○决定"

FTP_SERVER = "FTP服务器"
WLAN_ON = "Wlan:    已连接"
WLAN_OFF = "Wlan:    未连接"
FTP_ON = "FTP :    已启动\nftp://%s:1337\n\nFTP服务已启动，是否要关闭？"
FTP_OFF = "FTP :    未启动\n\nFTP服务未启动，是否要开启？"
FTP_INFORMATION_TIP = "ftp://%s:1337"

MOUNT_TF_UMA = "原装卡->ux0, tf卡->uma0"
MOUNT_TF_UX = "tf卡->ux0, 原装卡->uma0"
--MOUNT_USB_UX = "usb->ux0, 原装卡->uma0 (pstv专用)"
MOUNT_USB_UX = "usb->ux0 (pstv专用)"
UNMOUNT_TF_USB_PLUGINS = "卸载插件"

INSTALL_TF_USB_MODE_SELECT_OLD = "3.60固化/非固化"
INSTALL_TF_USB_MODE_SELECT_NEW = "3.60/3.65/3.67固化"

INSTALL_TF_USB_READY = "即将安装插件 %s ，\n\n确定继续？"
INSTALL_TF_USB_COMPLETE = "安装插件 %s 任务已执行完毕，\n\n是否要立即重启设备使其生效？"
UNINSTALL_TF_USB_READY = "即将卸载插件 tf卡和usb插件 ，\n\n确定继续？"
UNINSTALL_TF_USB_COMPLETE = "卸载插件 tf卡和usb插件 任务已执行完毕，\n\n是否要立即重启设备使其生效？"

NO_CONFIG = "未能找到config.txt文件，操作中止！"

REFRESH_APPS_READY = "即将执行刷新游戏气泡，这可能需要一些时间。\n\n确定继续？"
REFRESH_APPS_COMPLETE = "共刷新%s个游戏气泡。"
REFRESH_APPS_NO_DIR = "未找到目录，操作中止！"

TAICFG_RELOAD_READY = "即将执行重载变革设置，\n\n确定要继续？"
TAICFG_RELOAD_COMPLETE = "重载变革设置已执行完毕。"
TAICFG_RELOAD_FAILED = "重载变革设置失败！"

RELIEVE_MC_BIND_READY = "即将执行解除记忆卡关连，\n\n确定要继续？"
RELIEVE_MC_BIND_COMPLETE = "解除记忆卡关连已执行完毕。"

UPDATEDB_READY = "即将执行更新数据库，\n\n确定要继续？"
UPDATEDB_COMPLETE = "更新数据库任务已执行完毕，\n\n是否要立即重启设备使其生效？"

REBUILDDB_READY = "即将执行重构数据库，\n\n确定要继续？"
REBUILDDB_COMPLETE = "重构数据库任务已执行完毕，\n\n是否要立即重启设备使其生效？"

REBOOT_READY = "即将重启设备，\n\n确定继续？"

ABOUT_TXT = "作者: 一直改\n(百度psvita破解吧)\n版本: "..APP_VERSION.."   日期: "..APP_BUILD_DATE
UPDATE_LOG = "更新日志"
BUTTON_UPDATE_LOG = "△更新日志"

---------------PSV游戏管理器----------------------------------------
PSV_MANAGER_NO_GAME = "没有游戏..."

PSV_MANAGER_GAME_AMOUNT = "总数: %s"

PSV_MANAGER_BUTTON_MARK = "□:标记"
PSV_MANAGER_BUTTON_OPEN_MENU = "△:打开菜单"
PSV_MANAGER_BUTTON_LAUNCH_GAME = "○:运行游戏"
PSV_MANAGER_BUTTON_QUIT = "X:退出"
PSV_MANAGER_BUTTON_REFRESH_GAME_LIST = "START键:刷新列表"

PSV_MANAGER_REFRESH_APP = "刷新选中的游戏"
PSV_MANAGER_RENAME_APP = "修改游戏名称"
PSV_MANAGER_DELETE_GAME = "删除游戏"

PSV_MANAGER_FREESPACE_NOTENOUGH = "剩余空间不足，操作中止！"

PSV_MANAGER_LAUNCH_GAME_READY = "确定要运行 %s 这个游戏?"

PSV_MANAGER_REFRESH_APPS_READY = "确定要刷新这%s游戏？"
PSV_MANAGER_REFRESH_APPS_COMPLETE = "刷新成功%s个游戏，失败%s个游戏。"

PSV_MANAGER_RENAME_APP_READY = "即将修改游戏名称为:\n\"%s\"，\n(提示: 正版与nonpdrm游戏无法修改)\n\n确定继续？"
PSV_MANAGER_RENAME_APP_NO_SFO = "未找到sfo文件，操作终止！"
PSV_MANAGER_RENAME_APP_COMPLETE = "修改游戏名称成功。"
PSV_MANAGER_RENAME_APP_FAILED = "修改游戏名称失败！"

PSV_MANAGER_DELETE_GAME_READY = "确定要删除这%s个游戏?"
PSV_MANAGER_DELETE_GAME_COMPLETE = "共删除%s个游戏。"
PSV_MANAGER_DELETEING_GAME = "正在删除游戏%s，请稍候..."

----------------文件管理器----------------------------------------
EXPLORE_NO_DISK = "未找到可使用的盘符..."
EXPLORE_NO_FILE = "没有文件..."
EXPLORE_DIRECTORY = "文件夹"

EXPLORE_DEVINFO_INFORMATION = "已用 %s  /  总量 %s"
EXPLORE_DEVINFO_NO_INFORMATION = "未找到该盘符信息"

EXPLORE_BUTTON_MARK = "□:标记"
EXPLORE_BUTTON_OPEN_MENU = "△:打开菜单"
EXPLORE_BUTTON_BACK = "X:返回"
EXPLORE_BUTTON_POSITIVE = "○:决定"
EXPLORE_BUTTON_SWITCH_DISK = "←/→:切换盘符"

EXPLORE_MARKS_ALL = "全选"
EXPLORE_UNMARKS_ALL = "全不选"
EXPLORE_COPY = "复制"
EXPLORE_CUT = "剪切"
EXPLORE_PASTE = "粘贴"
EXPLORE_DELETE = "删除"
EXPLORE_RENAME = "重命名"
EXPLORE_MAKE_ZIP = "压缩"
EXPLORE_CREATE_FILE = "新建文件"
EXPLORE_MAKE_DIR = "新建文件夹"
EXPLORE_INSTALL_APPDIR = "安装游戏文件夹"
EXPLORE_EXPORT_MULTIMEDIA = "导出多媒体文件"
EXPLORE_QUIT = "退出"

EXPLORE_FREESPACE_NOTENOUGH = "剩余空间不足，操作中止！"

EXPLORE_INSTALL_APP_SAMPLE = "安装普通游戏"
EXPLORE_INSTALL_APP_NONPDRM = "安装NoNpDrm游戏"

EXPLORE_DELETE_READY = "确定要删除这%s个文件?"
EXPLORE_DELETE_COMPLETE = "共删除%s个文件。"

EXPLORE_RENAME_COMPLETE = "重命名成功。"
EXPLORE_RENAME_FAILED = "重命名失败！"
EXPLORE_RENAME_FAILED_ALREADY_EXISTS = "重命名失败！已存在同名文件或文件夹。"

EXPLORE_OPEN_ZIP_FAILED = "打开压缩文档失败！"
EXPLORE_OPEN_UKNOW_FILE_READY = "当前文件格式未知，是否要尝试用文本编辑器打开？"

EXPLORE_MAKE_ZIP_READY = "确定要将选中的文件压缩成zip格式文档?\n(提示: 该功能不稳定，有时可能会崩溃。)"
EXPLORE_MAKE_ZIP_FAILED = "创建压缩文档失败！"

EXPLORE_CREATE_FILE_FAILED = "创建文件失败！"
EXPLORE_CREATE_FILE_FAILED_ALREADY_EXISTS = "创建文件失败！已存在同名文件或文件夹。"

EXPLORE_MAKE_DIR_FAILED = "创建文件夹失败！"
EXPLORE_MAKE_DIR_FAILED_ALREADY_EXISTS = "创建文件夹失败！已存在同名文件或文件夹。"

EXPLORE_INSTALL_APP_READY = "确定要安装这%s个游戏?"
EXPLORE_INSTALL_APP_UN_UX_READY = "确定要安装这%s个游戏?"
EXPLORE_INSTALL_APP_COMPLETE = "共安装%s个游戏。"
EXPLORE_INSTALL_APP_NO_UX_DISK = "未找到ux0盘符，操作中止！"

EXPLORE_EXPORT_MULTIMEDIA_READY = "确定要尝试导出这%s个多媒体文件？"
EXPLORE_EXPORT_MULTIMEDIA_COMPLETE = "共导出%s个多媒体文件。"

----------------音乐播放器----------------------------------------
MUSIC_PLAYER_PLAYLIST = "播放列表"

MUSIC_PLAYER_BUTTON_PLAY = "□:播放"
MUSIC_PLAYER_BUTTON_PARSE = "□:暂停"
MUSIC_PLAYER_BUTTON_POSITIVE = "○:决定"
MUSIC_PLAYER_BUTTON_LR = "L/R:上/下一首"
MUSIC_PLAYER_BUTTON_START = "START键:息屏"

MUSIC_PLAYER_BUTTON_ORDER_PLAY = "△:顺序播放"
MUSIC_PLAYER_BUTTON_SINGLE_REPEAT = "△:单曲循环"
MUSIC_PLAYER_BUTTON_CYCLE_PLAY = "△:循环播放"

MUSIC_PLAYER_SONG_NOFOUND = "未找到mp3音乐文件...\n\n请将mp3音乐文件放于 ux0:/data/music/ 文件夹下"

----------------查看设备信息----------------------------------------
IDENT_INFORMATION_ACCESS = "访问模式:"
IDENT_INFORMATION_LANGUAGE = "系统语言:"
IDENT_INFORMATION_SWVERSION = "系统版本:"
IDENT_INFORMATION_NICK = "用户名:"
IDENT_INFORMATION_LOGIN = "登录账号:"
IDENT_INFORMATION_PASSWORD = "登录密码:"
IDENT_INFORMATION_PSNREGION = "PSN区域:"
IDENT_INFORMATION_IDPS = "IDPS:"
IDENT_INFORMATION_PSID = "PSID:"
IDENT_INFORMATION_ACCOUNT = "Account:"
IDENT_INFORMATION_MAC = "MAC地址:"
IDENT_INFORMATION_CPU = "CPU频率:"
IDENT_INFORMATION_BUS = "BUS频率:"
IDENT_INFORMATION_GPU = "GPU频率:"
IDENT_INFORMATION_XBAR = "XBAR频率:"
IDENT_INFORMATION_DEVINFO = "储存卡容量:"

IDENT_INFORMATION_ACCESS_SAFE_MODE = "安全模式"
IDENT_INFORMATION_ACCESS_UNSAFE_MODE = "不安全模式"
IDENT_INFORMATION_DEVINFO_NO_INFORMATION = "未找到存储卡信息"
IDENT_INFORMATION_DEVINFO_INFORMATION = "已用 %s  /  总量 %s"

IDENT_INFORMATION_BUTTON_SAVE = "△:保存"
IDENT_INFORMATION_BUTTON_QUIT = "X:退出"

IDENT_INFORMATION_SAVE_READY = "即将保存设备信息到 ux0:data/ident.txt ，\n\n确定要继续？"
IDENT_INFORMATION_SAVE_COMPLETE = "保存设备信息到 ux0:data/ident.txt \n\n已执行完毕。"
IDENT_INFORMATION_SAVE_FAILED = "保存设备信息失败！"

----------------备份还原帐号----------------------------------------
ACCOUNT_MANAGER_NO_SAVEDATA = "没有找到帐号备份..."

ACCOUNT_MANAGER_BUTTON_MARK = "□:标记"
ACCOUNT_MANAGER_BUTTON_MENU = "△:打开菜单"
ACCOUNT_MANAGER_BUTTON_POSITIVE = "○:确定"
ACCOUNT_MANAGER_BUTTON_QUIT = "X:退出"

ACCOUNT_MANAGER_MENU_SAVE = "备份当前帐号"
ACCOUNT_MANAGER_MENU_CLEAR = "清除当前帐号"
ACCOUNT_MANAGER_MENU_BACKUP = "还原选中备份"
ACCOUNT_MANAGER_MENU_DELETE = "删除选中备份"
ACCOUNT_MANAGER_MENU_ABOUT = "说明"

ACCOUNT_MANAGER_MENU_ABOUT_TXT = "备份路径为: %s"

ACCOUNT_MANAGER_NO_SAVADATA = "没有找到帐号备份..."
ACCOUNT_MANAGER_NO_LOGIN = "当前未登录任何帐号！"
ACCOUNT_MANAGER_SAVE_READY = "即将执行备份当前帐号。\n如果当前帐号已有过备份，则会覆盖。\n\n确定继续？"
ACCOUNT_MANAGER_SAVE_COMPLETE = "备份当前帐号任务已执行完毕。"
ACCOUNT_MANAGER_SAVE_FAILED = "备份当前帐号任务执行失败！"
ACCOUNT_MANAGER_CLEAR_READY = "即将执行清除当前帐号，这将会清除您的所有系统设置。\n如果您未对当前帐号执行过备份，建议先备份以便日后还原。\n\n确定继续？"
ACCOUNT_MANAGER_CLEAR_COMPLETE = "清除当前帐号任务已执行完毕，请立即重启设备使其生效。\n\n是否要立即重启设备？"
ACCOUNT_MANAGER_BACKUP_READY = "即将执行还原 %s 帐号。\n\n确定继续？"
ACCOUNT_MANAGER_BACKUP_COMPLETE = "还原 %s 帐号任务已执行完毕，\n请立即重启设备使其生效。\n\n是否要立即重启设备？"
ACCOUNT_MANAGER_DELETE_READY = "即将删除这%s个帐号备份，删除后将无法还原该帐号。\n\n确定继续？"
ACCOUNT_MANAGER_DELETE_COMPLETE = "共删除%s个帐号备份。"

----------------常用插件大全----------------------------------------
PLUGINS_MANAGER_NONPDRM = "NoNpDrm插件"
PLUGINS_MANAGER_DOWNLOAD_ENABLE = "浏览器下载插件"
PLUGINS_MANAGER_SHELLBAT = "电量百分比插件"
PLUGINS_MANAGER_OCLOCKVITA = "oclockvita超频插件 (SELECT+↑呼出)"
PLUGINS_MANAGER_VSH = "vsh菜单插件 (L+R+START呼出)"
PLUGINS_MANAGER_VITACHEAT = "vitacheat金手指插件 (L+→呼出)"
PLUGINS_MANAGER_DSMOTION = "ps3、4手柄插件 (pstv用)"
PLUGINS_MANAGER_ADRENALINE_KERNEL = "Adrenaline-6免二次启动 (需变革O)"
PLUGINS_MANAGER_CAMERA_PATCH_LITE = "Adrenaline右摇杆视角插件"
PLUGINS_MANAGER_RENPDRM = "ReNpDrm插件"
PLUGINS_MANAGER_TROPHAX = "奖杯解锁插件 (SELECT+START呼出)"
PLUGINS_MANAGER_FPS = "FPS帧数显示插件"
PLUGINS_MANAGER_GOHANMEM = "GoHANmem金手指插件 (↑+SELECT或L+START呼出)"

PLUGINS_MANAGER_BUTTON_MARK = "□:标记"
PLUGINS_MANAGER_BUTTON_OPEN_MENU = "△:打开菜单"
PLUGINS_MANAGER_BUTTON_POSITIVE = "○:确定"
PLUGINS_MANAGER_BUTTON_QUIT = "X:退出"

PLUGINS_MANAGER_MARKS_ALL = "全选"
PLUGINS_MANAGER_UNMARKS_ALL = "全不选"
PLUGINS_MANAGER_INSTALL_PLUGINS = "安装选中插件"
PLUGINS_MANAGER_UNINSTALL_PLUGINS = "卸载选中插件"
PLUGINS_MANAGER_PLUGINS_ABOUT = "插件说明"

PLUGINS_MANAGER_INSTALL_PLUGINS_READY = "确定要安装这%s个插件?"
PLUGINS_MANAGER_INSTALL_PLUGINS_COMPLETE = "安装成功%s个插件，失败%s个插件。\n\n是否要立即重启设备使其生效？"
PLUGINS_MANAGER_UNINSTALL_PLUGINS_READY = "确定要卸载这%s个插件?"
PLUGINS_MANAGER_UNINSTALL_PLUGINS_COMPLETE = "共卸载%s个插件。\n\n是否要立即重启设备使其生效？"

----------------文本编辑器----------------------------------------
TEXTEDITOR_BUTTON_INSERT_LINE = "□:删除行"
TEXTEDITOR_BUTTON_DELETE_LINE = "△:添加行"
TEXTEDITOR_BUTTON_POSITIVE = "○:编辑行"
TEXTEDITOR_BUTTON_LR = "L/R:上/下翻页"
TEXTEDITOR_BUTTON_BUTTON_QUIT = "X:退出"

TEXTEDITOR_PLEASE_INPUT = "请输入"

TEXTEDITOR_BUTTON_SAVE = "○:保存"
TEXTEDITOR_BUTTON_UNSAVE = "△:不保存"

TEXTEDITOR_FILE_TOO_BIG = "文件过大，只显示1~9999行。"
TEXTEDITOR_QUIT_SAVE_READY = "即将退出文本编辑器，\n\n退出前是否要保存？"
TEXTEDITOR_SAVING = "保存中，请稍候..."
TEXTEDITOR_SAVE_COMPLETE = "保存完毕"














