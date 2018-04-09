------pluginsmanager_button_setting_function-----------------------------------


function pluginsmanager_button_setting()

 buttons.read() --读取按键
 
 ---------------select键设置-------------------------
 if buttons.select then
 
  ftp_server()
  
 end --select键设置
 
 --------------------↑键设置-------------------------------
 if buttons.up or buttons.analogly < -60 then
	 
	 if pluginsmanagerInfo.focus > 1 then
	  pluginsmanagerInfo.focus -= 1
	 end
   
 end
 
--------------------↓键设置-------------------------------
 if buttons.down or buttons.analogly > 60 then

	 if pluginsmanagerInfo.focus < #pluginsmanagerInfo.list then
	  pluginsmanagerInfo.focus += 1
	 end
   
 end

 -------------------X键设置-----------------------------------
 if buttons.cross then
  
  pluginsmanagerRun = false

 end
 
--------------------□键设置-------------------------------
 if buttons.square  and #pluginsmanagerInfo.list > 0 then
	
	 if pluginsmanagerInfo.list[pluginsmanagerInfo.focus].mark then
   pluginsmanagerInfo.list[pluginsmanagerInfo.focus].mark = false
   pluginsmanagerInfo.marksCounts -= 1
  else
   pluginsmanagerInfo.list[pluginsmanagerInfo.focus].mark = true
   pluginsmanagerInfo.marksCounts += 1
  end
  
 end

--------------------△键设置-------------------------------
 if buttons.triangle then

  pluginsmanagerOpenMenu()
  
 end
  
--------------------○键设置-----------------
 if buttons.circle then
  
  pluginsmanagerOpenMenu()
  
 end --○键设置
 
end
-------------------------------------------------










