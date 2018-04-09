------------pluginsmanager_functions-----------------------------------


-------------------全选--------------------------
function plugins_mark_all()
	for i = 1, #pluginsmanagerInfo.list do
  pluginsmanagerInfo.list[i].mark = true
 end
 pluginsmanagerInfo.marksCounts = #pluginsmanagerInfo.list
end

-------------------取消全选--------------------------
function plugins_unmark_all()
	for i = 1, #pluginsmanagerInfo.list do
  pluginsmanagerInfo.list[i].mark = false
 end
 pluginsmanagerInfo.marksCounts = 0
end

-------------------安裝插件--------------------------
function install_plugins()
 
 buttons.homepopup(0)
 show_waiting_dialog(WAIT_EXECUTING)
 
 COMPLETE_COUNTS = 0
 FAILED_COUNTS = 0
 local txtExists = false
 local bakTxtList = {false, false, false}

 for j = 1, #pluginsmanagerInfo.list do
  
  if j == pluginsmanagerInfo.focus or (pluginsmanagerInfo.list[pluginsmanagerInfo.focus].mark and pluginsmanagerInfo.list[j].mark) then
   
   local prxMode = pluginsmanagerInfo.list[j].mode
   local prxNames = pluginsmanagerInfo.list[j].names
   local prxModifys = pluginsmanagerInfo.list[j].modifys
   local prxCheckselfs = pluginsmanagerInfo.list[j].checkselfs
   local prxTxts = pluginsmanagerInfo.list[j].txts
   local prxLocations = pluginsmanagerInfo.list[j].locations
   local prxSrc = pluginsmanagerInfo.list[j].srcdir
   local prxDsts = pluginsmanagerInfo.list[j].dstdirs
   local prxStrs = pluginsmanagerInfo.list[j].strs
   --修改config.txt文件--
   for k = 1, #prxNames do
    local prxName = prxNames[k]
    local prxModify = prxModifys[k]
    local prxCheckself = prxCheckselfs[k]
    local prxTxt = prxTxts[k]
    local prxLocation = prxLocations[k]
    local prxSrcFile = pluginsDataRootPath..prxSrc..prxName
    local prxDst = prxDsts[k]
	   	local prxStr = prxStrs[k]
	   	
	   	local hadCopyPrx = false

    local diskList = {
     "ux0:",
     "uma0:",
     "imc0:",
     "ur0:",
    }
	   		   	
    --循环修改ux0、imc0、uma0、ur0的txt文件
    for i = 1, #diskList do
     local pathToDisk = diskList[i]
     if prxModify and not (prxMode == 2 and i ~= 1) then
      local pathToTxt = pathToDisk..prxTxt
      local checkCon = check_file(pathToTxt)
      if checkCon ~= 1 then
       if (prxMode == 1 and i == 3) or (prxMode == 2 and i == 1) or prxMode == 3 then
        files.delete(pathToTxt)
        if create_file(pathToTxt) then
         checkCon = 1
        end
       end --if (prxMode == 1 and i == 3) or
      end --if checkCon ~= 1
      if checkCon == 1 then
       txtExists = true
       --备份config.txt
       if not bakTxtList[i] then
        file_copy_to_file(pathToTxt, pathToTxt..".bak")
        bakTxtList[i] = true
       end
       --读取文本
       local contenido = {}
	      local stopCheckLine = false
	      local getLocation = false
	      local insertLine = nil
	      for linea in io.lines(pathToTxt) do
	       local lineStr = trim(linea)
	       if prxMode == 2 or prxMode == 3 then
	        if string.sub(lineStr, -2, -2) == " " then
	         lineStr = trim(string.sub(lineStr, 1, -2))
	        end
	       end
	       local txtPreName = files.nopath(lineStr)
	       if not prxCheckself or (prxCheckself and txtPreName ~= prxName) then
	        table.insert(contenido, linea)
	        if not stopCheckLine and prxMode == 1 then
	         if getLocation then
	          local firstStr = string.sub(lineStr, 1, 1)
	          if firstStr == "*" then
	           stopCheckLine = true
	          else
	           if txtPreName == "gamesd.skprx" or txtPreName == "usbmc.skprx" or txtPreName == "storagemgr.skprx"  then
	            insertLine = #contenido + 1
	           end
	          end
	         elseif lineStr == prxLocation then
	          insertLine = #contenido + 1
	          getLocation = true
	         end --if getLocation
	        end --if not stopCheckLine
	       end --if txtPreName ~= prxName
	      end --for linea in io.lines(pathToTxt)
	      if prxMode == 1 then
	       if getLocation then
	        table.insert(contenido, insertLine, prxStr)
	       else
	        table.insert(contenido, prxLocation)
	        table.insert(contenido, prxStr)
	       end
	      elseif prxMode == 2 or prxMode == 3 then
	       table.insert(contenido, prxStr)
	      end --if prxMode == 1
       --写入文本
       local taiConfigFile = io.open(pathToTxt, "w+")
       for i = 1, #contenido do
	       taiConfigFile:write(contenido[i].."\n")
	      end
	      taiConfigFile:close()
	     end --if checkCon == 1
	    end --if prxModify == 1
	    	--复制插件
	    if txtExists and prxDst ~= nil then
	     local pathToDst = prxDst
	     if (prxMode == 2 and i == 1) or prxMode == 3 then
	      pathToDst = pathToDisk..prxDst
	      files.copy(prxSrcFile, pathToDst)
	     elseif not hadCopyPrx and prxMode == 1 then
	      files.copy(prxSrcFile, pathToDst)
	      hadCopyPrx = true
	     end
	    end --if txtExists and prxDst ~= nil
	   end --for i = 1, #diskList
   end --for k = 1, #prxNames do
   if txtExists then
    COMPLETE_COUNTS += 1
   else
    FAILED_COUNTS += 1
   end
	 end --if j == pluginsmanagerInfo.focus
	end --for j = 1, #pluginsmanagerInfo.list
	--取消选中
 plugins_unmark_all()
 
 buttons.homepopup(1)
 local state = show_sample_dialog(TIPS, string.format(PLUGINS_MANAGER_INSTALL_PLUGINS_COMPLETE, COMPLETE_COUNTS, FAILED_COUNTS), BUTTON_CANCEL, BUTTON_POSITIVE)
 if state == 1 then
  show_waiting_dialog(WAIT_EXECUTING)
  power.restart()
 end

