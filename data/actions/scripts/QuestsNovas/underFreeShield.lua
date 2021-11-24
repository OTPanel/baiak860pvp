local cfg = {
	
	[10081] = 2537,
	[10082] = 8906,
	[10083] = 8907

}

function onUse(cid, item, frompos, item2, topos)
	if cfg[item.uid] then
		if getCreatureStorage(cid, 722738) == EMPTY_STORAGE then
			doCreatureSetStorage(cid, 722738, 1)
			doPlayerAddItem(cid, cfg[item.uid], 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ganhou um ".. getItemNameById(cfg[item.uid]) .."!")
		else
			doPlayerSendCancel(cid, "It is empty.")
		end
	end
	return true
end 
