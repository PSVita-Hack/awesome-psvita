------------ident_functions_function-----------------------------------


--------------获取设备信息列表-------------------------------
function ident_get_ident_list()
 local identDataList = {
  IDENT_INFORMATION_ACCESS_SAFE_MODE,
  tostring(os.language()),
  tostring(os.swversion()),
  tostring(os.nick()),
  tostring(os.login()),
  tostring(os.password()),
  tostring(os.psnregion()),
  tostring(os.idps()),
  tostring(os.psid()),
  tostring(os.account()),
  tostring(os.mac()),
  tostring(os.cpu()),
  tostring(os.busclock()),
  tostring(os.gpuclock()),
  tostring(os.crossbarclock()),
  IDENT_INFORMATION_DEVINFO_NO_INFORMATION,
 }
 if os.access() == 1 then
 	identDataList[1] = IDENT_INFORMATION_ACCESS_UNSAFE_MODE
 end
 local devuxo = os.devinfo("ux0:")
 if devuxo then
  identDataList[16] = string.format(IDENT_INFORMATION_DEVINFO_INFORMATION, files.sizeformat(devuxo.used), files.sizeformat(devuxo.max))
 end

 identInfo = {titles = identTitleList, messages = identDataList}
 
end

function save_ident()

 show_waiting_dialog(WAIT_EXECUTING)
 
 local pathToIdentfile = "ux0:data/ident.txt"
 if not files.exists(pathToIdentfile) then
  if not create_file(pathToIdentfile) then
   show_sample_dialog(TIPS, IDENT_INFORMATION_SAVE_FAILED, BUTTON_BACK)
   return
  end
 end
 local identFile = io.open(pathToIdentfile, "w+")
 for i = 1, #identInfo.titles do
	 identFile:write(identInfo.titles[i].." "..identInfo.messages[i].."\n")
 end
 identFile:close()
 
 show_sample_dialog(TIPS, IDENT_INFORMATION_SAVE_COMPLETE, BUTTON_BACK)
 
end










