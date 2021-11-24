function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 922066) == -1 then
		doPlayerSetStorageValue(cid, 922066, 1)
		doPlayerAddItem(cid,10502,1)
		doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest do Light Ring!! Parabéns guerreiro!")
		doSendMagicEffect(getThingPos(cid), 28)
	else
		doPlayerSendCancel(cid, "Você já pegou o ring!")
	end
	return true
end