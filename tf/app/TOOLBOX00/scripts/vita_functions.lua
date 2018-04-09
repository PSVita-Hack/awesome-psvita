----------------vita_function.lua------------------------


----------------标题栏界面显示-----------------------
function titleShow(title)

 local title_x_interval = 18
 local title_y_interval = 14
 MAIN_TITLE_HEIGHT = title_y_interval + screen.textwidth(1) + title_y_interval
 --标题背景
 draw.fillrect(0, 0, 960, MAIN_TITLE_HEIGHT, COLOR_STATUS_BAR_BACKGROUND)
 --标题
 local title_x = title_x_interval
 local title_y = title_y_interval
 screen.print(title_x, title_y, title, 1, color.white, color.black, __ALEFT)
 --电量
 local battery_x = 960 - title_x_interval
 local batteryInt = batt.lifepercent()
 local batteryShowStr = string.format(BATTERY_SHOW, batteryInt)
 if batt.charging() then
  screen.print(battery_x, title_y, batteryShowStr, 1, color.yellow, color.black, __ARIGHT) 
 else
  if batteryInt > 20 then
   screen.print(battery_x, title_y, batteryShowStr, 1, color.green, color.black, __ARIGHT)
  else
   screen.print(battery_x, title_y, batteryShowStr, 1, color.red, color.black, __ARIGHT) 
  end
 end
 --时间
 local time_x = battery_x - screen.textwidth(batteryShowStr) - title_x_interval
 local timeShowStr = os.date("%Y/%m/%d   %H:%M")
 screen.print(time_x, title_y, timeShowStr, 1, color.white, color.black, __ARIGHT)
end

----------------按键栏界面显示-----------------------
function buttonShow(buttonTxtList)
 
 local button_x_interval = 18
 local button_y_interval = 14
 MAIN_BUTTON_HEIGHT = button_y_interval + screen.textwidth(1) + button_y_interval
 --按键背景
 local button_x = button_x_interval
 local button_y = 544 - MAIN_BUTTON_HEIGHT + button_y_interval
 draw.fillrect(0, 544 - MAIN_BUTTON_HEIGHT, 960, MAIN_BUTTON_HEIGHT, COLOR_STATUS_BAR_BACKGROUND)
 --按键
 for i = 1, #buttonTxtList do
  screen.print(button_x, button_y, buttonTxtList[i], 1, color.white, color.black, __ALEFT)
  button_x += (screen.textwidth(buttonTxtList[i], 1) + 34)
 end
 --ftp状态界面显示
 local ftp_x = 960 - button_x_interval
 local ftp_y = button_y
 if wlan.isconnected() then
  if ftp.state() then
   screen.print(ftp_x, ftp_y, string.format(FTP_INFORMATION_TIP, tostring(wlan.getip())), 1, color.white, color.black, __ARIGHT)
  else
   screen.print(ftp_x, ftp_y, WLAN_ON, 1, color.green, color.black, __ARIGHT)   
  end
 else
  screen.print(ftp_x, ftp_y, WLAN_OFF, 1, color.red, color.black, __ARIGHT)   
 end
 
end

----------------进入加载界面-----------------------
function mainLoadWaiting(title, buttonTxtList)

 if back then back:blit(0,0) end
 titleShow(title)
 buttonShow(buttonTxtList)
 screen.flip()
 SCREENSHOTS = screen.buffertoimage()
 show_waiting_dialog(WAIT_LOADING)
 
end

----------------ftp服务器-----------------------
function ftp_server()
 
 DIALOGWIDTH = 0

 SHOW_SAMPLE_DIALOG = true
 while SHOW_SAMPLE_DIALOG do
  local ftpButtonL = nil
  local ftpButtonR = nil
  local wlanState = WLAN_OFF
  local ftpState = ""
  if wlan.isconnected() then
   wlanState = WLAN_ON
   if ftp.state() then
    ftpState = string.format(FTP_ON, tostring(wlan.getip()))
   else
    ftpState = FTP_OFF
   end
   ftpButtonL = BUTTON_CANCEL
   ftpButtonR = BUTTON_POSITIVE
  else
   ftpButtonL = BUTTON_BACK
   ftpButtonR = nil
  end
  
  dialogFtpMessage = wlanState.."\n"..ftpState
  local messageInfo = get_sample_dialog_info(dialogFtpMessage)
  
  sample_dialog(FTP_SERVER, messageInfo, ftpButtonL, ftpButtonR)
  musicplayer_autoplaynextmusic()
  buttons.read()
  
  --X键设置
	 if ftpButtonL and buttons.cross then
	  buttons.read()
	  show_close_dialog()
	  return 0
	 --○键设置
	 elseif ftpButtonR and buttons.circle then
	  buttons.read()
	  if wlan.isconnected() then
    if not ftp.state() then
     ftpState = ftp.init()
    else
     ftpState = ftp.term()
    end
    show_close_dialog()
   end
	  return 1
	 end
 end
 
end

---------------重构数据库--------------------------
function rebuilddb()
 files.delete("ur0:shell/db/app.db")
end









