local limite = 100 -- limite de dodge
local storagedodge = 98798644 -- storage do dodge
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local dodgeLevel = getPlayerStorageZero(cid, storagedodge)
    local thingPos = getThingPos(cid)
    if dodgeLevel < limite then
        if doRemoveItem(item.uid, 1) then
            doCreatureSetStorage(cid, storagedodge, dodgeLevel + 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[DODGE] Voc� evoluiu para o n�vel [".. (dodgeLevel + 1) .."/"..limite.."] de dodge.")
            doSendAnimatedText(thingPos, "+DODGE", COLOR_PINK)
            doSendMagicEffect(thingPos, 29)
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[DODGE] Voc� j� atingiu o n�vel m�ximo de dodge [100/100].")
        doSendMagicEffect(thingPos, CONST_ME_POFF)
    end
    return true
end