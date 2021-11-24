function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if getPlayerStorageValue(cid, 129126) == 1 then
        doTeleportThing(cid, {x = 2428, y = 912, z = 7})
        doSendMagicEffect({x = 2428, y = 912, z = 7}, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, 25, "Bem vindo a quest do Um Anel")
    else
        doTeleportThing(cid, fromPosition)
        doSendMagicEffect(fromPosition, CONST_ME_POFF)
        doPlayerSendCancel(cid, "Você precisa ter derrotado o Amon para passar!")
    end
    return true
end