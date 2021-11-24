function onUse(cid, item, itemEx, toPosition, fromPosition)
	if getPlayerStorageValue(cid, 19077) <= 0 then
		setPlayerStorageValue(cid, 19077, 1)
		doPlayerSendTextMessage(cid, 22, "Parabéns! Você ganhou o Wayfarer outfit.")
		doSendMagicEffect(getPlayerPosition(cid), 30)
		if getPlayerSex(cid) == 0 then
			doPlayerAddOutfit(cid, 366, 1)
			doPlayerAddOutfit(cid, 366, 2)
			doRemoveItem(item.uid,1)
		else
			doPlayerAddOutfit(cid, 367, 1)
			doPlayerAddOutfit(cid, 367, 2)
			doRemoveItem(item.uid,1)
		end
	else
		doPlayerSendCancel(cid, "Você já tem esse outfit.")
	end
return true
end