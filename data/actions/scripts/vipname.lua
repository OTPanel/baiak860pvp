function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 35400 then
queststatus = getPlayerStorageValue(cid,35400)
if queststatus == -1 or queststatus == 0 then
		doCreatureSay(cid, "Você recebeu seu beneficio por ser vip!", TALKTYPE_ORANGE_1)
         db.executeQuery("UPDATE `players` SET `name` = '[VIP] "..getCreatureName(cid).."' WHERE `id` = "..getPlayerGUID(cid)..";")              
         doPlayerSendTextMessage(cid,25,"Você será kickado em 5 segundos para mudança de nome.")          
         addEvent(doRemoveCreature, 5*1000, cid, true)  
		setPlayerStorageValue(cid, 35400, 1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
	else
		doPlayerSendTextMessage(cid,22,"você ja tem o [VIP] no nome.")
	end
	return true
end
end