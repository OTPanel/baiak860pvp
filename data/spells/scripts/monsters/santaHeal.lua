function onCastSpell(cid,var)
    local maxHealth = getCreatureMaxHealth(cid)
    if getCreatureHealth(cid) <= (maxHealth * 0.15) then
        local sto = getPlayerStorageZero(cid, 199640)
        if sto < 3 then
            doCreatureAddHealth(cid, maxHealth)
            doCreatureSetStorage(cid, 199640, sto + 1)
            doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
            doCreatureSay(cid, "Ho ho ho, adoro encher minha vida!", TALKTYPE_MONSTER_SAY)
        end
    end
    return true
end
