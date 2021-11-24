local pos = {x = 137, y = 64, z = 8}

function onStepIn(cid, item, position, fromPosition)
if getPlayerAccess(cid) then
doTeleportThing(cid, pos) 
--doSendMagicEffect(getThingPos(cid), 10)
end
return true
end