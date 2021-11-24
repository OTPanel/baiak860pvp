local statue = {
	[10351] = SKILL_SWORD,
	[8836] = SKILL_AXE,
	[8626] = SKILL_CLUB,
	[10353] = SKILL_DISTANCE,
	[8834] = SKILL__MAGLEVEL
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isPlayerPzLocked(cid) then
		return false
	end

	if item.actionid == 1000 and getPlayerPremiumDays(cid) > 0 then
		doPlayerSetOfflineTrainingSkill(cid, statue[item.itemid])
		doRemoveCreature(cid)
	else
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUNEEDPREMIUMACCOUNT)
	end

	return true
end
