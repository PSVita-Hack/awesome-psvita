-----------------accountmanager-------------------------------------------------------------------


---------------第一次进初始化----------------------
if not secondIntoAccountmanager then

 -----------------加载脚本---------------------- 
 dofile("scripts/accountmanager/accountmanager_functions.lua")
 dofile("scripts/accountmanager/accountmanager_graphics_function.lua")
 dofile("scripts/accountmanager/accountmanager_button_setting_function.lua")

 pathToAccounts = "ux0:data/accounts/"
 pathToMISC = "ur0:user/00/np/myprofile.dat"
 
 --列表显示行数
 accountmanagerListShowCount = 20
 --列表显示间隔
 accountmanager_list_y_interval = 5
 --列表滚动条
 accountmanager_scrollbarBK_w = 6
 accountmanager_scrollbar_w = accountmanager_scrollbarBK_w
 accountmanager_scrollbarBK_h = (screen.textheight(1) + accountmanager_list_y_interval)*accountmanagerListShowCount - accountmanager_list_y_interval

 accountmanagerButtonTextList = {
  ACCOUNT_MANAGER_BUTTON_MARK,
  ACCOUNT_MANAGER_BUTTON_MENU,
  ACCOUNT_MANAGER_BUTTON_POSITIVE,
  ACCOUNT_MANAGER_BUTTON_QUIT,
 }

 accountmanagerMenuDialogInfo = {
  list = {
   ACCOUNT_MANAGER_MENU_SAVE,
   ACCOUNT_MANAGER_MENU_CLEAR,
   ACCOUNT_MANAGER_MENU_BACKUP,
   ACCOUNT_MANAGER_MENU_DELETE,
   ACCOUNT_MANAGER_MENU_ABOUT,
  },
  top = 1,
  focus = 1,
  usable = {},
 }
 
 accountmanagerInfo = {
  list = nil,
  top = 1,
  focus = 1,
  marksCounts = 0,
 }

end

-------------------continue----------------------------
--检测存档路径
local checkpathToAccounts = check_file(pathToAccounts)
if checkpathToAccounts ~= 2 then
 mainLoadWaiting(ACCOUNT_MANAGER, accountmanagerButtonTextList)
 files.delete(pathToAccounts)
 files.mkdir(pathToAccounts)
 show_close_dialog()
end
--获取登录帐号
currentId = os.login()
--获取帐号备份列表
getAccountList()
accountmanagerInfo.top = 1
accountmanagerInfo.focus = 1

-----------------while---------------------------------------
accountmanagerRun = true
while accountmanagerRun do

 accountmanager_graphics() --构画界面
 accountmanager_button_setting() --设置按键
 musicplayer_autoplaynextmusic() --自动播放下一首音乐

end
------------------------------------------------














