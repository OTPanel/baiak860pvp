function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local eventArea = {from = {x=2141, y=524, z=6}, to = {x=2294, y=612, z=6}} -- area do evento...

    if item.actionid == 61465 then
    	if not isPlayer(cid) then return true end
		for _, pid in pairs(getPlayersOnline()) do
		if not isPlayer(cid) then return true end
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) then
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] Não é permitido entrar com 2 chars no mesmo IP!")
			return true
		end
    end
        if realCastle.isOpen() then
            if getPlayerGuildId(cid) > 0 then
                if getPlayerLevel(cid) >= 180 then
                    doSendMagicEffect(getThingPos(cid),CONST_ME_MAGIC_BLUE)
					setPlayerStorageValue(cid, 730003, 1)
                else
                    doPlayerSendCancel(cid,"Somente jogadores level 180+ podem tentar dominar o castelo.")
                    doTeleportThing(cid,fromPosition)
                    doSendMagicEffect(fromPosition,CONST_ME_POFF)
                end
            else
                doPlayerSendCancel(cid,"Somente jogadores com guild podem tentar dominar o castelo.")
                doTeleportThing(cid,fromPosition)
                doSendMagicEffect(fromPosition,CONST_ME_POFF)
            end
        else
            doPlayerSendCancel(cid,"O castelo não está aberto para invasões.")
            doTeleportThing(cid,fromPosition)
            doSendMagicEffect(fromPosition,CONST_ME_POFF)
        end
	end		
    return true
end