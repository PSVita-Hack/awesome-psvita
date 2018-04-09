----------pluginsmanager_graphics_function------------------------------------------------------------------------


----------------常用插件大全界面构画----------------------------------------------------------------------
function pluginsmanager_graphics()

 if back then back:blit(0,0) end
 --状态栏间隔
 local title_y_interval = 12
 --列表起始y点
 local list_y_first = MAIN_TITLE_HEIGHT + title_y_interval
 local list_y = list_y_first
 --列表显示间隔
 local list_y_interval = pluginsmanager_list_y_interval
	if pluginsmanagerInfo.list and #pluginsmanagerInfo.list > 0 then
  --列表显示数量
  local listShowCount = pluginsmanagerListShowCount
  --获取顶部序号
  if pluginsmanagerInfo.top > pluginsmanagerInfo.focus then
   pluginsmanagerInfo.top = pluginsmanagerInfo.focus
	 elseif pluginsmanagerInfo.top < pluginsmanagerInfo.focus - (listShowCount-1) then
   pluginsmanagerInfo.top = pluginsmanagerInfo.focus - (listShowCount-1)
  end
  --获取底部序号
 	local bottom = #pluginsmanagerInfo.list
 	if bottom > pluginsmanagerInfo.top + (listShowCount-1) then
 	 bottom = pluginsmanagerInfo.top + (listShowCount-1)
 	end
 	for i = pluginsmanagerInfo.top, bottom do
 	  	 --字体颜色
 	 local textColor = color.white
 	 if i == pluginsmanagerInfo.focus then
 	  textColor = COLOR_FOCUS
 	 end
 	 --列表序号
 	 screen.print(18, list_y, string.format("%03d", i), 1, textColor, color.black, __ALEFT)
 	 --列表名称
 	 screen.print(78,list_y, pluginsmanagerInfo.list[i].title, 1, textColor, color.black, __ALEFT)
	 	--标记
	 	if pluginsmanagerInfo.list[i].mark then
	 	 draw.fillrect(16, list_y-2, 960-16*2, screen.textheight(1) + 4, COLOR_MARK) 
	  end
	  list_y += (screen.textheight(1) + list_y_interval)
		end
  --滚动条
	 if #pluginsmanagerInfo.list > pluginsmanagerListShowCount then
   local scrollbarBK_x = 960 - pluginsmanager_scrollbarBK_w - 6
   local scrollbarBK_y = list_y_first
   local scrollbar_x = scrollbarBK_x
   local scrollbar_y = scrollbarBK_y
   if pluginsmanagerInfo.top > 1 then
    if pluginsmanagerInfo.focus == #pluginsmanagerInfo.list then
     scrollbar_y = scrollbarBK_y + pluginsmanager_scrollbarBK_h - pluginsmanager_scrollbar_h
    else
     scrollbar_y = scrollbarBK_y + (pluginsmanager_scrollbarOne_h*(pluginsmanagerInfo.top - 1))
    end
   end
   --滚动条背景
   draw.fillrect(scrollbarBK_x, scrollbarBK_y, pluginsmanager_scrollbarBK_w, pluginsmanager_scrollbarBK_h, COLOR_STATUS_BAR_BACKGROUND) 
   --滚动条
   draw.fillrect(scrollbar_x, scrollbar_y, pluginsmanager_scrollbar_w, pluginsmanager_scrollbar_h, COLOR_SCROLL_BAR)     
  end
	end
 --标题状态栏
 titleShow(PLUGINS_MANAGER)
 --按键栏
 buttonShow(pluginsmanagerButtonTextList)
 --刷新页面
 screen.flip()

end













