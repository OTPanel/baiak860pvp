local posgreen = {
	{x = 32291, y = 32599, z = 7},
	{x = 32290, y = 32600, z = 7}, -- aleattorio red
	{x = 32289, y = 32601, z = 7},
	{x = 32290, y = 32602, z = 7}
}

local posred = {
	{x = 32262, y = 32618, z = 7},
	{x = 32264, y = 32616, z = 7},
	{x = 32263, y = 32617, z = 7}, -- aleatori ogreen
	{x = 32260, y = 32615, z = 7}
}

function onStepIn(cid, item, position, fromPosition)
	local tpsred = posred[math.random(#posred)]
	local tpsgreen = posgreen[math.random(#posgreen)]

	if item.aid == 1435 then
		doTeleportThing(cid, tpsred)
		doSendMagicEffect(tpsred, CONST_ME_TELEPORT)
	
	elseif item.aid == 1436 then
		doTeleportThing(cid, tpsgreen)
		doSendMagicEffect(tpsgreen, CONST_ME_TELEPORT)
	end
	return true
end