local cfg = {
	
	[39300] = 11114,
	[39301] = 5462,
	[39302] = 2644

}

function onUse(cid, item, frompos, item2, topos)
	if cfg[item.uid] then
		if getCreatureStorage(cid, 722701) == EMPTY_STORAGE then
			doCreatureSetStorage(cid, 722701, 1)
			doPlayerAddItem(cid, cfg[item.uid], 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ganhou um ".. getItemNameById(cfg[item.uid]) .."!")
		else
			doPlayerSendCancel(cid, "It is empty.")
		end
	end
	return true
end 
