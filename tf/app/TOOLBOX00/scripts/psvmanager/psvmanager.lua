-----------------psvmanager-------------------------------------------------------------------


---------------第一次进初始化----------------------
if not secondIntoPsvmanager then
 
 -----------------加载脚本---------------------- 
 dofile("scripts/psvmanager/psvmanager_functions.lua")
 dofile("scripts/psvmanager/psvmanager_graphics_function.lua")
 dofile("scripts/psvmanager/psvmanager_button_setting_function.lua")

 --列表显示行数
 psvmanagerListShowCount = 20
 --列表显示间隔
 psvmanager_list_y_interval = 5
 --列表滚动条
 psvmanager_scrollbarBK_w = 6
 psvmanager_scrollbar_w = psvmanager_scrollbarBK_w
 psvmanager_scrollbarBK_h = (screen.textheight(1) + psvmanager_list_y_interval)*psvmanagerListShowCount - psvmanager_list_y_interval
 
 psvmanagerInfo = {
  list = nil,
  top = 1,
  focus = 1,
  marksCounts = 0,
 }

 psvmanagerButtonTextList = {
  PSV_MANAGER_BUTTON_MARK,
  PSV_MANAGER_BUTTON_OPEN_MENU,
  PSV_MANAGER_BUTTON_LAUNCH_GAME,
  PSV_MANAGER_BUTTON_QUIT,
  PSP_MANAGER_BUTTON_REFRESH_GAME_LIST,
 }

 psvmanagerMenuDialogInfo = {
  list = {
   PSV_MANAGER_REFRESH_APP,
   PSV_MANAGER_RENAME_APP,
   PSV_MANAGER_DELETE_GAME,
  },
  focus = 1,
  top = 1,
 }
 
 secondIntoPsvmanager = true

end

----------------continue---------------------------
--获取列表
if not psvmanagerInfo.list then
 mainLoadWaiting(PSV_MANAGER, psvmanagerButtonTextList)
 get_psvgame_list()
 show_close_dialog()
end
--清除标记
psvmanager_unmark_all()

psvmanagerInfo.top = 1
psvmanagerInfo.focus = 1
psvmanagerInfo.marksCounts = 0


-----------------while---------------------------------------
psvmanagerRun = true
while psvmanagerRun do

 psvmanager_graphics() --构画界面
 psvmanager_button_setting() --设置按键
 musicplayer_autoplaynextmusic() --自动播放下一首音乐

end
------------------------------------------------














