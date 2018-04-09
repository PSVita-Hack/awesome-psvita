-------------------imageviewer--------------------


---------------第一次进初始化----------------------
if not secondIntoImageviewer then
 -----------------加载脚本------------------- 
 dofile("scripts/imageviewer/imageviewer_functions.lua")
 dofile("scripts/imageviewer/imageviewer_graphics_function.lua")
 dofile("scripts/imageviewer/imageviewer_button_setting_function.lua")
 
 secondIntoImageviewer = true
  
end

----------------continue---------------------------
imageviewerInfo = {
 list = {},
 focus = 1,
 top = 1,
}

imageviewerMainLoadWaiting(EDIT_FILE_NAME, imageviewerButtonTextList)
imageviewer_get_text_list()
show_close_dialog()

--构图布局部分设置
--屏幕左间隔
imageviewerOrdinal_x = 6
--序号背景宽度
imageviewerOrdinalWidth = imageviewerOrdinal_x + screen.textwidth("0000") + imageviewerOrdinal_x
--右覆层宽度
imageviewerTextRightWidth = 18
--文字默认显示位置x轴
imageviewerDefaultText_x = imageviewerOrdinalWidth
--文字显示位置x轴
imageviewerText_x = imageviewerDefaultText_x
--文字默认显示宽度
imageviewerTextDefaultWidth = 960 - imageviewerOrdinalWidth - imageviewerTextRightWidth
--文字显示宽度
imageviewerTextWidth = imageviewerTextDefaultWidth
--文本内容变动
textHadChange = false

-----------------while---------------------
imageviewerRun = true
while imageviewerRun do

 imageviewer_graphics() --构画界面
 imageviewer_button_setting() --设置按键
 musicplayer_autoplaynextmusic() --自动播放音乐

end









