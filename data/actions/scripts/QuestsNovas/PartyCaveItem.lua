function onUse(cid, item, frompos, item2, topos)

local positions = {x = 2292, y = 1157, z = 13}
   if(getTilePzInfo(getCreaturePosition(cid))) then 
	  doTeleportThing(cid, positions)
	doSendMagicEffect(positions,CONST_ME_TELEPORT)
	doPlayerSendTextMessage(cid, 27, "Você foi teleportado pra dentro da Party Cave.")
	else
	doPlayerSendCancel(cid, "Você precisa está em protection zone.")
	end
	return true
end