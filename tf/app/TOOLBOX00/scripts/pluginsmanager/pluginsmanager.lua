-----------------pluginsmanager-------------------------------------------------------------------


---------------第一次进初始化----------------------
if not secondIntoPluginsmanager then

 -----------------加载脚本---------------------- 
 dofile("scripts/pluginsmanager/pluginsmanager_functions.lua")
 dofile("scripts/pluginsmanager/pluginsmanager_graphics_function.lua")
 dofile("scripts/pluginsmanager/pluginsmanager_button_setting_function.lua")
 
 --列表显示行数
 pluginsmanagerListShowCount = 20
 --列表显示间隔
 pluginsmanager_list_y_interval = 5
 --列表滚动条
 pluginsmanager_scrollbarBK_w = 6
 pluginsmanager_scrollbar_w = pluginsmanager_scrollbarBK_w
 pluginsmanager_scrollbarBK_h = (screen.textheight(1) + pluginsmanager_list_y_interval)*pluginsmanagerListShowCount - pluginsmanager_list_y_interval
 
 pluginsDataRootPath = "resources/sample_plugins/"

 pluginsmanagerInfo = { --插件列表数据
  list = { --mode 1/tai 2/plugins 3/psp
   {title = PLUGINS_MANAGER_NONPDRM, version = "sample", srcdir = "nonpdrm/", about = "nonpdrm.about", mode = 1, names = {"nonpdrm.skprx"}, modifys = {true}, checkselfs = {true}, txts = {"tai/config.txt"}, locations = {"*KERNEL"}, dstdirs = {"ur0:tai/"}, strs = {"ur0:tai/nonpdrm.skprx"}, uninDeletes = {true}},
   {title = PLUGINS_MANAGER_DOWNLOAD_ENABLE, version = "sample", srcdir = "download_enabler/", about = "download_enabler.about", mode = 1, names = {"download_enabler.suprx"}, modifys = {true}, checkselfs = {true}, txts = {"tai/config.txt"}, locations = {"*main"}, dstdirs = {"ur0:tai/"}, strs = {"ur0:tai/download_enabler.suprx"}, uninDeletes = {true}},
   {title = PLUGINS_MANAGER_SHELLBAT, version = "sample", srcdir = "shellbat/", about = "shellbat.about", mode = 1, names = {"shellbat.suprx"}, modifys = {true}, checkselfs = {true}, txts = {"tai/config.txt"}, locations = {"*main"}, dstdirs = {"ur0:tai/"}, strs = {"ur0:tai/shellbat.suprx"}, uninDeletes = {true}},
   {title = PLUGINS_MANAGER_OCLOCKVITA, version = 3.60, srcdir = "oclockvita/", about = "oclockvita.about", mode = 1, names = {"oclockvita.suprx"}, modifys = {true}, checkselfs = {true}, txts = {"tai/config.txt"}, locations = {"*ALL"}, dstdirs = {"ur0:tai/"}, strs = {"ur0:tai/oclockvita.suprx"}, uninDeletes = {true}},
   {title = PLUGINS_MANAGER_VSH, version = "sample", srcdir = "vsh/", about = "vsh.about", mode = 1, names = {"kuio.skprx", "vsh.suprx"}, modifys = {true, true}, checkselfs = {true, true}, txts = {"tai/config.txt", "tai/config.txt"}, locations = {"*KERNEL", "*ALL"}, dstdirs = {"ur0:tai/", "ur0:tai/"}, strs = {"ur0:tai/kuio.skprx", "ur0:tai/vsh.suprx"}, uninDeletes = {true, true}},
   {title = PLUGINS_MANAGER_VITACHEAT, version = 3.60, srcdir = "vitacheat/", about = "vitacheat.about", mode = 1, names = {"vitacheat.skprx", "vitacheat"}, modifys = {true, false}, checkselfs = {true, false}, txts = {"tai/config.txt", nil}, locations = {"*KERNEL", nil}, dstdirs = {"ur0:tai/", "ux0:"}, strs = {"ur0:tai/vitacheat.skprx", nil}, uninDeletes = {true, false}},
   {title = PLUGINS_MANAGER_GOHANMEM, version = "sample", srcdir = "GoHANmem/", about = "GoHANmem.about", mode = 2, names = {"GoHANmem.suprx"}, modifys = {true}, checkselfs = {true}, txts = {"plugins/game.txt"}, locations = {nil}, dstdirs = {"plugins/"}, strs = {"ux0:plugins/GoHANmem.suprx 1"}, uninDeletes = {true}},
   {title = PLUGINS_MANAGER_DSMOTION, version = 3.60, srcdir = "dsmotion/", about = "dsmotion.about", mode = 1, names = {"dsmotion.skprx", "dsmotion.suprx"}, modifys = {true, true}, checkselfs = {true, true}, txts = {"tai/config.txt", "tai/config.txt"}, locations = {"*KERNEL", "*ALL"}, dstdirs = {"ur0:tai/", "ur0:tai/"}, strs = {"ur0:tai/dsmotion.skprx", "ur0:tai/dsmotion.suprx"}, uninDeletes = {true, true}},
   {title = PLUGINS_MANAGER_ADRENALINE_KERNEL, version = "sample", srcdir = "adrenaline_kernel/", about = "adrenaline_kernel.about", mode = 1, names = {"adrenaline_kernel.skprx"}, modifys = {true}, checkselfs = {true}, txts = {"tai/config.txt"}, locations = {"*KERNEL"}, dstdirs = {nil}, strs = {"ux0:app/PSPEMUCFW/sce_module/adrenaline_kernel.skprx"}, uninDeletes = {false}},
   {title = PLUGINS_MANAGER_CAMERA_PATCH_LITE, version = "sample", srcdir = "camera_patch_lite/", about = "camera_patch_lite.about", mode = 3, names = {"camera_patch_lite.prx", "camera_patch_lite.ini"}, modifys = {true, false}, checkselfs = {true, false}, txts = {"pspemu/seplugins/game.txt", nil}, locations = {nil, nil}, dstdirs = {"pspemu/seplugins/", "pspemu/seplugins/"}, strs = {"ms0:/seplugins/camera_patch_lite.prx 1", nil}, uninDeletes = {true, true}},
   {title = PLUGINS_MANAGER_RENPDRM, version = 3.60, srcdir = "renpdrm/", about = "renpdrm.about", mode = 1, names = {"renpdrm.skprx", "restore.suprx", "restore.suprx", "restore.suprx"}, modifys = {true, true, true, true}, checkselfs = {true, true, false, false}, txts = {"tai/config.txt", "tai/config.txt", "tai/config.txt", "tai/config.txt"}, locations = {"*KERNEL", "*main", "*NPXS10002", "*NPXS10015"}, dstdirs = {"ur0:tai/", "ur0:tai/", nil, nil}, strs = {"ur0:tai/renpdrm.skprx", "ur0:tai/restore.suprx", "ur0:tai/restore.suprx", "ur0:tai/restore.suprx"}, uninDeletes = {true, true, false, false}},
   {title = PLUGINS_MANAGER_TROPHAX, version = "sample", srcdir = "trophax/", about = "trophax.about", mode = 1, names = {"trophax.suprx"}, modifys = {true}, checkselfs = {true}, txts = {"tai/config.txt"}, locations = {"*ALL"}, dstdirs = {"ur0:tai/"}, strs = {"ur0:tai/trophax.suprx"}, uninDeletes = {true}},
   {title = PLUGINS_MANAGER_FPS, version = "sample", srcdir = "fps/", about = "fps.about", mode = 1, names = {"fps.suprx"}, modifys = {true}, checkselfs = {true}, txts = {"tai/config.txt"}, locations = {"*ALL"}, dstdirs = {"ur0:tai/"}, strs = {"ur0:tai/fps.suprx"}, uninDeletes = {true}},
  },
  top = 1,
  focus = 1,
  marksCounts = 0
 }
 
 local j = 1
 for i = 1, #pluginsmanagerInfo.list do
  if pluginsmanagerInfo.list[j].version ~= "sample" and VITA_SWVERSION > pluginsmanagerInfo.list[j].version then
   table.remove(pluginsmanagerInfo.list, j)
  else
   j += 1
  end
 end

 pluginsmanagerButtonTextList = { --按键
  PLUGINS_MANAGER_BUTTON_MARK,
  PLUGINS_MANAGER_BUTTON_OPEN_MENU,
  PLUGINS_MANAGER_BUTTON_POSITIVE,
  PLUGINS_MANAGER_BUTTON_QUIT,
 }

 pluginsmanagerMenuDialogInfo = { --弹窗菜单
  list = {
   PLUGINS_MANAGER_MARKS_ALL,
   PLUGINS_MANAGER_INSTALL_PLUGINS,
   PLUGINS_MANAGER_UNINSTALL_PLUGINS,
   PLUGINS_MANAGER_PLUGINS_ABOUT,
  },
  focus = 1,
  top = 1,
 }

	if #pluginsmanagerInfo.list > pluginsmanagerListShowCount then
  pluginsmanager_scrollbarOne_h = pluginsmanager_scrollbarBK_h/#pluginsmanagerInfo.list
  pluginsmanager_scrollbar_h = pluginsmanager_scrollbarOne_h*pluginsmanagerListShowCount
 end
 
 secondIntoPluginsmanager = true
  
end

-----------------全局变量------------------------------------------------------------------------
pluginsmanagerInfo.top = 1
pluginsmanagerInfo.focus = 1

----------------continue---------------------------
--取消选中
plugins_unmark_all()

-----------------while---------------------------------------
pluginsmanagerRun = true
while pluginsmanagerRun do

 pluginsmanager_graphics() --构画界面
 pluginsmanager_button_setting() --设置按键
 musicplayer_autoplaynextmusic() --自动播放下一首音乐

end
------------------------------------------------














