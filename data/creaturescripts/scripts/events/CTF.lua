local conditionRedx = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionRedx, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionRedx, {lookType = 143, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookTypeEx = 0, lookAddons = 3})
local conditionGreen = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionGreen, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionGreen, {lookType = 134, lookHead = 82, lookBody = 82, lookLegs = 82, lookFeet = 82, lookTypeEx = 0, lookAddons = 3})

function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
	if getPlayerStorageValue(cid, 82) >= os.time() then
		setPlayerStorageValue(cid, 82, 0)	
		doAddCondition(cid, conditionRedx)
		setGlobalStorageValue(11, 0)		
		doItemSetAttribute(doCreateItem(1437, 1, {x = 32249, y = 32609, z = 6}), "uid", 2499)	-- bandeira verde
		for _, pid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(pid, 71) == 1 or getPlayerStorageValue(pid, 72) == 1 then
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "[CTF] O " .. getCreatureName(cid) .. " morreu com a bandeira verde e ela foi devolvida para sua base.")
			end
		end
	elseif getPlayerStorageValue(cid, 83) >= os.time() then
		doItemSetAttribute(doCreateItem(1435, 1, {x = 32303, y = 32609, z = 6, stackpos = 1}), "uid", 2500) --bandeira vermelha
		setPlayerStorageValue(cid, 83, 0)
		setGlobalStorageValue(12, 0)		
		doAddCondition(cid, conditionGreen)
		for _, pid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(pid, 71) == 1 or getPlayerStorageValue(pid, 72) == 1 then
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "[CTF] O " .. getCreatureName(cid) .. " morreu com a bandeira vermelha e ela foi devolvida para sua base.")
			end
		end
	end
	return true
end