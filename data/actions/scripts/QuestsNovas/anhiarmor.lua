function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 32800 then
   		queststatus = getPlayerStorageValue(cid,1478)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a demon armor.")
   			doPlayerAddItem(cid,2494,1)
   			setPlayerStorageValue(cid,1478,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")   		
   		end
	else
		return 0
   	end

   	return 1
end

	