function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 922066) == -1 then
		doPlayerSetStorageValue(cid, 922066, 1)
		doPlayerAddItem(cid,7697,1)
		doSendMagicEffect(getThingPos(cid), 28)
	else
		doPlayerSendCancel(cid, "Você já pegou!")
	end
	return true
end