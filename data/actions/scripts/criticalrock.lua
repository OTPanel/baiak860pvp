local config = {

   levelscrit = 100,  --- leveis que terão
   storagecrit = 48903 -- storage que será verificado

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local criticalLevel = getPlayerStorageZero(cid, config.storagecrit)
    local thingPos = getThingPos(cid)
    if criticalLevel < config.levelscrit then
        if doRemoveItem(item.uid, 1) then
            doCreatureSetStorage(cid, config.storagecrit, criticalLevel + 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[CRITICAL] Você evoluiu para o nível [".. (criticalLevel + 1) .."/".. config.levelscrit .."] de critical.")
            doSendAnimatedText(thingPos, "+CRITICAL", 31)
            doSendMagicEffect(thingPos, 16)
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[CRITICAL] Você já atingiu o nível máximo de critical [100/100].")
        doSendMagicEffect(thingPos, CONST_ME_POFF)
    end
    return true
end
