------psvmanager_button_setting_function-----------------------------------


function psvmanager_button_setting()
 
 buttons.read() --读取按键

 ---------------select键设置-------------------------
 if buttons.select then
 
  ftp_server()
  
 end --select键设置
 
 -----------------start键设置-------------------------
 if buttons.start then
 
  SCREENSHOTS = screen.buffertoimage()
  show_waiting_dialog(WAIT_LOADING)
  get_psvgame_list()
  show_close_dialog()
  
 end --start键设置

 --------------------↑键设置-------------------------------
 if buttons.up or buttons.analogly < -60 then

  if psvmanagerInfo.list and #psvmanagerInfo.list > 0 then
	  if psvmanagerInfo.focus > 1 then
	   psvmanagerInfo.focus -= 1
	  end
  end
  
 end
 
--------------------↓键设置-------------------------------
 if buttons.down or buttons.analogly > 60 then
  
  if psvmanagerInfo.list and #psvmanagerInfo.list > 0 then
	  if psvmanagerInfo.focus < #psvmanagerInfo.list then
	   psvmanagerInfo.focus += 1
	  end
	 end

 end

 -------------------X键设置-----------------------------------
 if buttons.cross then
  
  psvmanagerRun = false
  
 end
 
--------------------□键设置-------------------------------
 if buttons.square  and #psvmanagerInfo.list > 0 then
 
  if psvmanagerInfo.list and #psvmanagerInfo.list > 0 then
	  if psvmanagerInfo.list[psvmanagerInfo.focus].mark then
    psvmanagerInfo.list[psvmanagerInfo.focus].mark = false
    psvmanagerInfo.marksCounts -= 1
   else
    psvmanagerInfo.list[psvmanagerInfo.focus].mark = true
    psvmanagerInfo.marksCounts += 1
   end
  end

 end

--------------------△键设置-------------------------------
 if buttons.triangle then
  
  if psvmanagerInfo.list and #psvmanagerInfo.list > 0 then
   psvmanagerMenuDialogInfo.usable = {true, true, true, true}
  else
   psvmanagerMenuDialogInfo.usable = {true, false, false, false}
  end
  psvmanagerMenuDialogInfo.focus = 1
  local state = show_list_dialog(PLEASE_SELECT, psvmanagerMenuDialogInfo, BUTTON_CANCEL, BUTTON_POSITIVE)
  if state == 1 or state == 3 then
   SELECT_COUNTS = 1
   if psvmanagerInfo.list[psvmanagerInfo.focus].mark then
    SELECT_COUNTS = psvmanagerInfo.marksCounts
   end
  end
  --刷新选中的游戏
  if state == 1 then
   local state = show_sample_dialog(TIPS, string.format(PSV_MANAGER_REFRESH_APPS_READY, SELECT_COUNTS), BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    psvmanager_refresh_apps()
   end
   
  --修改游戏名称
  elseif state == 2 then
   psvmanager_rename_app()
      
  --删除游戏
  elseif state == 3 then
   local state = show_sample_dialog(TIPS, string.format(PSV_MANAGER_DELETE_GAME_READY, SELECT_COUNTS), BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    delete_psv_apps()
   end
  end
  
 end
  
--------------------○键设置-----------------
 if buttons.circle then
  
  if psvmanagerInfo.list and #psvmanagerInfo.list > 0 and psvmanagerInfo.list[psvmanagerInfo.focus].id then
   local state = show_sample_dialog(TIPS, string.format(PSV_MANAGER_LAUNCH_GAME_READY, psvmanagerInfo.list[psvmanagerInfo.focus].id), BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    if psvmanagerInfo.list[psvmanagerInfo.focus].id then
     game.launch(psvmanagerInfo.list[psvmanagerInfo.focus].id)
    end
   end
  end

 end --○键设置

end




















