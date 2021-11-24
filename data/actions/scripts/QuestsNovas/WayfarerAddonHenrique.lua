function onUse(cid, item, frompos, item2, topos)
 if item.uid == 61530 then
 queststatus = getPlayerStorageValue(cid,61530)
      if queststatus == -1 then
          doPlayerSendTextMessage(cid,22,"Você ganhou o addon Wayfarer.")
          doPlayerAddOutfit(cid, 366, 3)
            setPlayerStorageValue(cid,61530,1)
		else
            doPlayerSendCancel(cid, "Você já completou essa quest.")
       end
	 end
	 return true
 end

