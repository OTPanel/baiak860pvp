function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid,49777) < 1 then               
         	setPlayerStorageValue(cid, 49777, 1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
		doPlayerSendTextMessage(cid,25,"Parabens agora você é um jogador VIP FOUR!") 
	else
		doPlayerSendTextMessage(cid,22,"você ja é um player VIP FOUR.")
	end
	return true
end