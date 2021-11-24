function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if isPlayer(cid) then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end
	return true
end
