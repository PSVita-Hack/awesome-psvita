------imageviewer_button_setting_function-----------------------------------


function imageviewer_button_setting()
 
 buttons.read()

 ---------------select键设置-------------------------
 if buttons.select then
 
  ftp_server()
  
 end --select键设置
 
 -------------------↑键设置-------------------------------
 if buttons.up or buttons.analogly < -60 then
  
  if imageviewerInfo.list and #imageviewerInfo.list > 0 then
	  if TEXTEDITOR_READ_ONLY then
    if imageviewerInfo.top > 1 then
	    imageviewerInfo.top -= 1
    end    
   else
	   if imageviewerInfo.focus > 1 then
	    imageviewerInfo.focus -= 1
    end    
   end
	 end
	  
	end --↑键设置
     
 -------------------↓鍵設置-------------------------------
 if buttons.down or buttons.analogly > 60 then
  
  if imageviewerInfo.list and #imageviewerInfo.list > 0 then
   if TEXTEDITOR_READ_ONLY then
    if imageviewerInfo.top < #imageviewerInfo.list - (imageviewerListShowCount - 1) then
     imageviewerInfo.top += 1
	   end
   else
    if imageviewerInfo.focus < #imageviewerInfo.list then
     imageviewerInfo.focus += 1
	   end
	  end
  end
   
	end --↓键设置

 -------------------←键设置-------------------------------
 if buttons.left or buttons.analoglx < -60 then

  if imageviewerText_x < imageviewerDefaultText_x then
   imageviewerText_x += 10
  end
  
 end --←键设置
     
 -------------------→键设置-------------------------------
 if buttons.right or buttons.analoglx > 60 then

  if imageviewerDefaultText_x	- imageviewerText_x + imageviewerTextDefaultWidth < imageviewerTextWidth then
   imageviewerText_x -= 10
  end
  
	end --→键设置

 -------------------L键设置-------------------------------
 if buttons.l then
  
  --上翻页
	 local tmpTop = imageviewerInfo.top - imageviewerListShowCount
	 if tmpTop < 1 then
	  tmpTop = 1
	 end
	 if imageviewerInfo.top ~= tmpTop then
	  imageviewerInfo.focus = tmpTop + (imageviewerInfo.focus - imageviewerInfo.top)
	  imageviewerInfo.top = tmpTop
	 end
	 
	end --if buttons.l
     
 -------------------R键设置-------------------------------
 if buttons.r then
 
  --下翻页
	 local tmpTop = imageviewerInfo.top + imageviewerListShowCount
	 if tmpTop <= #imageviewerInfo.list then
	  if tmpTop > #imageviewerInfo.list - (imageviewerListShowCount - 1) then
	   tmpTop = #imageviewerInfo.list - (imageviewerListShowCount - 1)
	  end
	  imageviewerInfo.focus = tmpTop + (imageviewerInfo.focus - imageviewerInfo.top)
	  if imageviewerInfo.focus > #imageviewerInfo.list then
	   imageviewerInfo.focus = #imageviewerInfo.list
	  end
	  imageviewerInfo.top = tmpTop
	 end

 end
 
 ----------------X键设置-------------------------
	if buttons.cross then
	 
	 if textHadChange then
	  local state = show_sample_dialog(TIPS, TEXTEDITOR_QUIT_SAVE_READY, BUTTON_BACK, TEXTEDITOR_BUTTON_SAVE, TEXTEDITOR_BUTTON_UNSAVE)
   --保存文本后退出
   if state == 1 then
    imageviewer_save_text()
   --不保存文本退出
   elseif state == 2 then
    show_close_dialog()
    imageviewerRun = false
   end
  else
   imageviewerRun = false
  end

	end --X键设置

-------------------□键设置-------------------------------
 if buttons.square then

  if not TEXTEDITOR_READ_ONLY then
   --删除行
   table.remove(imageviewerInfo.list, imageviewerInfo.focus)  
   textHadChange = true
  end
  
 end

 ------------------△键设置-------------------------
 if buttons.triangle then
  
  if not TEXTEDITOR_READ_ONLY then
   --添加行
   table.insert(imageviewerInfo.list, imageviewerInfo.focus + 1, "")
   textHadChange = true
  end
  
 end --△键设置

 ------------------○键设置-------------------------------
 if buttons.circle then 
 
  
  if not TEXTEDITOR_READ_ONLY then
   --编辑行
   local editStr = imageviewerInfo.list[imageviewerInfo.focus]
   local newStr = osk.init(TEXTEDITOR_PLEASE_INPUT, editStr)
   if newStr and newStr ~= editStr then
    imageviewerInfo.list[imageviewerInfo.focus] = newStr
    textHadChange = true
   end
  end

 end

end













