function onUse(cid, item, fromPosition, item2, toPosisition)
	local rskulls = {green = SKULL_GREEN, red = SKULL_RED, black = SKULL_BLACK, white}
	--[[
	if isInArray(rskulls, getPlayerSkullType(cid)) then
		doPlayerSendCancel(cid,"You can't remove your frags and skulls.")
		doSendMagicEffect(getPlayerPosition(cid), 2)
	else
		db.executeQuery("UPDATE `players` SET `frags_all` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
		db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
		doCreatureSetSkullType(cid, 0)
		doCreatureSay(cid, "Your frags and skulls is cleaned!", 19)
		doSendMagicEffect(getPlayerPosition(cid), 26)
		doRemoveItem(item.uid, 1)
	return true
	end
	]]--
	
	
	if getPlayerSkullType(cid) >= 4 then
		db.executeQuery("UPDATE `players` SET `frags_all` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
		db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
		doCreatureSetSkullType(cid, 0)
		doCreatureSay(cid, "Your frags and skulls are cleaned!", 19)
		doSendMagicEffect(getPlayerPosition(cid), 26)
		doRemoveItem(item.uid, 1)
	else
		db.executeQuery("UPDATE `players` SET `frags_all` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
		db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
		doCreatureSay(cid, "Your frags are cleaned!", 19)
		doSendMagicEffect(getPlayerPosition(cid), 26)
		doRemoveItem(item.uid, 1)
	end
	return true
end