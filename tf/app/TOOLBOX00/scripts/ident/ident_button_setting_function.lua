------ident_button_setting_function-----------------------------------


function ident_button_setting()
 
 buttons.read()

 ---------------select键设置-------------------------
 if buttons.select then
 
  ftp_server()
  
 end --select键设置
 
 ----------------X键设置-------------------------
	if buttons.cross then
	 
	 identRun = false

	end --X键设置

 ---------------△键设置-------------------------
 if buttons.triangle then
 
  local state = show_sample_dialog(TIPS, IDENT_INFORMATION_SAVE_READY, BUTTON_CANCEL, BUTTON_POSITIVE)
  if state == 1 then
   save_ident()
  end

 end --△键设置

end










