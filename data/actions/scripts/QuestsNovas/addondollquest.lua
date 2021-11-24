function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50036 then
		if getPlayerStorageValue(cid,50036) == -1 then
			doPlayerSendTextMessage(cid,25,"Você ganhou um Addon Doll.")
                  doPlayerAddItem(cid,9693,1)
			setPlayerStorageValue(cid,50036,1)
		else
			doPlayerSendTextMessage(cid,25,"Você já fez esta quest.")
		end
	
	end
	return TRUE
end