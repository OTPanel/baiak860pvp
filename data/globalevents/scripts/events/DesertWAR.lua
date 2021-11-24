function onTime ()
	doItemSetAttribute(doCreateItem(1387, 1, {x = 129, y = 58, z = 7, stackpos = 1}), "aid", 2137)
	countDownTeleport({x = 129, y = 58, z = 7}, 180)
	doBroadcastMessage("Desert WAR starting in 3 minutes! The teleport will be closed when the event start!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(4, 0)
	setGlobalStorageValue(5, 0)
	addEvent(startDesert, 3 * 60 * 1000)
	return true
end

function startDesert()
	doRemoveItem(getTileItemById({x = 129, y = 58, z = 7}, 1387).uid, 1)
	if getGlobalStorageValue(4) > 0 and getGlobalStorageValue(5) > 0 then
		doBroadcastMessage("Good luck in the desert war event people! The teleport has closed!", MESSAGE_STATUS_WARNING)		
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doCreatureSetNoMove(cid, false)
			end
		end
	else
		doBroadcastMessage("Desert War hasn\'t started beacuse there were not enough players.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end