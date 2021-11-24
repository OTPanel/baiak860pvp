function onUse(cid, item, fromPosition, itemEx, toPosition)
    local v, tmp = math.random(333), getCreatureOutfit(cid)
    while isInArray({tmp.lookType, 75, 135, 266, 302}, v) == TRUE or v <= 1 or (v > 160 and v < 192) or v > 333 do
        v = math.random(351)
    end
 
    tmp.lookType = v
    doCreatureChangeOutfit(cid, tmp)
    doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
    doCreatureSay(cid, 'Outfit Changed!.', TALKTYPE_ORANGE_1, false, cid, getThingPos(cid))
    return TRUE
end