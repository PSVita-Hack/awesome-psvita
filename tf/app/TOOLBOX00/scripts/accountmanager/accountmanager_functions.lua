----------accountmanager_function------------------------------------------------------------------------

----------获取备份列表----------------------------------------------------------
function getAccountList()

 accountmanagerInfo.list = {}
 local tmpList = files.listdirs(pathToAccounts)
 if tmpList then
  table.sort(tmpList,function(a,b) return string.lower(a.name) < string.lower(b.name) end)
  for i = 1, #tmpList do
   if files.exists(tmpList[i].path.."/system.dreg") and files.exists(tmpList[i].path.."/system.ireg") then
    tmpList[i].mark = false
    table.insert(accountmanagerInfo.list, tmpList[i])
   end
  end
  accountmanagerInfo.marksCounts = 0
 end

	if #accountmanagerInfo.list > accountmanagerListShowCount then
  accountmanager_scrollbarOne_h = accountmanager_scrollbarBK_h/#accountmanagerInfo.list
  accountmanager_scrollbar_h = accountmanager_scrollbarOne_h*accountmanagerListShowCount
 end
 
end

----------备份当前帐号----------------------------------------------------------
function save_account()

 buttons.homepopup(0)
 show_waiting_dialog(WAIT_EXECUTING)
 
 --获取登录id
 local id = os.login()
 if id == nil or id == "" then 
  buttons.homepopup(1)
  show_sample_dialog(TIPS, ACCOUNT_MANAGER_NO_LOGIN, BUTTON_BACK)
  return
 end
 local pathToActSave = pathToAccounts..id
 files.mkdir(pathToActSave)
 --检测备份路径
 local checkpathToAccounts = check_file(pathToActSave)
 if checkpathToAccounts ~= 2 then
  buttons.homepopup(1)
  show_sample_dialog(TIPS, ACCOUNT_MANAGER_SAVE_FAILED, BUTTON_BACK)
  return
 end
 os.saveaccount(pathToActSave)
 files.copy(pathToMISC, pathToActSave)
 getAccountList() --刷新列表
 for i = 1, #accountmanagerInfo.list do
  if accountmanagerInfo.list[i].name == id then
   accountmanagerInfo.focus = i
   accountmanagerInfo.list[i].mark = true
   accountmanagerInfo.marksCounts += 1
   break
  end
 end
 
 buttons.homepopup(1)
 show_sample_dialog(TIPS, ACCOUNT_MANAGER_SAVE_COMPLETE, BUTTON_BACK)
 
end   

----------清除当前帐号----------------------------------------------------------
function remove_account()

 buttons.homepopup(0)
 show_waiting_dialog(WAIT_EXECUTING)
 
 files.delete("ur0:user/00/trophy/data/sce_trop/TRPUSER.DAT")
 files.delete("ur0:user/00/trophy/data/sce_trop/sce_pfs/files.db")
 files.delete("ux0:id.dat")
 files.delete("uma0:id.dat")
 files.delete(pathToMISC)
 os.removeaccount()
 currentId = os.login()
 
 buttons.homepopup(1)
 local state = show_sample_dialog(TIPS, ACCOUNT_MANAGER_CLEAR_COMPLETE, BUTTON_CANCEL, BUTTON_POSITIVE)
 if state == 1 then
  power.restart()
 end
 
end

----------还原备份帐号----------------------------------------------------------
function restore_account()

 buttons.homepopup(0)
 show_waiting_dialog(WAIT_EXECUTING)
 
 files.delete("ur0:user/00/trophy/data/sce_trop/TRPUSER.DAT")
 files.delete("ur0:user/00/trophy/data/sce_trop/sce_pfs/files.db")
 files.delete("ux0:id.dat")
 files.delete("uma0:id.dat")
 
 local pathToActSave = accountmanagerInfo.list[accountmanagerInfo.focus].path
 os.restoreaccount(pathToActSave)
 local pathToMyprofileBak = pathToActSave.."/myprofile.dat"
 if files.exists(pathToMyprofileBak) then
  files.copy(pathToMyprofileBak, "ur0:user/00/np/")
 else
  files.delete(pathToMISC)
 end
 currentId = os.login()

 buttons.homepopup(1)
 local state = show_sample_dialog(TIPS, string.format(ACCOUNT_MANAGER_BACKUP_COMPLETE, accountmanagerInfo.list[accountmanagerInfo.focus].name), BUTTON_CANCEL, BUTTON_POSITIVE)
 if state == 1 then
  power.restart()
 end

end   

----------删除备份帐号----------------------------------------------------------
function delete_accountSaveData()

 buttons.homepopup(0)
 show_waiting_dialog(WAIT_EXECUTING)
 
 HAVE_DELETED_COUNT = 0
 local tmpPos = accountmanagerInfo.focus
 local tmpTop = accountmanagerInfo.top
 for i = 1, #accountmanagerInfo.list do
  if i == accountmanagerInfo.focus or (accountmanagerInfo.list[accountmanagerInfo.focus].mark and accountmanagerInfo.list[i].mark) then
   files.delete(accountmanagerInfo.list[i].path)
   if not files.exists(accountmanagerInfo.list[i].path) then
    HAVE_DELETED_COUNT += 1
    if accountmanagerInfo.focus > i then
     tmpPos -= 1
    end
    if accountmanagerInfo.top > i then
     tmpTop -= 1
    end
   end --if not files.exists
  end --if i == focus
 end --for i = 1, #accountmanagerInfo.list

 if HAVE_DELETED_COUNT > 0 then
  getAccountList()
  accountmanagerInfo.focus = tmpPos
  accountmanagerInfo.top = tmpTop
  if accountmanagerInfo.focus > #accountmanagerInfo.list and #accountmanagerInfo.list > 0 then
   accountmanagerInfo.focus = #accountmanagerInfo.list
  end
 end

 buttons.homepopup(1)
 show_sample_dialog(TIPS, string.format(ACCOUNT_MANAGER_DELETE_COMPLETE, HAVE_DELETED_COUNT), BUTTON_BACK)

end






