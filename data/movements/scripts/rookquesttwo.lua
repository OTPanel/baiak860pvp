	local shopinarea = {x = 159, y = 49, z = 15}

function onStepIn(cid, item, position, fromPosition)
doTeleportThing(cid, shopinarea)
return TRUE
end