end

-------------------卸载插件--------------------------
function uninstall_plugins()

 buttons.homepopup(0)
 show_waiting_dialog(WAIT_EXECUTING)
 
 COMPLETE_COUNTS = 0
 local bakTxtList = {false, false, false}

 for j = 1, #pluginsmanagerInfo.list do
  
  if j == pluginsmanagerInfo.focus or (pluginsmanagerInfo.list[pluginsmanagerInfo.focus].mark and pluginsmanagerInfo.list[j].mark) then
  
   local prxMode = pluginsmanagerInfo.list[j].mode
   local prxNames = pluginsmanagerInfo.list[j].names
   local prxModifys = pluginsmanagerInfo.list[j].modifys
   local prxTxts = pluginsmanagerInfo.list[j].txts
   local prxLocations = pluginsmanagerInfo.list[j].locations
   local prxDsts = pluginsmanagerInfo.list[j].dstdirs
   local prxUninDeletes = pluginsmanagerInfo.list[j].uninDeletes
   --修改config.txt文件--
   for k = 1, #prxNames do
    local prxName = prxNames[k]
	   	local prxModify = prxModifys[k]
	   	local prxTxt = prxTxts[k]
	   	local prxLocation = prxLocations[k]
	   	local prxDst = prxDsts[k]
	   	local prxUninDelete = prxUninDeletes[k]
	   	
	   	local hadDeletePrx = false
	   	
    local diskList = {
     "ux0:",
     "uma0:",
     "imc0:",
     "ur0:",
    }	   		   	
    --循环修改ux0、imc0、uma0、ur0的txt文件
    for i = 1, #diskList do
     local pathToDisk = diskList[i]
     	if prxModify and not (prxMode == 2 and i ~= 1) then
      local pathToTxt = pathToDisk..prxTxt
      local checkCon = check_file(pathToTxt)
      if checkCon == 1 then
       --备份config.txt
       if not bakTxtList[i] then
        file_copy_to_file(pathToTxt, pathToTxt..".bak")
        bakTxtList[i] = true
       end
       --读取文本
       local contenido = {}
       local getDeleteLocation = false
       local deleteLocationInt = nil
       local getCheckDeleteLocation = false
       for linea in io.lines(pathToTxt) do
        local lineStr = trim(linea)
        if prxMode == 2 or prxMode == 3 then
         if string.sub(lineStr, -2, -2) == " " then
          lineStr = trim(string.sub(lineStr, 1, -2))
         end
        end
        local txtPreName = files.nopath(lineStr)
        if txtPreName ~= prxName then
         table.insert(contenido, linea)
         if getDeleteLocation then
          local firstStr = string.sub(lineStr, 1, 1)
          if firstStr == "*" then
           if not getCheckDeleteLocation then
	            table.remove(contenido, deleteLocationInt)
	            getCheckDeleteLocation = true
	           end
	          else
	           if not getCheckDeleteLocation and firstStr and firstStr ~= "" then
	            getCheckDeleteLocation = true
	           end
	          end
	         else
	          if lineStr ~= "*KERNEL" and lineStr ~= "*main" and lineStr == prxLocation then
	           getDeleteLocation = true
	           deleteLocationInt = #contenido
	          end
	         end
	        end --if txtPreName ~= prxName
	       end --for linea in io.lines(pathToTxt)
	       if getDeleteLocation and not getCheckDeleteLocation then
	        table.remove(contenido, deleteLocationInt)
	        getCheckDeleteLocation = true
	       end
        --写入文本
        local taiConfigFile = io.open(pathToTxt, "w+")
        for i = 1, #contenido do
	        taiConfigFile:write(contenido[i].."\n")
	       end
	       taiConfigFile:close()
	      end --if checkCon == 1
	     end --if prxModify == 1
	     --删除插件
	     if prxUninDelete then
	      local pathToDstPrx = prxDst..prxName
	      if (prxMode == 2 and i == 1) or prxMode == 3 then
	       pathToDstPrx = pathToDisk..pathToDstPrx
	       files.delete(pathToDstPrx)
	      elseif not hadDeletePrx and prxMode == 1 then
	       files.delete(pathToDstPrx)
	       hadDeletePrx = true
	      end
	     end --if prxUninDelete
	    end --for i = 1, #diskList
	   end --for k = 1, #prxNames do
   COMPLETE_COUNTS += 1
	 end --if j == pluginsmanagerInfo.focus
	end --for j = 1, #pluginsmanagerInfo.list
	--取消选中
 plugins_unmark_all()
 
 buttons.homepopup(1)
 local state = show_sample_dialog(TIPS, string.format(PLUGINS_MANAGER_UNINSTALL_PLUGINS_COMPLETE, COMPLETE_COUNTS), BUTTON_CANCEL, BUTTON_POSITIVE)
 if state == 1 then
  show_waiting_dialog(WAIT_EXECUTING)
  power.restart()
 end

