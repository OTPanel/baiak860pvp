local fromPos, toPos = {x = 112, y = 638, z = 7}, {x = 133, y = 651, z = 7}

function onCastSpell(cid,var) 
    local target = getCreatureTarget(cid)
    if isPlayer(target) then
        local pos = getThingPos(target)
        local newPos = {x = math.random(fromPos.x, toPos.x), y = math.random(fromPos.y, toPos.y), z = fromPos.z}
        doTeleportThing(target, newPos)
        doSendMagicEffect(pos, CONST_ME_POFF)
        doSendAnimatedText(pos, "Puff...", COLOR_WHITE)
        doSendMagicEffect(newPos, CONST_ME_TELEPORT)
        doSendAnimatedText(newPos, "Wuooon", COLOR_WHITE)
        doCreatureSay(cid, "Hehehe", TALKTYPE_MONSTER_SAY)
    end
    return true
end
