function onUse(cid, item, frompos, item2, topos)
	if getCreatureStorage(cid, 722650) == EMPTY_STORAGE then
		doCreatureSetStorage(cid,722650,1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Agora voc� tem acesso � vip 3!")
	else
		doPlayerSendCancel(cid,"Voc� j� completou essa quest!")
	end
	return true
end 