end

function pluginsmanagerOpenMenu()

 if pluginsmanagerInfo.marksCounts < #pluginsmanagerInfo.list then
  pluginsmanagerMenuDialogInfo.list[1] = PLUGINS_MANAGER_MARKS_ALL
 else
  pluginsmanagerMenuDialogInfo.list[1] = PLUGINS_MANAGER_UNMARKS_ALL
 end
 pluginsmanagerMenuDialogInfo.focus = 1
 local select = show_list_dialog(PLEASE_SELECT, pluginsmanagerMenuDialogInfo, BUTTON_CANCEL, BUTTON_POSITIVE)
 
 if select == 1 then
  if pluginsmanagerInfo.marksCounts < #pluginsmanagerInfo.list then
   plugins_mark_all()
  else
   plugins_unmark_all()
  end
  show_close_dialog()
   
 elseif select == 2 then
  if pluginsmanagerInfo.list[pluginsmanagerInfo.focus].mark then
   mCount = pluginsmanagerInfo.marksCounts
  else
   mCount = 1
  end
  local state = show_sample_dialog(TIPS, string.format(PLUGINS_MANAGER_INSTALL_PLUGINS_READY, mCount), BUTTON_CANCEL, BUTTON_POSITIVE)
  if state == 1 then
   install_plugins()
  end
  
 elseif select == 3 then
  if pluginsmanagerInfo.list[pluginsmanagerInfo.focus].mark then
   mCount = pluginsmanagerInfo.marksCounts
  else
   mCount = 1
  end
  local state = show_sample_dialog(TIPS, string.format(PLUGINS_MANAGER_UNINSTALL_PLUGINS_READY, mCount), BUTTON_CANCEL, BUTTON_POSITIVE)
  if state == 1 then
   uninstall_plugins()
  end
  
 elseif select == 4 then
  local prxSrc = pluginsmanagerInfo.list[pluginsmanagerInfo.focus].srcdir
  local pathToAbout = pluginsDataRootPath..prxSrc..pluginsmanagerInfo.list[pluginsmanagerInfo.focus].about
  local messageList = getFileToStringlist(pathToAbout)
  show_sample_dialog(INTRODUCTION, messageList, BUTTON_BACK)
 
 end

end













