	local shopinarea = {x = 252, y = 59, z = 14}

function onStepIn(cid, item, position, fromPosition)
doTeleportThing(cid, shopinarea)
return TRUE
end