function onUse(cid, item, frompos, item2, topos)
	if item.uid == 61514 then
		if getPlayerStorageValue(cid,722537) == EMPTY_STORAGE then
			doPlayerSetStorageValue(cid,722537,1)
			doPlayerAddItem(cid,12629,10)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found 10 ingot coins.")
		else
			doSendMagicEffect(getThingPos(cid),CONST_ME_POFF)
			doPlayerSendCancel(cid,"It is empty.")
		end
	elseif item.uid == 61515 then
		if getPlayerStorageValue(cid,722538) == EMPTY_STORAGE then
			doPlayerSetStorageValue(cid,722538,1)
			doPlayerAddExp(cid, getExperienceForLevel(getPlayerLevel(cid)+3)-(getPlayerExperience(cid)))
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Você upou 3 leveis.")
		else
			doSendMagicEffect(getThingPos(cid),CONST_ME_POFF)
			doPlayerSendCancel(cid,"It is empty.")
		end
	end
	return true
end 
