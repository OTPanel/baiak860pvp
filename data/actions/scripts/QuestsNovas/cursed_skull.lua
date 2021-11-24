function onUse(cid, item, frompos, item2, topos)
	local sto = 722424
	if getPlayerStorageValue(cid,sto) == -1 then
		doPlayerSetStorageValue(cid,sto,1)
		local bp = doCreateItemEx(5926)
		doAddContainerItem(bp,11073,1)
		doPlayerAddItemEx(cid,bp)
		doPlayerSendTextMessage(cid,25,"Você ganhou uma Cursed Skull.")
	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end 