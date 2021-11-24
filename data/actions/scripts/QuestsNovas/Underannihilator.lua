local positions = {

    {x=1328, y=985, z=7, stackpos=253},
	{x=1328, y=986, z=7, stackpos=253},
	{x=1328, y=987, z=7, stackpos=253},
	{x=1328, y=988, z=7, stackpos=253},
	{x=1326, y=985, z=7, stackpos=253},
	{x=1326, y=986, z=7, stackpos=253},
	{x=1326, y=987, z=7, stackpos=253},
	{x=1326, y=988, z=7, stackpos=253}

}

local pos = {

	{x = 1348, y = 990, z = 7},
	{x = 1347, y = 990, z = 7},
	{x = 1346, y = 990, z = 7},
	{x = 1345, y = 990, z = 7},
	{x = 1348, y = 988, z = 7},
	{x = 1347, y = 988, z = 7},
	{x = 1346, y = 988, z = 7},
	{x = 1345, y = 988, z = 7},

}

function onUse(cid, item, frompos, item2, topos)

	local check = true
	for i = 1,8 do
		local player = getTopCreature(positions[i])
		if player and player.uid and player.uid > 0 and isPlayer(player.uid) then
			check = true
		else
			check = false
			break;
		end
		if player and player.uid and player.uid > 0 and isPlayer(player.uid) and getPlayerLevel(player.uid) < 250 then
			check = false
			break;
		end
	end

	if check then
		for i = 1,8 do
			local player = getTopCreature(positions[i])
			doTeleportThing(player.uid,pos[i])
		end

		doCreateMonster("sharp demon",{x = 1345, y = 986, z = 7})
		doCreateMonster("sharp demon",{x = 1347, y = 986, z = 7})
		doCreateMonster("sharp demon",{x = 1346, y = 992, z = 7})
		doCreateMonster("sharp demon",{x = 1348, y = 992, z = 7})
		doCreateMonster("orshabaal",{x = 1349, y = 990, z = 7})
		doCreateMonster("orshabaal",{x = 1350, y = 990, z = 7})
		doCreateMonster("orshabaal",{x = 1349, y = 988, z = 7})
		doCreateMonster("orshabaal",{x = 1350, y = 988, z = 7})

	else

		doPlayerSendCancel(cid,"São necessários 8 jogadores acima do level 250 para fazer a Annihilator.")
	end
	return true
end
