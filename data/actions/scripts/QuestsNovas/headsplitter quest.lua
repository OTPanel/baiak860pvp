local positions = {

	{x = 282, y = 352, z = 7},
	{x = 283, y = 352, z = 7},
	{x = 284, y = 352, z = 7},
	{x = 285, y = 352, z = 7},
	{x = 291, y = 352, z = 7},
	{x = 292, y = 352, z = 7},
	{x = 293, y = 352, z = 7},
	{x = 294, y = 352, z = 7},
	{x = 289, y = 352, z = 7},
	{x = 287, y = 352, z = 7}

}

local pos = {
	
	{x = 283, y = 377, z = 7},
	{x = 284, y = 376, z = 7},
	{x = 284, y = 378, z = 7},
	{x = 285, y = 377, z = 7},
	{x = 286, y = 377, z = 7},
	{x = 287, y = 377, z = 7},
	{x = 288, y = 377, z = 7},
	{x = 289, y = 377, z = 7},
	{x = 290, y = 376, z = 7},
	{x = 290, y = 378, z = 7}

}

local function removeQuestMonsters()
	local frompos, topos = {x = 266, y = 371, z = 7}, {x = 309, y = 414, z = 7}
	for x = frompos.x, topos.x do
		for y = frompos.y, topos.y do
			local area = {x = x, y = y, z = 7}
			local monster = getTopCreature(area)
			if monster and monster.uid > 0 and isMonster(monster.uid) then
				doRemoveCreature(monster.uid)
			end
		end
	end
end

function onUse(cid, item, frompos, item2, topos)

	if item.uid == 61502 then
		if getPlayerStorageValue(cid,722420) == -1 then
			doPlayerSetStorageValue(cid,722420,1)
			doPlayerAddOutfit(cid,253,3)
			doPlayerSendTextMessage(cid,25,"Você ganhou o outfit Headsplitter que adiciona 300 de life e mana e 10 de speed!")
		else
			doPlayerSendCancel(cid,"Você já pegou o premio.")
		end
		return true
	end

	if getPlayersInArea({x = 266, y = 371, z = 7}, {x = 309, y = 414, z = 7}) then
		doPlayerSendCancel(cid,"Já tem alguém fazendo a quest, aguarde.")
		return true
	end

	local check = true
	for i = 1,10 do
		local player = getTopCreature(positions[i])
		if player and player.uid and isPlayer(player.uid) then
			check = true
		else
			check = false
			break;
		end
		if player and player.uid and isPlayer(player.uid) and getPlayerLevel(player.uid) < 350 then
			check = false
			break;
		end
	end

	if check then

		doTransformItem(item.uid,item.itemid == 1945 and 1946 or 1945)

		for i = 1,10 do
			local player = getTopCreature(positions[i])
			doTeleportThing(player.uid,pos[i])
		end

		removeQuestMonsters()

		local spiders = {{x = 286, y = 374, z = 7}, {x = 288, y = 374, z = 7}, {x = 281, y = 376, z = 7}, {x = 281, y = 378, z = 7}, {x = 286, y = 380, z = 7}, {x = 288, y = 380, z = 7}}
		for i = 1, #spiders do
			doCreateMonster("Crystal Spider Abomination",spiders[i])
		end
		
		doCreateMonster("Horus",{x = 291, y = 377, z = 7})
		doCreateMonster("The Headsplitter", {x = 282, y = 396, z = 7})
		doCreateMonster("a carved stone demon", {x = 273, y = 396, z = 7})

	else

		doPlayerSendCancel(cid,"São necessários 10 jogadores acima do level 350 para fazer a quest.")
	end
	return true
end
