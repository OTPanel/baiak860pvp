local cfg = {
	
	[39303] = 6506,
	[39304] = 6510,
	[39305] = 6511

}

function onUse(cid, item, frompos, item2, topos)
	if cfg[item.uid] then
		if getCreatureStorage(cid, 722840) == EMPTY_STORAGE then
			doCreatureSetStorage(cid, 722840, 1)
			doPlayerAddItem(cid, cfg[item.uid], 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ganhou um ".. getItemNameById(cfg[item.uid]) .."!")
		else
			doPlayerSendCancel(cid, "It is empty.")
		end
	end
	return true
end 
