function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid,722706) == -1 then
		doPlayerSetStorageValue(cid,722706,1)
		doPlayerAddItem(cid,2160,100)
		doPlayerSendTextMessage(cid,22,"You have found 1kk!")
	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end
