--------------------script-------------------------------------------------------------------


-------------------加载脚本---------------------- 
dofile("scripts/strings.lua")
dofile("scripts/colors.lua")
dofile("scripts/sample_functions.lua")
dofile("scripts/vita_functions.lua")
dofile("scripts/dialog_functions.lua")
dofile("scripts/callbacks.lua")

dofile("scripts/main/main_functions.lua")
dofile("scripts/main/main_graphics_function.lua")
dofile("scripts/main/main_button_setting_function.lua")

dofile("scripts/musicplayer/musicplayer_functions.lua")
dofile("scripts/musicplayer/musicplayer_autoplaynextmusic_function.lua")

------------------全局变量------------------------------------------------------
--buttons.analogtodpad(60) --摇杆死区
if files.exists("resources/back.png") then
 back = image.load("resources/back.png") --读取背景图片
elseif files.exists("resources/back.jpg") then
 back = image.load("resources/back.jpg") --读取背景图片
end
if back then image.resize(back, 960, 544) end --重定义图片大小充满屏幕
--mCdirPath = files.cdir() --记录软件本身的默认工作目录
INSTALL_APP_SCAN = true

VITA_SWVERSION = tonumber(os.swversion())

--选项
scriptInfo = {
 list = {
  PSV_MANAGER,
  EXPLORE,
  MUSIC_PLAYER,
  IDENT_INFORMATION,
  ACCOUNT_MANAGER,
  PLUGINS_MANAGER,
  TF_USB_TOOL,
  REFRESH_APP,
  TAICFG_RELOAD,
  RELIEVE_MC_BIND,
  UPDATE_DATABASE,
  REBUILD_DATABASE,
  REBOOT,
  ABOUT,
 },
 top = 1,
 focus = 1,
}

--按键
scriptButtonTextList = {
 MAIN_BUTTON_SELECT,
 MAIN_BUTTON_START,
 MAIN_BUTTON_POSITIVE,
}

--tf卡和usb插件
gamesdMenuDialogInfo = {
 list = {
  MOUNT_TF_UMA,
  MOUNT_TF_UX,
  MOUNT_USB_UX,
  UNMOUNT_TF_USB_PLUGINS, 
 },
 focus = 1,
 top = 1,
}

installModeSelectMenuInfo = {
 list = {
 INSTALL_TF_USB_MODE_SELECT_OLD,
 INSTALL_TF_USB_MODE_SELECT_NEW,
 },
 top = 1,
 focus = 1,
}

-------------------continue----------------------------
buttons.interval(10,10) --设置按键延迟和连发间隔
--buttons.analogtodpad(30) --设置摇杆死区
color.loadpalette() --读取颜色参数

--检测安全模式
check_safe()

--------------软件启动时自动循环播放音乐----------------------
--（请将要自动播放的mp3音乐命名为bgm.mp3放于resources目录下）----
local pathToBgmMusic = "resources/bgm.mp3"
if files.exists(pathToBgmMusic) then
 playingSongSnd = sound.load(pathToBgmMusic)
 sound.play(playingSongSnd)
 sound.loop(playingSongSnd)
 musicPlayMode = 2
 autoPlayMusicNext = false
end --自动播放音乐代码结束

---------------------while---------------------------------------
scriptRun = true
while scriptRun do

 main_graphics() --构画界面
 main_button_setting() --设置按键
 musicplayer_autoplaynextmusic() --自动播放下一首音乐

end
















