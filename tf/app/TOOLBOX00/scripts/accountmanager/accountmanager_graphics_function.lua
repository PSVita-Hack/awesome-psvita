----------accountmanager_graphics_function------------------------------------------------------------------------


----------------备份还原帐号界面构画----------------------------------------------------------------------
function accountmanager_graphics()

 if back then back:blit(0,0) end
 --状态栏间隔
 local title_y_interval = 12
 --列表起始y点
 local list_y_first = MAIN_TITLE_HEIGHT + title_y_interval
 local list_y = list_y_first
 --列表显示间隔
 local list_y_interval = accountmanager_list_y_interval
 --列表显示
 if accountmanagerInfo.list and #accountmanagerInfo.list > 0 then
  --列表显示数量
  local listShowCount = accountmanagerListShowCount
	 if accountmanagerInfo.top > accountmanagerInfo.focus then
	  accountmanagerInfo.top = accountmanagerInfo.focus
  end
  if accountmanagerInfo.top < accountmanagerInfo.focus - (listShowCount - 1) then
   accountmanagerInfo.top = accountmanagerInfo.focus - (listShowCount - 1)
  end
  local bottom = #accountmanagerInfo.list
  if bottom > accountmanagerInfo.top + (listShowCount - 1) then
    bottom = accountmanagerInfo.top + (listShowCount - 1)
  end
  for i = accountmanagerInfo.top, bottom do
 	  --字体颜色
 	  local textColor = color.white
   --光标位置
   if i == accountmanagerInfo.focus then
    textColor = COLOR_FOCUS
   end
   --当前账号备份
   if currentId and currentId == accountmanagerInfo.list[i].name then
    screen.print(0, list_y, "☆", 1, color.green, color.black, __ALEFT)
   end
   --列表序号
   screen.print(18, list_y, string.format("%03d", i), 1, textColor, color.black, __ALEFT)
   --帐号名称
   screen.print(74, list_y, accountmanagerInfo.list[i].name or "", 1, textColor, color.black, __ALEFT)
   --标记
   if accountmanagerInfo.list[i].mark then
    draw.fillrect(16, list_y-2, 960-16*2, screen.textheight(1) + 4, COLOR_MARK) 
   end
   list_y += (screen.textheight(1) + list_y_interval)
  end --for i = accountmanagerInfo.top
  --滚动条
	 if #accountmanagerInfo.list > accountmanagerListShowCount then
   local scrollbarBK_x = 960 - accountmanager_scrollbarBK_w - 6
   local scrollbarBK_y = list_y_first
   local scrollbar_x = scrollbarBK_x
   local scrollbar_y = scrollbarBK_y
   if accountmanagerInfo.top > 1 then
    if accountmanagerInfo.focus == #accountmanagerInfo.list then
     scrollbar_y = scrollbarBK_y + accountmanager_scrollbarBK_h - accountmanager_scrollbar_h
    else
     scrollbar_y = scrollbarBK_y + (accountmanager_scrollbarOne_h*(accountmanagerInfo.top - 1))
    end
   end
   --滚动条背景
   draw.fillrect(scrollbarBK_x, scrollbarBK_y, accountmanager_scrollbarBK_w, accountmanager_scrollbarBK_h, COLOR_STATUS_BAR_BACKGROUND) 
   --滚动条
   draw.fillrect(scrollbar_x, scrollbar_y, accountmanager_scrollbar_w, accountmanager_scrollbar_h, COLOR_SCROLL_BAR)     
  end
 else
  screen.print(18, list_y, ACCOUNT_MANAGER_NO_SAVEDATA, 1, color.red, color.black)
 end -- if accountmanagerInfo.list
 --标题状态栏
 titleShow(ACCOUNT_MANAGER)
 --按键栏
 buttonShow(accountmanagerButtonTextList)
 --刷新页面
 screen.flip()

end













