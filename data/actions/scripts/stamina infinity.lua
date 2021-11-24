function onUse(cid, item, frompos, item2, topos)
	if getPlayerStorageValue(cid,722361) < os.time() then
		doPlayerSetStorageValue(cid,722361,os.time()+600)
		doPlayerAddStamina(cid, 2520)
		doSendMagicEffect(frompos, 51)
		doCreatureSay(cid,"Stamina FULL!",TALKTYPE_ORANGE_1)
	else
		doPlayerSendCancel(cid,"Você só pode usar a cada 10 minutos!")
	end
	return true
end
