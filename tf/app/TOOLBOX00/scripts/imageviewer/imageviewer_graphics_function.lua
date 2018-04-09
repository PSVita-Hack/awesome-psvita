----------imageviewer_graphics_function.lua------------------------------------------------------------------------


----------------构画界面----------------------------------------------------------------------
function imageviewer_graphics()

 --背景
 draw.fillrect(0, 0, 960, 544, COLOR_TEXTEDITOR_BACKGROUND)
 
 --状态栏间隔
 local title_y_interval = 10
 --列表起始y点
 local list_y = MAIN_TITLE_HEIGHT + title_y_interval
 --列表显示间隔
 local list_y_interval = imageviewer_list_y_interval
 if imageviewerInfo.list and #imageviewerInfo.list > 0 then --如果列表大于0
  --列表显示数量
  local listShowCount = imageviewerListShowCount
	 --获得顶部序号
	 if not TEXTEDITOR_READ_ONLY then
	  if imageviewerInfo.top > imageviewerInfo.focus then
	   imageviewerInfo.top = imageviewerInfo.focus
   elseif imageviewerInfo.top < imageviewerInfo.focus - (listShowCount - 1) then
    imageviewerInfo.top = imageviewerInfo.focus - (listShowCount - 1)
   end
  end
  --获得底部序号
  local bottom = #imageviewerInfo.list
  if bottom > imageviewerInfo.top + (listShowCount - 1) then
   bottom = imageviewerInfo.top + (listShowCount - 1)
  end
  for i = imageviewerInfo.top, bottom do
   local tmpTextWidth = screen.textwidth(imageviewerInfo.list[i])
   if tmpTextWidth > imageviewerTextWidth then
    imageviewerTextWidth = tmpTextWidth
   end
   screen.print(imageviewerText_x, list_y, imageviewerInfo.list[i], 1, color.white, color.black, __ALEFT)
   list_y += (screen.textheight(1) + list_y_interval)
  end
  --文本行序数背景
  draw.fillrect(0, MAIN_TITLE_HEIGHT, imageviewerOrdinalWidth, 544 - MAIN_TITLE_HEIGHT - MAIN_BUTTON_HEIGHT, COLOR_TEXTEDITOR_BACKGROUND)
  --文本行序数显示
  list_y = MAIN_TITLE_HEIGHT + title_y_interval
  for i = imageviewerInfo.top, bottom do
   screen.print(imageviewerOrdinal_x, list_y, string.format("%04d", i), 1, 0xFF666666, color.black, __ALEFT)
   --光标显示
   if not TEXTEDITOR_READ_ONLY then
    if i == imageviewerInfo.focus then
	    draw.fillrect(imageviewerOrdinal_x, list_y - 2, 960 - imageviewerOrdinal_x - imageviewerTextRightWidth, screen.textheight(1) + 4, COLOR_MARK) 
    end
   end
   list_y += (screen.textheight(1) + list_y_interval)
  end
  --文本右边覆图背景
  draw.fillrect(960 - imageviewerTextRightWidth, MAIN_TITLE_HEIGHT, imageviewerTextRightWidth, 544 - MAIN_TITLE_HEIGHT - MAIN_BUTTON_HEIGHT, COLOR_TEXTEDITOR_BACKGROUND)
  --滚动条
	 if #imageviewerInfo.list > imageviewerListShowCount then
   local scrollbarBK_x = 960 - imageviewer_scrollbarBK_w - 6
   local scrollbarBK_y = MAIN_TITLE_HEIGHT + title_y_interval
   local scrollbar_x = scrollbarBK_x
   local scrollbar_y = scrollbarBK_y
   if imageviewerInfo.top > 1 then
    if imageviewerInfo.focus == #imageviewerInfo.list then
     scrollbar_y = scrollbarBK_y + imageviewer_scrollbarBK_h - imageviewer_scrollbar_h
    else
     scrollbar_y = scrollbarBK_y + (imageviewer_scrollbarOne_h*(imageviewerInfo.top - 1))
    end
   end
   --滚动条背景
   draw.fillrect(scrollbarBK_x, scrollbarBK_y, imageviewer_scrollbarBK_w, imageviewer_scrollbarBK_h, COLOR_STATUS_BAR_BACKGROUND) 
   --滚动条
   draw.fillrect(scrollbar_x, scrollbar_y, imageviewer_scrollbar_w, imageviewer_scrollbar_h, 0xFF880000)     
  end
 end
 --标题状态栏
 titleShow(EDIT_FILE_NAME)
 --按键栏
 buttonShow(imageviewerButtonTextList)
 --刷新页面
 screen.flip()
 
end













