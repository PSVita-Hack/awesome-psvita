------------psvmanager_functions.lua-----------------------------------


-------------获取游戏列表----------------------------------------------------------
function get_psvgame_list()
 
 os.cpu(444)
 
 psvmanagerInfo.list = {}

 local tmpGameList = game.list(3)
 if tmpGameList then
  table.sort(tmpGameList, function (a,b) return string.lower(a.id) < string.lower(b.id); end)
  for i = 1, #tmpGameList do
   tmpGameList[i].title = string.gsub(tmpGameList[i].title, "\n", " ")
   if tmpGameList[i].title then
    show_waiting_dialog(tmpGameList[i].title)
   end
   local iconPath = "ur0:/appmeta/"..tmpGameList[i].id.."/icon0.png"
   local tmpIcon = image.load(iconPath)
   if tmpIcon then
    local w = image.getw(tmpIcon)
    local h = image.geth(tmpIcon)
    local new_w = 160
    local new_h = string.format("%d", new_w/w*h)
    image.resize(tmpIcon, new_w, new_h)
    tmpGameList[i].icon = tmpIcon
   end
   table.insert(psvmanagerInfo.list, tmpGameList[i])
	 end
	end

	if #psvmanagerInfo.list > psvmanagerListShowCount then
  psvmanager_scrollbarOne_h = psvmanager_scrollbarBK_h/#psvmanagerInfo.list
  psvmanager_scrollbar_h = psvmanager_scrollbarOne_h*psvmanagerListShowCount
 end
	
	os.cpu(333)
	
end

--------------清除标记-------------------------------
function psvmanager_unmark_all()

 for i = 1, #psvmanagerInfo.list do
  psvmanagerInfo.list[i].mark = false
 end
 psvmanagerInfo.marksCounts = 0
 
end

