-------main_button_setting_function-------------------------------------------------------------------

function main_button_setting()
 
 buttons.read() --读取按键

 ---------------select键设置-------------------------
 if buttons.select then
 
  ftp_server()
  
 end --select键设置
 
 -----------------start键设置-------------------------
 if buttons.start then
 
  os.restart()
  
 end --start键设置
 
 -------------------↑键设置-------------------------------
 if buttons.up or buttons.analogly < -60 then
  
	 if scriptInfo.focus > 1 then
	  scriptInfo.focus -= 1 
  end

	end --↑键设置
     
 -------------------↓键设置-------------------------------
 if buttons.down or buttons.analogly > 60 then
  
  if scriptInfo.focus < #scriptInfo.list then
   scriptInfo.focus += 1
  end
   
	end --↓键设置
 
 -------------------○键设置-------------------------------
 if buttons.circle then
 
  if scriptInfo.focus == 1 then --psv游戏管理
   dofile("scripts/psvmanager/psvmanager.lua")

  elseif scriptInfo.focus == 2 then --文件管理器
   dofile("scripts/explorer/explorer.lua")
  
  elseif scriptInfo.focus == 3 then --音乐播放器
   dofile("scripts/musicplayer/musicplayer.lua")
  
  elseif scriptInfo.focus == 4 then --查看设备信息
   dofile("scripts/ident/ident.lua")
  
  elseif scriptInfo.focus == 5 then --备份还原帐号
   dofile("scripts/accountmanager/accountmanager.lua")
      
  elseif scriptInfo.focus == 6 then --常用插件大全
   dofile("scripts/pluginsmanager/pluginsmanager.lua")
   
  elseif scriptInfo.focus == 7 then --tf卡和usb插件
   gamesdMenuDialogInfo.focus = 1
   local installSelect = show_list_dialog(PLEASE_SELECT, gamesdMenuDialogInfo, BUTTON_CANCEL, BUTTON_POSITIVE)
   if installSelect == 1 then
    if VITA_SWVERSION == 3.60 then
     installModeSelectMenuInfo.focus = 1
     local state = show_list_dialog(PLEASE_SELECT, installModeSelectMenuInfo, BUTTON_CANCEL, BUTTON_POSITIVE)
     if state == 1 then --安装3.60插件
      local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
      if state == 1 then 
       install_gamesd(1)
      end
     elseif state == 2 then --安装3.65/3.67插件
      local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
      if state == 1 then 
       install_gamesd(4)
      end
     end
    elseif VITA_SWVERSION > 3.60 then
     local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
     if state == 1 then 
      install_gamesd(4)
     end
    end
    
   elseif installSelect == 2 then
    if VITA_SWVERSION == 3.60 then
     installModeSelectMenuInfo.focus = 1
     local state = show_list_dialog(PLEASE_SELECT, installModeSelectMenuInfo, BUTTON_CANCEL, BUTTON_POSITIVE)
     if state == 1 then --安装3.60插件
      local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
      if state == 1 then 
       install_gamesd(2)
      end
     elseif state == 2 then --安装3.65/3.67插件
      local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
      if state == 1 then 
       install_gamesd(5)
      end
     end
    elseif VITA_SWVERSION > 3.60 then
     local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
     if state == 1 then 
      install_gamesd(5)
     end
    end
       
   elseif installSelect == 3 then
    if VITA_SWVERSION == 3.60 then
     installModeSelectMenuInfo.focus = 1
     local state = show_list_dialog(PLEASE_SELECT, installModeSelectMenuInfo, BUTTON_CANCEL, BUTTON_POSITIVE)
     if state == 1 then --安装3.60插件
      local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
      if state == 1 then 
       install_gamesd(3)
      end
     elseif state == 2 then --安装3.65/3.67插件
      local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
      if state == 1 then 
       install_gamesd(6)
      end
     end
    elseif VITA_SWVERSION > 3.60 then
     local state = show_sample_dialog(TIPS, string.format(INSTALL_TF_USB_READY, scriptInfo.list[scriptInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
     if state == 1 then 
      install_gamesd(6)
     end
    end

   elseif installSelect == 4 then
    local installReady = show_sample_dialog(TIPS, string.format(UNINSTALL_TF_USB_READY, gamesdMenuDialogInfo.list[gamesdMenuDialogInfo.focus]), BUTTON_CANCEL, BUTTON_POSITIVE)
    if installReady == 1 then
     uninstall_gamesd()
    end
    
   end

  elseif scriptInfo.focus == 8 then --刷新游戏气泡
   local state = show_sample_dialog(TIPS, REFRESH_APPS_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    refresh_psv_apps()
   end   

  elseif scriptInfo.focus == 9 then --重载变革设置
   local state = show_sample_dialog(TIPS, TAICFG_RELOAD_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    show_waiting_dialog(WAIT_EXECUTING)
    local state = os.taicfgreload()
    if state == 1 then
     show_sample_dialog(TIPS, TAICFG_RELOAD_COMPLETE, BUTTON_BACK)
    else
     show_sample_dialog(TIPS, TAICFG_RELOAD_FAILED, BUTTON_BACK)
    end
   end

  elseif scriptInfo.focus == 10 then --解除记忆卡关连
   local state = show_sample_dialog(TIPS, RELIEVE_MC_BIND_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    show_waiting_dialog(WAIT_EXECUTING)
	   files.delete("ux0:id.dat")
	   files.delete("uma0:id.dat")
	   local state = show_sample_dialog(TIPS, RELIEVE_MC_BIND_COMPLETE, BUTTON_BACK)
    if state == 1 then
     show_waiting_dialog(WAIT_EXECUTING)
     power.restart()
    end
   end
   
  elseif scriptInfo.focus == 11 then --更新数据库
   local state = show_sample_dialog(TIPS, UPDATEDB_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    show_waiting_dialog(WAIT_EXECUTING)
    os.updatedb()
    local state = show_sample_dialog(TIPS, UPDATEDB_COMPLETE, BUTTON_CANCEL, BUTTON_POSITIVE)
    if state == 1 then
     show_waiting_dialog(WAIT_EXECUTING)
     power.restart()
    end
   end
   
  elseif scriptInfo.focus == 12 then --重构数据库
   local state = show_sample_dialog(TIPS, REBUILDDB_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    show_waiting_dialog(WAIT_EXECUTING)
    rebuilddb()
    local state = show_sample_dialog(TIPS, REBUILDDB_COMPLETE, BUTTON_CANCEL, BUTTON_POSITIVE)
    if state == 1 then
     show_waiting_dialog(WAIT_EXECUTING)
     power.restart()
    end
   end
   
  elseif scriptInfo.focus == 13 then --重启设备
   local state = show_sample_dialog(TIPS, REBOOT_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    show_waiting_dialog(WAIT_EXECUTING)
    power.restart()
   end
      
  elseif scriptInfo.focus == 14 then --关于
   local state = show_sample_dialog(ABOUT, ABOUT_TXT, BUTTON_BACK, nil, BUTTON_UPDATE_LOG)
   if state == 2 then
    SCREENSHOTS = nil
    EDIT_FILE_PATH = "resources/updatelog.txt"
    if files.exists(EDIT_FILE_PATH) then
     EDIT_FILE_NAME = UPDATE_LOG    
     TEXTEDITOR_READ_ONLY = true
     dofile("scripts/texteditor/texteditor.lua")
    end
    
   end
   
  end
 end --○键设置
 
---------------------------------------
end














