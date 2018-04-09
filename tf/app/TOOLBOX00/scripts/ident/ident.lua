-------------------ident--------------------


---------------第一次进初始化----------------------
if not secondIntoIdent then
 -----------------加载脚本------------------- 
 dofile("scripts/ident/ident_functions.lua")
 dofile("scripts/ident/ident_graphics_function.lua")
 dofile("scripts/ident/ident_button_setting_function.lua")
 
 -----------------全局变量------------------------
 identTitleList = {
  IDENT_INFORMATION_ACCESS,
  IDENT_INFORMATION_LANGUAGE,
  IDENT_INFORMATION_SWVERSION,
  IDENT_INFORMATION_NICK,
  IDENT_INFORMATION_LOGIN,
  IDENT_INFORMATION_PASSWORD,
  IDENT_INFORMATION_PSNREGION,
  IDENT_INFORMATION_IDPS,
  IDENT_INFORMATION_PSID,
  IDENT_INFORMATION_ACCOUNT,
  IDENT_INFORMATION_MAC,
  IDENT_INFORMATION_CPU,
  IDENT_INFORMATION_BUS,
  IDENT_INFORMATION_GPU,
  IDENT_INFORMATION_XBAR,
  IDENT_INFORMATION_DEVINFO,
 }

 identButtonTextList = {
  IDENT_INFORMATION_BUTTON_SAVE,
  IDENT_INFORMATION_BUTTON_QUIT,
 }

 secondIntoIdent = true
  
end

----------------continue---------------------------
ident_get_ident_list()

-----------------while---------------------
identRun = true
while identRun do

 ident_graphics() --构画界面
 ident_button_setting() --设置按键
 musicplayer_autoplaynextmusic() --自动播放音乐

end









