local conditionRedx = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionRedx, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionRedx, {lookType = 143, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookTypeEx = 0, lookAddons = 3})
local conditionGreen = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionGreen, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionGreen, {lookType = 134, lookHead = 82, lookBody = 82, lookLegs = 82, lookFeet = 82, lookTypeEx = 0, lookAddons = 3})
local conditionRedf = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionRedf, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionRedf, {lookType = 335, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookTypeEx = 0, lookAddons = 3})
local conditionGreenf = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionGreenf, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionGreenf, {lookType = 335, lookHead = 82, lookBody = 82, lookLegs = 82, lookFeet = 82, lookTypeEx = 0, lookAddons = 3})

function onUse(cid, item, frompos, item2, topos)
	if item.uid == 2499 and getPlayerStorageValue(cid, 72) == 1 then
		setPlayerStorageValue(cid, 82, os.time()+120)
		addEvent(flag, 2000, cid)
		doRemoveItem(getTileItemById({x = 32249, y = 32609, z = 6}, 1437).uid, 1) -- bandeira verde
		addEvent(voltabandeira, 120000, cid)
		setGlobalStorageValue(11, 1)	
		doAddCondition(cid, conditionRedf)		
		doTeleportThing(cid, {x = 32252, y = 32609, z = 6}) -- base verde em cima lado bandeira
		for _, pid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(pid, 71) == 1 or getPlayerStorageValue(pid, 72) == 1 then
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "[CTF] O " .. getCreatureName(cid) .. " roubou a bandeira do time verde!")
			end
		end
		
	elseif item.uid == 2500 and getPlayerStorageValue(cid, 71) == 1  then
		setPlayerStorageValue(cid, 83, os.time()+120)
		addEvent(flag, 2000, cid)
		setGlobalStorageValue(12, 1)	
		doRemoveItem(getTileItemById({x = 32303, y = 32609, z = 6}, 1435).uid, 1) -- bandeira vermelha 
		addEvent(voltabandeira, 120000, cid)
		doAddCondition(cid, conditionGreenf)	
		doTeleportThing(cid, {x = 32300, y = 32609, z = 6}) -- base vermelha cima lado bandeira
		for _, pid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(pid, 71) == 1 or getPlayerStorageValue(pid, 72) == 1 then
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "[CTF] O " .. getCreatureName(cid) .. " roubou a bandeira do time vermelho!")
			end
		end
	end
	return true
end


function flag (cid)
	if getPlayerStorageValue(cid, 82) >= os.time() or getPlayerStorageValue(cid, 83) >= os.time() then
		doSendAnimatedText(getThingPos(cid), 'FLAG!', COLOR_DARKYELLOW)
		addEvent(flag, 3000, cid)
	end
	return true
end

function voltabandeira (cid)
	if getPlayerStorageValue(cid, 72) == 1 and getPlayerStorageValue(cid, 82) == os.time() then
		setPlayerStorageValue(cid, 82, 0)	
		doAddCondition(cid, conditionRedx)
		setGlobalStorageValue(11, 0)
		doItemSetAttribute(doCreateItem(1437, 1, {x = 32249, y = 32609, z = 6, stackpos = 1}), "uid", 2499)	-- bandeira verde
		for _, pid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(pid, 71) == 1 or getPlayerStorageValue(pid, 72) == 1 then
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "[CTF] O " .. getCreatureName(cid) .. " ficou muito tempo com a bandeira verde e ela foi devolvida para sua base.")
			end
		end
	elseif getPlayerStorageValue(cid, 71) == 1 and getPlayerStorageValue(cid, 83) == os.time() then	
		doItemSetAttribute(doCreateItem(1435, 1, {x = 32303, y = 32609, z = 6, stackpos = 1}), "uid", 2500) -- bandeira vermelha
		setPlayerStorageValue(cid, 83, 0)
		setGlobalStorageValue(12, 0)
		doAddCondition(cid, conditionGreen)
		for _, pid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(pid, 71) == 1 or getPlayerStorageValue(pid, 72) == 1 then
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "[CTF] O " .. getCreatureName(cid) .. " ficou muito tempo com a bandeira vermelha e ela foi devolvida para sua base.")
			end
		end
	end
return true
end