function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not checkHaveAddon(cid) then
        doPlayerSendCancel(cid, "You don't have addons.")
        return true
    end
    if getPlayerBonusCount(cid) == #SBS.storages  then
        doPlayerSendCancel(cid, "You already reached the maximum of active bonuses.") 
        return true
    end
    local bonusid = getItemAttribute(item.uid, "bonusid")
    if bonusid then
        local slot = getPlayerBonusSlotById(cid, bonusid)
        if slot then
            doPlayerSendCancel(cid, "You already have an active ".. getBonusNameById(bonusid) .. " bonus.")
            return true
        end
        local freeslot = getPlayerFreeBonusSlot(cid)
        local rand = tonumber(getItemAttribute(item.uid, "bonusvalue"))
        if getCreatureCondition(cid, CONDITION_ATTRIBUTES, SBS.conds[bonusid]) then
            doRemoveCondition(cid, CONDITION_ATTRIBUTES, SBS.conds[bonusid])
        end
        local playerbonus = bonusid == 1 and HP_BONUS_TAB or (bonusid == 2 and MP_BONUS_TAB or (bonusid == 3 and MAGIC_BONUS_TAB or SKILLS_BONUS_TAB))
        local fullhp, fullmp = getCreatureMaxHealth(cid), getCreatureMaxMana(cid)
        doAddCondition(cid, playerbonus[rand])
        if bonusid == 1 and getCreatureHealth(cid) == fullhp then
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
        elseif bonusid == 2 and getCreatureMana(cid) == fullmp then
            doPlayerAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
        end
        doSendMagicEffect(getPlayerPosition(cid), math.random(28,30))
        setPlayerStorageValue(cid, freeslot[1], bonusid)
        setPlayerStorageValue(cid, freeslot[2], rand)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations! Now you have a bonus of ".. rand .. " " .. getBonusNameById(bonusid) .."!")
        doRemoveItem(item.uid, 1)
    end
    return true
end