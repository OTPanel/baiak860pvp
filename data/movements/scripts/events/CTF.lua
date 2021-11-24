local conditionRedx = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionRedx, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionRedx, {lookType = 143, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookTypeEx = 0, lookAddons = 3})
local conditionGreen = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionGreen, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionGreen, {lookType = 134, lookHead = 82, lookBody = 82, lookLegs = 82, lookFeet = 82, lookTypeEx = 0, lookAddons = 3})

function onStepIn(cid, item, position, fromPosition)
	if item.aid == 1432 then
		if getPlayerAccess(cid) > 3 or getPlayerLevel(cid) < 200 then
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa ser no mínimo level 200!")
		elseif getGlobalStorageValue(6) >= getGlobalStorageValue(7) then
			setPlayerStorageValue(cid, 72, 1)
			setPlayerStorageValue(cid, 71, 0)
			setGlobalStorageValue(7, getGlobalStorageValue(7)+1)
			doAddCondition(cid, conditionRedx)
			doPlayerSetTown(cid, 12)
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doCreatureSetNoMove(cid, true)
			doPlayerPopupFYI(cid, "-BR-\nVocê entrou! Aguarde o ínicio do evento. Você precisa pegar a bandeira do time adversário e trazer para sua base.\n\n-ENG-\nYou entered! Wait for the event start. You need to take the flag of the opposing team and bring to your base.")
		else
			setPlayerStorageValue(cid, 71, 1)
			setPlayerStorageValue(cid, 72, 0)
			setGlobalStorageValue(6, getGlobalStorageValue(6)+1)
			doAddCondition(cid, conditionGreen)
			doPlayerSetTown(cid, 11)		
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doPlayerPopupFYI(cid, "-BR-\nVocê entrou! Aguarde o ínicio do evento. Você precisa pegar a bandeira do time adversário e trazer para sua base.\n\n-ENG-\nYou entered! Wait for the event start. You need to take the flag of the opposing team and bring to your base.")
			doCreatureSetNoMove(cid, true)
		end
		
		
	elseif item.aid == 1433 then
		if getPlayerStorageValue(cid, 83) >= os.time() then
			setPlayerStorageValue(cid, 83, 0)
			setGlobalStorageValue(12, 0)
			setGlobalStorageValue(8, getGlobalStorageValue(8)+1)
			doItemSetAttribute(doCreateItem(1435, 1, {x = 32303, y = 32609, z = 6}), "uid", 2500)	-- bandeira vermelha		
			if getGlobalStorageValue(8) == 20 then
				setGlobalStorageValue(10, 1)
				doBroadcastMessage("CTF Event encerrado! Time verde foi o vencedor! "..getGlobalStorageValue(8).." X "..getGlobalStorageValue(9)..". Recompensa: 35kk de ExP e 80 Event Coins.")
				for _, cid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(cid, 71) == 1 then
						doPlayerAddExperience(cid, 35000000)
						doPlayerAddItem(cid,6527,80)
					end
					if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
						doPlayerSetTown(cid, 1)
						setPlayerStorageValue(cid, 71, 0)
						setPlayerStorageValue(cid, 72, 0)
						doRemoveCondition(cid, CONDITION_OUTFIT)
						doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					end
					if getPlayerStorageValue(cid, 82) >= os.time() then
					setPlayerStorageValue(cid, 82, 0)
			doItemSetAttribute(doCreateItem(1437, 1, {x = 32249, y = 32609, z = 6, stackpos = 1}), "uid", 2499) -- bandeira verde
			end
				end
				return true
			end
			doSendMagicEffect(getPlayerPosition(cid), 48)
			doAddCondition(cid, conditionGreen)
			doTeleportThing(cid, {x= 32252, y= 32609, z=6}) -- base verde cima lado bandeira
			for _, pid in ipairs(getPlayersOnline()) do
				if getPlayerStorageValue(pid, 71) == 1 or getPlayerStorageValue(pid, 72) == 1 then
					doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "[CTF] O " .. getCreatureName(cid) .. " trouxe a bandeira vermelha pra base verde e ganhou 1 ponto!\n Verdes: "..getGlobalStorageValue(8).." X "..getGlobalStorageValue(9).." Vermelhos.")
				end
			end
		elseif getGlobalStorageValue(11) == 1 or getPlayerStorageValue(cid, 71) == 1 then
			doTeleportThing(cid, fromPosition)
		end
		
		
	elseif item.aid == 1434 then
		if getPlayerStorageValue(cid, 82) >= os.time() then
			setPlayerStorageValue(cid, 82, 0)
			setGlobalStorageValue(11, 0)
			setGlobalStorageValue(9, getGlobalStorageValue(9)+1)
			doItemSetAttribute(doCreateItem(1437, 1, {x = 32249, y = 32609, z = 6, stackpos = 1}), "uid", 2499)	-- bandeira verde			
			if getGlobalStorageValue(9) == 20 then
				setGlobalStorageValue(10, 1)
				doBroadcastMessage("CTF Event encerrado! Time vermelho foi o vencedor! "..getGlobalStorageValue(9).." X "..getGlobalStorageValue(8)..". Recompensa: 35kk de ExP.")
				for _, cid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(cid, 72) == 1 then
						doPlayerAddExperience(cid, 35000000)
						doPlayerAddItem(cid,6527,80)
					end
					if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
						doPlayerSetTown(cid, 1)
						setPlayerStorageValue(cid, 71, 0)
						setPlayerStorageValue(cid, 72, 0)
						doRemoveCondition(cid, CONDITION_OUTFIT)
						doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					end
	if getPlayerStorageValue(cid, 83) >= os.time() then
	setPlayerStorageValue(cid, 83, 0)
	doItemSetAttribute(doCreateItem(1435, 1, {x = 32303, y = 32609, z = 6}), "uid", 2500)	-- bandeira vermelha
	end
				end
				return true
			end
			doSendMagicEffect(getPlayerPosition(cid), 48)
			doAddCondition(cid, conditionRedx)
			doTeleportThing(cid, {x = 32300, y = 32609, z = 6}) -- base red cima lado bandeira
			for _, pid in ipairs(getPlayersOnline()) do
				if getPlayerStorageValue(pid, 71) == 1 or getPlayerStorageValue(pid, 72) == 1 then
					doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "[CTF] O " .. getCreatureName(cid) .. " trouxe a bandeira verde pra base vermelha e ganhou 1 ponto!\n Verdes: "..getGlobalStorageValue(8).." X "..getGlobalStorageValue(9).." Vermelhos.")
				end
			end
		elseif getGlobalStorageValue(12) == 1 or getPlayerStorageValue(cid, 72) == 1 then
			doTeleportThing(cid, fromPosition)
		end
	end
	return true
end