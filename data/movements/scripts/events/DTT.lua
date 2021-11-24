function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return false
	end
	-- Entrada sala de espera
	if (item.aid == 9801) then
		if(getPlayerLevel(cid) >= dtt.min_level) then
			if (dtt.block_mc == true) and (dtt.getPlayersInEvent() ~= false) then
				for _, index in ipairs(dtt.getPlayersInEvent()) do
                if isPlayer(index.pid) then
                    if getPlayerIp(cid) == getPlayerIp(index.pid) then
                        doPlayerSendCancel(cid, "[DEFEND THE TOWER] Ja existe jogador com mesmo IP no evento.") 
                        doTeleportThing(cid, getTownTemplePosition(dtt.townid.init))
                        return false
                    end
                end
				end
			end
			-- INSERINDO JOGADOR  DB 
			db.query("INSERT INTO `dtt_players` VALUES ('', ".. cid ..  ",".. 0 ..", ".. getPlayerIp(cid) ..");")  
			doTeleportThing(cid, dtt.pos.temple_wait)
		else
			doPlayerSendCancel(cid, "[DEFEND THE TOWER] Voce nao possui o level minimo.") 
			return false
		end
	end
	-- Impedir avanço ao templo
	if (item.aid == 9802) and (getPlayerStorageValue(cid, dtt.storage.team_red) ==  1) then
		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true
	end

	if (item.aid == 9803) and (getPlayerStorageValue(cid, dtt.storage.team_blue) ==  1) then
		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true
	end
	-- Saida da sala de espera
	if (item.aid == 9804) then
		db.query("DELETE FROM dtt_players WHERE pid = "..cid..";")  
        doTeleportThing(cid, getTownTemplePosition(dtt.townid.init))
	end

   	return true
end