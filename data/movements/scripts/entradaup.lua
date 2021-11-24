local pos = {x = 133, y = 60, z = 7}

function onStepIn(cid, item, position, fromPosition)
if getPlayerAccess(cid) then
doTeleportThing(cid, pos) 
--doSendMagicEffect(getThingPos(cid), 10)
end
return true
end