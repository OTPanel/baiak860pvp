function onEquip(cid, item, slot)
	if getPlayerStorageValue(cid,_Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid,_Lib_Battle_Info.TeamTwo.storage) >= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não pode usar Stealth Ring aqui!")
		return false
	end
	doTransformItem(item.uid, 2202)
	doDecayItem(item.uid)
	return true
end
