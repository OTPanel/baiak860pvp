local cfg = {
ITEM = {
[12702] = {level = 8, amount = 1},
},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local items = cfg.ITEM[item.itemid]
	if getPlayerLevel(cid) > items.level then
		doAccountAddPoints(cid, items.amount)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parabéns! Você recebeu ".. items.amount .." Premium Points! ", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getCreaturePosition(cid), 28)
		doRemoveItem(item.uid,1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa de level " .. items.level .." para usar este item.")
	end
		return TRUE
end