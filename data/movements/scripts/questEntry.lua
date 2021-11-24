	local shopinarea = {x = 151, y = 167, z = 7}

function onStepIn(cid, item, position, fromPosition)
doTeleportThing(cid, shopinarea)
return TRUE
end