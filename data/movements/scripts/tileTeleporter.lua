local teleportPoints = {
[10] = {x = 152, y = 51, z = 7},
[11] = {x = 152, y = 52, z = 7},
[12] = {x = 152, y = 53, z = 7},
[13] = {x = 153, y = 53, z = 7},
[14] = {x = 154, y = 53, z = 7},
[15] = {x = 154, y = 52, z = 7},
[16] = {x = 154, y = 51, z = 7}
}

function onStepIn(cid, item, position)
	if isPlayer(cid) then
		local position = teleportPoints[math.random(10,16)]
		doTeleportThing(cid, position)
		
	end
	return true
end