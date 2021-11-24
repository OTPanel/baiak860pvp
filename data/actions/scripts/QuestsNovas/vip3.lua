function onUse(cid, item, frompos, item2, topos)
	if getCreatureStorage(cid, 722650) == EMPTY_STORAGE then
		doCreatureSetStorage(cid,722650,1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Agora você tem acesso à vip 3!")
	else
		doPlayerSendCancel(cid,"Você já completou essa quest!")
	end
	return true
end 
