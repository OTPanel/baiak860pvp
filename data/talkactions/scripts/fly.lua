function teleportar(posicao, cid)
	doPlayerSetStorageValue(cid, 43500, os.time())
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} Ativado !")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} 3")
	addEvent(doPlayerSendTextMessage, 1000, cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} 2")
	addEvent(doPlayerSendTextMessage, 2000, cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} 1")
	addEvent(function() 
		if not getTilePzInfo(getThingPos(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} Cancelado!") 
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) 
		else 
			doTeleportThing(cid, posicao)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} Teleportado!") 
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT) 
		end 
	end, 3000)
end

function onSay(cid, words, param, channel)
if getPlayerStorageValue(cid, WarConfigs.WarPlayerJoined) == 1 then 
	doPlayerSendCancel(cid, "Você não pode usar esse comando quando estiver no anti entrosa.")
	return true
end
	local param = string.lower(param)
	if isInArea(getThingPos(cid), {x = 658, y = 853, z = 7}, {x = 683, y = 887, z = 7}) then
		return doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "{TELEPORT} Você não pode se teleportar quando estiver no Survival!")
	elseif isInArea(getThingPos(cid), {x = 492, y = 638, z = 6}, {x = 511, y = 668, z = 6}) then
		return doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "{TELEPORT} Você não pode se teleportar quando estiver nos Minigames!")
	elseif isInArea(getThingPos(cid), {x = 260, y = 38, z = 7}, {x = 275, y = 53, z = 7}) then
		return doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "{TELEPORT} Você não pode se teleportar quando estiver nos Eventos!")
	else
		if os.time() - getPlayerStorageValue(cid, 13500) >= 3 then
			if not getTilePzInfo(getThingPos(cid)) then
				return doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"{TELEPORT} Você precisa estar em protection zone para poder se teleportar.")
			else
				if param == "" then
					return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} Locais disponíveis: casa | templo | depot")
				elseif param == "casa" then
					if getHouseByPlayerGUID(getPlayerGUID(cid)) then 
						teleportar(getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(cid))), cid)
					else
						return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} Para se teleportar para sua casa, você necessariamente tem que possuir uma.")
					end
				elseif param == "templo" then
					teleportar(getTownTemplePosition(getPlayerTown(cid)), cid)
				elseif param == "depot" then
					teleportar({x = 110, y = 63, z = 7}, cid)
				else
					return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{TELEPORT} Locais disponíveis: casa | templo | depot ")
				end
			end				
		else
			doPlayerSendCancel(cid, "{TELEPORT} Você possui um teleport em andamento.")
		end
	end
	return true
end		