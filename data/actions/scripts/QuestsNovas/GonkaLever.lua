function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayersInArea({x = 261, y = 527, z = 5}, {x = 277, y = 543, z = 5}) or getGlobalStorageValue(15421) > os.time() then
		doPlayerSendCancel(cid, "Já tem alguém lutando contra o Gonka, espere ele sair.")
		return true
	end
	doTeleportThing(cid, {x = 269, y = 543, z = 5})
	doSendMagicEffect({x = 269, y = 543, z = 5}, CONST_ME_TELEPORT)
	doCreateMonster("Gonka", {x = 270, y = 527, z = 5})

	return true
end
        