function onDeath(cid, corpse, killer)
    if isMonster(killer[1]) and isPlayer(cid) and getCreatureName(killer[1]) == 'Gonka' then
        doRemoveCreature(killer[1])
    end
    return true
end

local function teleportHim(cid)
	if isPlayer(cid) then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end
end

function onKill(cid, target)
	if isPlayer(cid) and isMonster(target) then
		if getCreatureName(target) == "Gonka" then
			doBroadcastMessage("{Outfit Supremo}"..getPlayerSex(cid) == 0 and "A jogadora " or "O jogador "..""..getCreatureName(cid).." matou o terrível Gonka e recebeu o outfit supremo!",21)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"{Outfit Supremo} Você conseguiu matar o Gonka e ganhou o outfit supremo!")
			doPlayerSetStorageValue(cid, 121219, 1)
			addEvent(teleportHim, 30000, cid)
			setGlobalStorageValue(15421,os.time()+30)
		end
	end
	return true
end
			

function onLogin(cid)
    registerCreatureEvent(cid, "GonkaKill")
    registerCreatureEvent(cid, "GonkaKill2")
    registerCreatureEvent(cid, "GonkaKillOutfit")
    return true
end

function onOutfit(cid, old, current)
    if current.lookType == 306 and getCreatureStorage(cid, 121219) == -1 then
    	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Somente merecedores podem usar o outfit supremo.")
		doCreatureChangeOutfit(cid, old)
    	return false
    end
    return true
end
