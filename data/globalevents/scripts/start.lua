function onStartup()
	db.query("UPDATE `players` SET `online` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. ";")
	db.query("DELETE FROM `guild_wars` WHERE `status` = 0 AND `begin` < " .. (os.time() - 2 * 86400) .. ";")
	db.query("UPDATE `guild_wars` SET `status` = 5, `end` = " .. os.time() .. " WHERE `status` = 1 AND `end` > 0 AND `end` < " .. os.time() .. ";")
	doCreateNpc("Cassino2",{x=112,y=67,z=6})
	doCreateNpc("Cassino3",{x=489,y=631,z=6})
	doCreateNpc("Cassino",{x=489,y=627,z=6})
	doCreateMonster("King of Baiak",{x = 31, y = 194, z = 7})
	doCreateNpc("Task Man", {x=140,y=54,z=7})
	doSetGameState(GAMESTATE_CLOSED)
	return true
end