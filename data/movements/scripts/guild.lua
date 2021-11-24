local eventArea = {from = {x=1670, y=69, z=6}, to = {x=1805, y=155, z=7}} -- area do evento...
local eventArea2 = {from = {x=1705, y=91, z=7}, to = {x=1805, y=155, z=7}} -- area do evento...
function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then return true end
	for _, pid in pairs(getPlayersOnline()) do
		if not isPlayer(cid) then return true end
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) then
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] Não é permitido entrar com 2 chars no mesmo IP!")
			return true
		end
	end
		if not isPlayer(cid) then return true end
	for _, pid in pairs(getPlayersOnline()) do
		if not isPlayer(cid) then return true end
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea2.from, eventArea2.to)) then
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] Não é permitido entrar com 2 chars no mesmo IP!")
			return true
		end
	end
	
	if getPlayerLevel(cid) < 150 then
		doTeleportThing(cid,fromPosition)
		doPlayerSendCancel(cid,"Somente level 150+")
		return true
	end
	if getPlayerGuildId(cid) > 0 then
		doPlayerSendTextMessage(cid, 27, "Voce entrou, sua guild é a "..getPlayerGuildName(cid)..".")
		if getPlayerStorageValue(cid,722361) < os.time() then
			doPlayerSetStorageValue(cid,722361,os.time() + 20)
			doBroadcastMessage("[BaiakCastle] O jogador "..getCreatureName(cid).." da guild "..getPlayerGuildName(cid).." está invadindo o castelo! Aviso aos donos atuais.",MESSAGE_STATUS_CONSOLE_ORANGE)
		end
		return true 
	else
		doPlayerSendTextMessage(cid, 27, "Voce não possue guild, portanto não pode entrar no Castle24Horas.")
		doTeleportThing(cid, fromPosition)
		return false
	end
end
