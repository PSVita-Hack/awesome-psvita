------accountmanager_button_setting_function-----------------------------------


function accountmanager_button_setting()

 buttons.read() --读取按键

 ---------------select键设置-------------------------
 if buttons.select then
 
  ftp_server()
  
 end --select键设置
 
 ------------------↑键设置-------------------------------
 if buttons.up or buttons.analogly < -60 then
	 
  if accountmanagerInfo.list and #accountmanagerInfo.list > 0 then
   if accountmanagerInfo.focus > 1 then
	   accountmanagerInfo.focus -= 1
	  end
	 end
 
 ------------------↓键设置-------------------------------
 elseif buttons.down or buttons.analogly > 60 then
 
  if accountmanagerInfo.list and #accountmanagerInfo.list > 0 then
   if accountmanagerInfo.focus < #accountmanagerInfo.list then
	   accountmanagerInfo.focus += 1
	  end
	 end
   
 end

 -------------------X键设置-----------------------------------
 if buttons.cross then
 
  accountmanagerRun = false

 end
 
 -------------------□键设置-------------------------------
 if buttons.square then
	
	 if accountmanagerInfo.list and #accountmanagerInfo.list > 0 then
	  if accountmanagerInfo.list[accountmanagerInfo.focus].mark then
    accountmanagerInfo.list[accountmanagerInfo.focus].mark = false
    accountmanagerInfo.marksCounts -= 1
   else
    accountmanagerInfo.list[accountmanagerInfo.focus].mark = true
    accountmanagerInfo.marksCounts += 1
   end
  end
  
 end

--------------------△键设置-------------------------------
 if buttons.triangle then
 
  if accountmanagerInfo.list and #accountmanagerInfo.list > 0 then
   accountmanagerMenuDialogInfo.usable = {true, true, true, true, true}
  else
   accountmanagerMenuDialogInfo.usable = {true, true, false, false, true}
  end
  accountmanagerMenuDialogInfo.focus = 1
  local select = show_list_dialog(PLEASE_SELECT, accountmanagerMenuDialogInfo, BUTTON_CANCEL, BUTTON_POSITIVE, accountmanagerMenuDialogPos)
  
  if select == 1 then
   local state = show_sample_dialog(TIPS, ACCOUNT_MANAGER_SAVE_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    save_account()
   end
   
  elseif select == 2 then
   local state = show_sample_dialog(TIPS, ACCOUNT_MANAGER_CLEAR_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    remove_account()
   end
  
  elseif select == 3 then
   local state = show_sample_dialog(TIPS, ACCOUNT_MANAGER_CLEAR_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    restore_account()
   end
   
  elseif select == 4 then
   FOR_DELETE_COUNT = 1
   if accountmanagerInfo.list[accountmanagerInfo.focus].mark then
    FOR_DELETE_COUNT = accountmanagerInfo.marksCounts
   end
   local state = show_sample_dialog(TIPS, string.format(ACCOUNT_MANAGER_DELETE_READY, FOR_DELETE_COUNT), BUTTON_CANCEL, BUTTON_POSITIVE)
   if state == 1 then
    delete_accountSaveData()
   end
  
  elseif select == 5 then
   show_sample_dialog(TIPS, string.format(ACCOUNT_MANAGER_MENU_ABOUT_TXT, pathToAccounts), BUTTON_BACK)

  end

 end
  
--------------------○键设置-----------------
 if buttons.circle then
 
 end --○键设置

end
-------------------------------------------------










