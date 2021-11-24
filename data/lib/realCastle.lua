realCastle = {
	
    open_storage = 100005,
    guild_storage = 100006,
    dateStorages = {100007,100008,100009},
    frompos = {x = 2189, y = 522, z = 6},
    topos = {x = 2282, y = 614, z = 6},
	storages = { -- só modifique os storages se necessário
    accessTime = 100010,
    running = 100013
    }


}


realCastle.open = function()
	setGlobalStorageValue(realCastle.open_storage,1)
	setGlobalStorageValue(realCastle.guild_storage,-1)
   setGlobalStorageValue(realCastle.storages.running, 1)
end

realCastle.close = function()
	setGlobalStorageValue(realCastle.open_storage,-1)
		local tomorrow = getTomorrowsDate()
		local tomorrowString = tomorrow[1].."/"..tomorrow[2].."/"..tomorrow[3]
		for i = 1, 3 do
			setGlobalStorageValue(realCastle.dateStorages[i], tomorrow[i])
		end
	local players = getPlayersInArea(realCastle.frompos, realCastle.topos)
	if players then
		for _, pid in pairs(players) do
			doTeleportThing(pid,getTownTemplePosition(1))
		end
	end
	if getGlobalStorageValue(realCastle.guild_storage) == -1 then
		doBroadcastMessage("[Real Castle] A batalhar terminou e nenhuma guild conseguiu dominar o castelo!")
	else
		doBroadcastMessage("[Real Castle] A batalha terminou e a guild vencedora foi "..getGuildNameByID(getGlobalStorageValue(realCastle.guild_storage)).."! Todos os jogadores dessa guild agora tem 30% a + de experiencia!")
	end
	local func = db.query or db.executeQuery
		func("DELETE FROM real_castle WHERE world_id = '"..getWorldId().."'")
		func("INSERT INTO real_castle (guild_name, guild_id, tomorrow, world_id) VALUES ('"..getGuildNameByID(getGlobalStorageValue(realCastle.guild_storage)).."', '"..getGlobalStorageValue(realCastle.guild_storage).."', '"..tomorrowString.."', '"..getWorldId().."')")
   setGlobalStorageValue(realCastle.storages.running, -1)
	doSaveServer()
end

realCastle.broadcast = function(message)
	local players = getPlayersInArea(realCastle.frompos, realCastle.topos)
	if players then
		for _, pid in pairs(players) do
			doPlayerSendTextMessage(pid,MESSAGE_STATUS_WARNING,message)
		end
	end
end

realCastle.domain = function(cid)
	local guild_id = getPlayerGuildId(cid)
	setGlobalStorageValue(realCastle.guild_storage,guild_id)
	doBroadcastMessage("[Real Castle] O jogador "..getPlayerName(cid).." da guild "..getPlayerGuildName(cid).." dominou o castelo! As outras guilds têm até às 22:00 para conseguir tirar o domínio deles, não desistam!")
end

realCastle.isDominating = function(cid)
	local guild_id = getPlayerGuildId(cid)
	return guild_id == getGlobalStorageValue(realCastle.guild_storage)
end

realCastle.isOpen = function()
	return getGlobalStorageValue(realCastle.open_storage) == 1
end

--- Config by Dwarfer
realCastle.isRunning = function()
    return getGlobalStorageValue(realCastle.storages.running) ~= -1 
end

