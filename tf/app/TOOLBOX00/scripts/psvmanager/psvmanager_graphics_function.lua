----------psvmanager_graphics_function------------------------------------------------------------------------


local oldPsvmanagerInfoPos = 1
--状态栏间隔
local psvmanager_title_y_interval = 12
local psvmanagerAppList_x_interval = 18
--列表起始y点
local psvmanager_list_y_first = MAIN_TITLE_HEIGHT + psvmanager_title_y_interval
--图标位置
local psvmanager_icon_x_interval = 30
local psvmanager_icon_y_interval = 20
local psvmanager_icon_w = 160
local psvmanager_icon_x = 960-(psvmanager_icon_w+psvmanager_icon_x_interval)
local psvmanager_icon_y = psvmanager_list_y_first + screen.textheight(1) + psvmanager_icon_x_interval
--游戏名称位置
local psvmanagerAppName_x = 282
local psvmanagerAppName_x_sleft = psvmanagerAppName_x
local showPsvAppNameWidth = 454
--标记
local psvmanagerMark_x = psvmanagerAppList_x_interval-2
local psvmanagerMarkWidth = 960-psvmanagerMark_x-(psvmanager_icon_w+psvmanager_icon_x_interval*2)+2

----------------psv管理器界面构画----------------------------------------------------------------------
function psvmanager_graphics()

 if back then back:blit(0,0) end
 local list_y = psvmanager_list_y_first
 --列表显示间隔
 local list_y_interval = psvmanager_list_y_interval
 if psvmanagerInfo.list and #psvmanagerInfo.list > 0 then
  --游戏总数
  screen.print(960-psvmanager_icon_x_interval, psvmanager_list_y_first, string.format(PSV_MANAGER_GAME_AMOUNT, #psvmanagerInfo.list), 1, color.white, color.black, __ARIGHT)
	 --游戏图标
	 local icon = psvmanagerInfo.list[psvmanagerInfo.focus].icon
	 if icon then
	  image.blit(icon, psvmanager_icon_x, psvmanager_icon_y)
	 end
  --列表显示数量
  local listShowCount = psvmanagerListShowCount
  --获取顶部序号
  if psvmanagerInfo.top > psvmanagerInfo.focus then
   psvmanagerInfo.top = psvmanagerInfo.focus
  elseif psvmanagerInfo.top < psvmanagerInfo.focus - (listShowCount-1) then
   psvmanagerInfo.top = psvmanagerInfo.focus - (listShowCount-1)
  end
  --获取底部序号
 	local bottom = #psvmanagerInfo.list
 	if bottom > psvmanagerInfo.top + (listShowCount-1) then
 	 bottom = psvmanagerInfo.top + (listShowCount-1)
 	end
 	for i = psvmanagerInfo.top, bottom do
 	 if oldPsvmanagerInfoPos ~= psvmanagerInfo.focus then
 	  oldPsvmanagerInfoPos = psvmanagerInfo.focus
 	  psvmanagerAppName_x_sleft = psvmanagerAppName_x
 	 end
 	 --字体颜色
 	 local textColor = color.white
 	 local devColor = color.green
 	 if psvmanagerInfo.list[i].dev == "uma0" then
	 	 devColor = color.yellow
 	 elseif psvmanagerInfo.list[i].dev == "ur0" then
	 	 devColor = color.blue
 	 end
 	 --光标位置
 	 if i == psvmanagerInfo.focus then
 	  textColor = COLOR_FOCUS
 	  if screen.textwidth(psvmanagerInfo.list[i].title or "") > showPsvAppNameWidth then
 	   psvmanagerAppName_x_sleft = screen.print(psvmanagerAppName_x_sleft, list_y, psvmanagerInfo.list[i].title or "", 1, textColor, color.black, __SLEFT, showPsvAppNameWidth)
 	  else
 	   screen.print(psvmanagerAppName_x, list_y, psvmanagerInfo.list[i].title or "", 1, textColor, color.black, __ALEFT, showPsvAppNameWidth)
 	  end
 	 else
 	  screen.print(psvmanagerAppName_x, list_y, psvmanagerInfo.list[i].title or "", 1, textColor, color.black, __ALEFT, showPsvAppNameWidth)
 	 end
 	 --列表顺序号
 	 screen.print(psvmanagerAppList_x_interval, list_y, string.format("%03d", i), 1, textColor, color.black, __ALEFT)
 	 --游戏ID
 	 screen.print(74, list_y, psvmanagerInfo.list[i].id or "", 1, textColor, color.black, __ALEFT)
 	 --游戏盘符路径
	 	screen.print(244, list_y, psvmanagerInfo.list[i].dev, 1, devColor, color.black, __ACENTER)
 	 	--标记
	 	if psvmanagerInfo.list[i].mark then
	 	 draw.fillrect(psvmanagerMark_x, list_y-2, psvmanagerMarkWidth, screen.textheight(1) + 4, COLOR_MARK) 
	 	end
	 	list_y += (screen.textheight(1) + list_y_interval)
	 end
  --滚动条
	 if #psvmanagerInfo.list > psvmanagerListShowCount then
   local scrollbarBK_x = 960 - psvmanager_scrollbarBK_w - 6
   local scrollbarBK_y = psvmanager_list_y_first
   local scrollbar_x = scrollbarBK_x
   local scrollbar_y = scrollbarBK_y
   if psvmanagerInfo.top > 1 then
    if psvmanagerInfo.focus == #psvmanagerInfo.list then
     scrollbar_y = scrollbarBK_y + psvmanager_scrollbarBK_h - psvmanager_scrollbar_h
    else
     scrollbar_y = scrollbarBK_y + (psvmanager_scrollbarOne_h*(psvmanagerInfo.top - 1))
    end
   end
   --滚动条背景
   draw.fillrect(scrollbarBK_x, scrollbarBK_y, psvmanager_scrollbarBK_w, psvmanager_scrollbarBK_h, COLOR_STATUS_BAR_BACKGROUND) 
   --滚动条
   draw.fillrect(scrollbar_x, scrollbar_y, psvmanager_scrollbar_w, psvmanager_scrollbar_h, COLOR_SCROLL_BAR)     
  end
	else
  screen.print(psvmanagerAppList_x_interval, list_y, PSV_MANAGER_NO_GAME, 1, color.red, color.black)
 end
 --标题状态栏
 titleShow(PSV_MANAGER)
 --按键栏
 buttonShow(psvmanagerButtonTextList)
 --刷新页面
 screen.flip()

end












