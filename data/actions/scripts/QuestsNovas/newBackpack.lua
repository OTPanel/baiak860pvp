local reward = {
	
	[1] = 6511,
	[2] = 6511,
	[3] = 6510,
	[4] = 6510,
	[5] = 6511,
	[6] = 6511,
	[7] = 6510,
	[8] = 6510

}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid,722534) == EMPTY_STORAGE then

		local receive = reward[getPlayerVocation(cid)]
		doPlayerSetStorageValue(cid,722534,1)
		doPlayerAddItem(cid,receive,1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a "..getItemNameById(receive))

	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end
