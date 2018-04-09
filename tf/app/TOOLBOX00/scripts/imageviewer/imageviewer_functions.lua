------------imageviewer_functions_function-----------------------------------


----------------进入加载界面-----------------------
function imageviewerMainLoadWaiting(title, buttonTxtList)
 
 --背景
 draw.fillrect(0, 0, 960, 544, COLOR_TEXTEDITOR_BACKGROUND)
 titleShow(title)
 buttonShow(buttonTxtList)
 screen.flip()
 SCREENSHOTS = screen.buffertoimage()
 show_waiting_dialog(WAIT_LOADING)

end

--------------获取图片列表-------------------------------
function imageviewer_get_text_list()
 
 imageviewerInfo.list = {}
 local lineCount = 0
 for linea in io.lines(EDIT_FILE_PATH) do
	 lineCount += 1
	 table.insert(imageviewerInfo.list, linea)
	 if lineCount > 9999 then
	  local state = show_sample_dialog(TIPS, TEXTEDITOR_FILE_TOO_BIG, nil, BUTTON_POSITIVE)
   if state == 1 then
    show_close_dialog()
    break
   end
	 end
	end --for linea in
	if #imageviewerInfo.list == 0 then
	 table.insert(imageviewerInfo.list, "")
	end

	if #imageviewerInfo.list > imageviewerListShowCount then
  imageviewer_scrollbarOne_h = imageviewer_scrollbarBK_h/#imageviewerInfo.list
  imageviewer_scrollbar_h = imageviewer_scrollbarOne_h*imageviewerListShowCount
 end

end

function imageviewer_save_text()

 show_waiting_dialog(TEXTEDITOR_SAVING)
 --写入文本
 local textFile = io.open(EDIT_FILE_PATH, "w+")
 for i = 1, #imageviewerInfo.list do
	 textFile:write(imageviewerInfo.list[i].."\n")
 end
	textFile:close()
 show_waiting_dialog(TEXTEDITOR_SAVE_COMPLETE)
 os.delay(700)
 show_close_dialog()
 imageviewerRun = false
 
end













