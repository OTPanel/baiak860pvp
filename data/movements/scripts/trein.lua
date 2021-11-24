local firstPositions = {
	
	{x = 22, y = 946, z = 8},
	{x = 22, y = 965, z = 8},
	{x = 22, y = 984, z = 8},
	{x = 22, y = 1002, z = 8},
	{x = 22, y = 1021, z = 8},
	{x = 22, y = 1040, z = 8},
	{x = 22, y = 1058, z = 8},
	{x = 22, y = 1077, z = 8},
	{x = 22, y = 1096, z = 8},
	{x = 22, y = 1114, z = 8},
	{x = 22, y = 1133, z = 8},
	{x = 22, y = 1152, z = 8},
	{x = 22, y = 1171, z = 8},
	{x = 22, y = 1190, z = 8},
	{x = 22, y = 1209, z = 8}

}

local function getAvailableRoom()
	for o = 1, #firstPositions do
		local position = firstPositions[o]
		for i = 1, 30 do
			local player = getTopCreature(position).uid
			if not isPlayer(player) then
				return position;
			end
			position = {x = position.x + 18, y = position.y, z = position.z}
		end
	end
	return false
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local trainer_pos = getAvailableRoom()
	if trainer_pos and doTeleportThing(cid, trainer_pos, true) then
		doSendMagicEffect(position, CONST_ME_TELEPORT)
		doCreatureSay(cid, "Go Training", TALKTYPE_MONSTER_SAY)
	else
		doPlayerSendCancel(cid, "Todos os trainers estão lotados.")
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	end
	return true
end