--------------刷新游戏-------------------------------
function psvmanager_refresh_apps()

 buttons.homepopup(0)
 show_waiting_dialog(WAIT_EXECUTING)
 
 --刷新成功数量
 COMPLETE_COUNTS = 0
 --刷新失败数量
 FAILED_COUNTS = 0
 --刷新成功列表
 local refreshCompleteList = {}
 --要刷新的盘符和app路径
 local refreshDev = "ux0"
 local refreshDevPath = refreshDev..":"
 local pathToRefreshApp = refreshDevPath.."/app"
 --ux0临时目录
 local pathToRefreshTmp = refreshDevPath.."/temp/refresh_app_tmp"
 files.delete(pathToRefreshTmp)
 files.mkdir(pathToRefreshTmp)
 local pathToRefreshBakTmp = pathToRefreshTmp.."/backup"
 files.delete(pathToRefreshBakTmp)
 files.mkdir(pathToRefreshBakTmp)
 --appmeta临时目录
 local pathToAppmeta = "ur0:/appmeta"
 local pathToAppmetaTmp = "ur0:/temp/refresh_appmeta_tmp"
 files.delete(pathToAppmetaTmp)
 files.mkdir(pathToAppmetaTmp)
 --刷新游戏
 local focusMark = psvmanagerInfo.list[psvmanagerInfo.focus].mark
 for i = 1, #psvmanagerInfo.list do
  if i == psvmanagerInfo.focus or (focusMark and psvmanagerInfo.list[i].mark) then
   local refreshFileName = psvmanagerInfo.list[i].id
   local pathToRefreshFile = psvmanagerInfo.list[i].path
   local pathToRefreshFileEboot = pathToRefreshFile.."/eboot.bin"
   local pathToRefreshFileSfo = pathToRefreshFile.."/sce_sys/param.sfo"
   local pathToRefreshFileHead = pathToRefreshFile.."/sce_sys/package/head.bin"

   local refreshBl = false
   local installResult = false
   --如果游戏文件夹合法
   if files.exists(pathToRefreshFileEboot) and files.exists(pathToRefreshFileSfo) and files.exists(pathToRefreshFileHead) then
    --读取sfo
    local gameInfo = game.info(pathToRefreshFileSfo)
    --如果sfo合法
    if gameInfo then
     --获取要安装的游戏ID
     refreshGameId = gameInfo.TITLE_ID
     refreshBl = true
    end
   end
   
   if refreshBl then
   
    INSTALL_GAME_ID = refreshGameId
    --相关目录
    local pathToRefreshApp = refreshDevPath.."/app"
    local pathToRefreshAppGame = pathToRefreshApp.."/"..refreshGameId
    --移动安装包到临时目录
    files.move(pathToRefreshFile, pathToRefreshTmp)
    local pathToRefreshTmpFile = pathToRefreshTmp.."/"..refreshFileName
    files.rename(pathToRefreshTmpFile, refreshGameId)
    local pathToRefreshTmpGame = pathToRefreshTmp.."/"..refreshGameId
    --备份同名游戏文件
    files.move(pathToRefreshAppGame, pathToRefreshBakTmp)
    local pathToRefreshBakTmpAppGame = pathToRefreshBakTmp.."/"..refreshGameId
    --备份appmeta文件
    local pathToAppmetaGame = pathToAppmeta.."/"..refreshFileName
    files.move(pathToAppmetaGame, pathToAppmetaTmp)
    local pathToAppmetaTmpGame = pathToAppmetaTmp.."/"..refreshFileName
    --临时目录下sce_sys和eboot路径
    local pathToRefreshTmpGameSys = pathToRefreshTmpGame.."/sce_sys"
    local pathToRefreshTmpGamePfs = pathToRefreshTmpGame.."/sce_pfs"
    local pathToRefreshTmpGameEboot = pathToRefreshTmpGame.."/eboot.bin"    local pathToRefreshBakTmpGameSysPackage = pathToRefreshTmpGameSys.."/package"
    --刷新游戏
    installResult = game.refresh(pathToRefreshTmpGame)     
    if installResult == 1 then
     COMPLETE_COUNTS += 1
     table.insert(refreshCompleteList, refreshGameId)
    else
     FAILED_COUNTS += 1
     --还原文件
     files.rename(pathToRefreshTmpGame, refreshFileName)
     files.move(pathToRefreshTmpFile, files.nofile(pathToRefreshFile))
     files.move(pathToRefreshBakTmpAppGame, pathToRefreshApp)
     files.move(pathToAppmetaTmpGame, pathToAppmeta)
    end
   else
    FAILED_COUNTS += 1
   end --if refreshBl then
  end --if i == psvmanagerInfo.focus or (focusMark and
 end --for i = 1, #psvmanagerInfo.list

 --删除临时目录
 files.delete(pathToRefreshTmp)
 files.delete(pathToAppmetaTmp)
 
 if COMPLETE_COUNTS > 0 then
  show_waiting_dialog(WAIT_LOADING)
  get_psvgame_list()
  for i = 1, #psvmanagerInfo.list do
   for j = 1, #refreshCompleteList do
    if refreshCompleteList[j] == psvmanagerInfo.list[i].id then
     psvmanagerInfo.focus = i
     psvmanagerInfo.list[i].mark = true
     psvmanagerInfo.marksCounts += 1
     break
    end
   end
  end
 else
  psvmanager_unmark_all()
 end

 buttons.homepopup(1)
 show_sample_dialog(TIPS, string.format(PSV_MANAGER_REFRESH_APPS_COMPLETE, COMPLETE_COUNTS, FAILED_COUNTS), BUTTON_BACK)

end

------------------修改游戏名称---------------------
function psvmanager_rename_app()
 
 show_waiting_dialog(WAIT_EXECUTING)
 
 local installResult = false

 local renameGameId = psvmanagerInfo.list[psvmanagerInfo.focus].id
 local renameDev = psvmanagerInfo.list[psvmanagerInfo.focus].dev
 local renameDevPath = renameDev..":"
 local pathToRenameApp = renameDevPath.."/app"
 local pathToRenameAppGame = pathToRenameApp.."/"..renameGameId
 local pathToRenameAppGameSys = pathToRenameAppGame.."/sce_sys"
 local pathToRenameAppGameSysSfo = pathToRenameAppGameSys.."/param.sfo"
 if not files.exists(pathToRenameAppGameSysSfo) then
  show_sample_dialog(TIPS, PSV_MANAGER_RENAME_APP_NO_SFO, BUTTON_BACK)
  return  
 end
 local oldName = psvmanagerInfo.list[psvmanagerInfo.focus].title
 local newName = osk.init(PSV_MANAGER_RENAME_APP, oldName)
 if newName and newName ~= "" and newName ~= oldName then
  local state = show_sample_dialog(TIPS, string.format(PSV_MANAGER_RENAME_APP_READY, newName), BUTTON_CANCEL, BUTTON_POSITIVE)
  if state == 1 then
   show_waiting_dialog(WAIT_EXECUTING)
   buttons.homepopup(0)
   
   --备份sfo文件
   local pathToRenameTmp = renameDevPath.."/temp/rename_app_tmp"
   files.delete(pathToRenameTmp)
   files.mkdir(pathToRenameTmp)
   files.copy(pathToRenameAppGameSysSfo, pathToRenameTmp)
   local pathToRenameTmpSfo = pathToRenameTmp.."/param.sfo"
   --备份appmeta文件
   local pathToAppmeta = "ur0:/appmeta"
   local pathToAppmetaRefresh = pathToAppmeta.."/"..renameGameId
   local pathToAppmetaTmp = "ur0:/temp/rename_appmeta_tmp"
   files.delete(pathToAppmetaTmp)
   files.mkdir(pathToAppmetaTmp)
   files.move(pathToAppmetaRefresh, pathToAppmetaTmp)
   local pathToAppmetaTmpRefresh = pathToAppmetaTmp.."/"..renameGameId
   --修改sfo文件
   local state1 = game.setsfo(pathToRenameAppGameSysSfo, "STITLE", newName)
   local state2 = game.setsfo(pathToRenameAppGameSysSfo, "TITLE", newName)
   if state1 == 1 and state2 == 1 then
    INSTALL_GAME_ID = renameGameId
    if renameDev == "ux0" then
     installResult = game.refresh(pathToRenameAppGame)
    end
   end --if state1 == 1 and state2 == 1
   --如果安装失败，还原sfo文件
   if installResult ~= 1 then
    --还原文件
    files.move(pathToRenameTmpSfo, pathToRenameAppGameSys)
    files.move(pathToAppmetaTmpRefresh, pathToAppmeta)
   end
   files.delete(pathToRenameTmp)
   files.delete(pathToAppmetaTmp)
   
   buttons.homepopup(1)
   --安装结果反馈
   if installResult == 1 then
    psvmanager_unmark_all()
    psvmanagerInfo.list[psvmanagerInfo.focus].mark = true
    psvmanagerInfo.list[psvmanagerInfo.focus].title = newName
    show_sample_dialog(TIPS, PSV_MANAGER_RENAME_APP_COMPLETE, BUTTON_BACK)
   else
    show_sample_dialog(TIPS, PSV_MANAGER_RENAME_APP_FAILED, BUTTON_BACK)   
   end
   
  end --if state1 == 1
 else
  show_close_dialog()
 end
 
end

---------------删除游戏-------------------------------------
function delete_psv_apps()

 buttons.homepopup(0)
 show_waiting_dialog(WAIT_EXECUTING)

 COMPLETE_COUNTS = 0
 local j = 1
 local focusDeleted = false
 local focusMark = psvmanagerInfo.list[psvmanagerInfo.focus].mark
 
 for i = 1, #psvmanagerInfo.list do
  if (not focusDeleted and j == psvmanagerInfo.focus) or (focusMark and psvmanagerInfo.list[j].mark) then
   if j == psvmanagerInfo.focus then
    focusDeleted = true
   end
   local deleteGameId = psvmanagerInfo.list[j].id
   local deleteDev = psvmanagerInfo.list[j].dev
   local deleteDevPath = deleteDev..":"
   if deleteDev == "ux0" then
    show_waiting_dialog(string.format(PSV_MANAGER_DELETEING_GAME, psvmanagerInfo.list[j].id))
    installResult = game.delete(deleteGameId)
   else
    --创建要删除的游戏的临时目录
    local pathToDeleteTmp = deleteDevPath.."/temp/delete_app_tmp"
    files.delete(pathToDeleteTmp)
    files.mkdir(pathToDeleteTmp)
    --移动要删除的游戏到临时目录
    local pathToDeleteApp = deleteDevPath.."/app"
    local pathToDeleteAppGame = pathToDeleteApp.."/"..deleteGameId
    local pathToDeleteAppGameSys = pathToDeleteAppGame.."/sce_sys"
    local pathToDeleteAppGameSysSfo = pathToDeleteAppGameSys.."/param.sfo"
    files.move(pathToDeleteAppGame, pathToDeleteTmp)
    --要删除的游戏昨时目录相关路径
    local pathToDeleteTmpGame = pathToDeleteTmp.."/"..deleteGameId
    local pathToDeleteTmpGameSysSfo = pathToDeleteTmpGame.."/sce_sys/param.sfo"
    local pathToMineSfo = "sce_sys/param.sfo"
    --ux0相关路径
    local uxDevPath = "ux0:"
    local pathToUxTmp = uxDevPath.."/temp/delete_app_tmp"
    files.delete(pathToUxTmp)
    files.mkdir(pathToUxTmp)
    --移动ux0盘符下同名游戏到临时目录
    local pathToUxApp = uxDevPath.."/app"
    local pathToUxAppGame = pathToUxApp.."/"..deleteGameId
    files.move(pathToUxAppGame, pathToUxTmp)
    local pathToUxTmpGame = pathToUxTmp.."/"..deleteGameId
    --修改游戏目录回ux0
    files.mkdir(pathToDeleteAppGameSys)
    if files.exists(pathToDeleteTmpGameSysSfo) then
     files.copy(pathToDeleteTmpGameSysSfo, pathToDeleteAppGameSys)
    elseif files.exists(pathToMineSfo) then
     files.copy(pathToMineSfo, pathToDeleteAppGameSys)
    end
    local flag = 4
    if deleteDev == "ur0" then
     flag = 2
    end
    show_waiting_dialog(WAIT_EXECUTING)
    installResult = game.move(deleteGameId, flag)
    --如果移动成功，则执行删除游戏
    if installResult then
     show_waiting_dialog(string.format(PSV_MANAGER_DELETEING_GAME, psvmanagerInfo.list[j].id))
     installResult = game.delete(deleteGameId)
    end
    --如果删除失败，还原游戏文件
    if installResult ~= 1 then
     files.move(pathToDeleteTmpGame, pathToDeleteApp)
    end
    --还原ux0盘符下同名游戏
    files.move(pathToUxTmpGame, pathToUxApp)
    --删除临时文件
    files.delete(pathToUxTmp)
    files.delete(pathToDeleteTmp)
   end --if psvmanagerInfo.list[j].dev == "ux0"
   
   if installResult == 1 then
    --列表里删除该条信息
    table.remove(psvmanagerInfo.list, j)
    --删除数量增1
    COMPLETE_COUNTS += 1
    --重定位光标
    if psvmanagerInfo.focus > j then
     psvmanagerInfo.focus -= 1
    end
    if psvmanagerInfo.top > j then
     psvmanagerInfo.top -= 1
    end
    --列表序减1
    j -= 1
   end
  end
  --列表序增1
  j += 1
 end
 if COMPLETE_COUNTS > 0 then
  if #psvmanagerInfo.list == 0 then
   psvmanagerInfo.focus = 1
  elseif psvmanagerInfo.focus > #psvmanagerInfo.list then
   psvmanagerInfo.focus = #psvmanagerInfo.list
  end
 end

 psvmanager_unmark_all()
 
 buttons.homepopup(1)
 show_sample_dialog(TIPS, string.format(PSV_MANAGER_DELETE_GAME_COMPLETE, COMPLETE_COUNTS), BUTTON_BACK)

end





