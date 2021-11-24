local positions = {

	{x=179, y=120, z=9, stackpos=253},
	{x=178, y=120, z=9, stackpos=253},
	{x=177, y=120, z=9, stackpos=253},
	{x=176, y=120, z=9, stackpos=253}

}

local pos = {
	
	{x = 84, y = 120, z = 9},
	{x = 83, y = 120, z = 9},
	{x = 82, y = 120, z = 9},
	{x = 81, y = 120, z = 9},

}

function onUse(cid, item, frompos, item2, topos)

	local check = true
	for i = 1,4 do
		local player = getTopCreature(positions[i])
		if player and player.uid and player.uid > 0 and isPlayer(player.uid) then
			check = true
		else
			check = false
			break;
		end
		if player and player.uid and player.uid > 0 and isPlayer(player.uid) and getPlayerLevel(player.uid) < 100 then
			check = false
			break;
		end
	end

	if check then
		for i = 1,4 do
			local player = getTopCreature(positions[i])
			doTeleportThing(player.uid,pos[i])
		end

		doCreateMonster("Orshabaal",{x = 85, y = 120, z = 9})
		doCreateMonster("Demon",{x = 81, y = 118, z = 9})
		doCreateMonster("Demon",{x = 83, y = 118, z = 9})
		doCreateMonster("Demon",{x = 82, y = 122, z = 9})
		doCreateMonster("Demon",{x = 84, y = 122, z = 9})
		doCreateMonster("Demon",{x = 85, y = 120, z = 9})

	else

		doPlayerSendCancel(cid,"São necessários 4 jogadores acima do level 100 para fazer a Annihilator.")
	end
	return true
end
