local config = {
[12404] = {monster = "Boss Destruidor", pos = {x=4955, y=1951, z=10}, reset = 10},
[12405] = {monster = "Boss Destruidor Vip", pos = {x=4960, y=2212, z=10}, reset = 10},
[12406] = {monster = "Destruidor", pos = {x=4962, y=1934, z=10}, reset = 10}, 
[12407] = {monster = "Destruidor Vip", pos = {x=4967, y=2195, z=10}, reset = 10},
[12408] = {monster = "Franklin", pos = {x=1988, y=2520, z=7}, reset = 10},
[12409] = {monster = "Boss Worker Golem", pos = {x=1886, y=2438, z=8}, reset = 10},
[12410] = {monster = "Boss War Golem", pos = {x=1882, y=2537, z=8}, reset = 10},
[12411] = {monster = "Hell Ilusion", pos = {x=8445, y=8664, z=6}, reset = 10}, -- boss parte 1 --
[12412] = {monster = "Hell Dragon", pos = {x=8514, y=8784, z=8}, reset = 10}, -- boss parte 2 --
[12413] = {monster = "Hell Phantasm", pos = {x=8588, y=8790, z=9}, reset = 10}, -- boss parte 3 --
[12414] = {monster = "Hell Boss", pos = {x=9087, y=9083, z=8}, reset = 10}, -- boss parte 4 --

 
}

local function reset(pos)
	local thing = getTileItemById(pos, 1946).uid
	return thing > 0 and doTransformItem(thing, 1945)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local aid = config[item.aid]
	if(item.itemid == 1945) then
	if not getCreatureByName(aid.monster) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The boss ".. aid.monster .." has summon in the room please kill.")
		doSummonCreature(aid.monster, aid.pos)
		addEvent(reset, aid.reset * 1000, fromPosition)
		doTransformItem(item.uid, 1946)
		else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The boss ".. aid.monster .. " has summoned.")
		end
		elseif (item.itemid == 1946) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Waiting for click again.")
				return true
		end
	end