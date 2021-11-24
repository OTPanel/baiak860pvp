-- Baiuca Event by Dwarfer

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if not isPlayer(cid) then return true end
    if item.actionid == BAIUCA.tile_actionid then
        doResetBaiucaItems()
        doCreatureSetNoMove(cid, true)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have "..BAIUCA.time_to_kick.." seconds to select the item you want to earn.")
        doBaiucaPlayerCountdown(cid, BAIUCA.time_to_kick)
    elseif item.actionid == BAIUCA.teleport.actionid then
        if getPlayerLevel(cid) < BAIUCA.min_level then
            doPlayerSendCancel(cid, "[Baiuca Event]: Only players level "..BAIUCA.min_level.." or higher can participate.")
            doTeleportThing(cid, fromPosition, false)
            return true
        end
        if BAIUCA.check_MC then
            if checkMCInBaiucaEvent(cid) then
                doPlayerSendCancel(cid, "[Baiuca Event]: Your IP has already been detected in the event.")
                doTeleportThing(cid, fromPosition, false)
                return true
            end
        end
        local order = getGlobalStorageValue(BAIUCA.storages[5]) + 1
        local destination = BAIUCA.enter_position
        local newpos = {x = destination.x + math.random(-2, 2), y = destination.y + math.random(-2, 2), z = destination.z}
        doTeleportThing(cid, newpos)
        doSendMagicEffect(newpos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You joined in the event. Wait until event starts. You are the number ["..order.."] in the list.")
        setPlayerStorageValue(cid, BAIUCA.storages[4], order)
        setGlobalStorageValue(BAIUCA.storages[5], order)
    end
    return true
end