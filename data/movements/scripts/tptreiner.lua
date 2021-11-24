	function onStepIn(cid, item, position, fromPosition)
    for i=1, table.maxn(trainers) do
    local trainer = trainers[i]
    local position = {x=trainer.x,y=trainer.y,z=trainer.z,stackpos=255}
    local thing = getThingFromPos(position)
    if (thing.itemid == 0) then
    doTeleportThing(cid, position)
    doSendMagicEffect(position, 10)
    return true
    end
    end
    doPlayerSendCancel(cid, "The room trainers is full.")
    doTeleportThing(cid, fromPosition, false)
    doSendMagicEffect(fromPosition, 2)
    return true
    end
