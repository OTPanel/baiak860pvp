function onUse(cid, item, frompos, item2, topos)
	message = getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]: " .. "The Boss Striker em frente ao templo, GOGOGO GALERA!"
	timePass = 3 * 60 * 60
	pos1 = {x=153,y=58,z=7}
	pos2 = {x=146,y=60,z=7}

	if getGlobalStorageValue(57349) - os.time() <= 0 then
		doBroadcastMessage(message, MESSAGE_EVENT_ADVANCE)
		setPlayerGlobalValue(57349, os.time() + timePass)
		doSummonCreature("The BOSS STRIKER", pos1)
   		doSummonCreature("The BOSS STRIKER", pos2) 
	else
		doPlayerSendTextMessage(cid,22,"Você ja fez uma invasão a menos de 3 horas!")
	end
end