function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid,722533) == -1 then
		doPlayerSetStorageValue(cid,722533,1)
		doPlayerAddItem(cid,2157,1)
		doPlayerSendTextMessage(cid,22,"You have found 1kk!")
	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end
