----------ident_graphics_function.lua------------------------------------------------------------------------


----------------构画界面----------------------------------------------------------------------
function ident_graphics()

 if back then back:blit(0,0) end
 --设备信息
 local list_y = MAIN_TITLE_HEIGHT + 20
 --列表显示间隔
 local list_y_interval = 8
 
 for i = 1, #identInfo.titles do
  --信息标题
  screen.print(30, list_y, identInfo.titles[i], 1.1, color.white, color.black, __ALEFT)
  --信息详情
  screen.print(210, list_y, identInfo.messages[i], 1.1, color.white, color.black, __ALEFT)
  list_y += (screen.textheight(1.1) + list_y_interval)
 end
 --标题状态栏
 titleShow(IDENT_INFORMATION)
 --按键栏
 buttonShow(identButtonTextList)
 --刷新页面
 screen.flip()
 
end













