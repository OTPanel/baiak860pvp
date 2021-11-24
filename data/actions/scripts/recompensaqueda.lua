local config = {
[12600] = {item = 1988, itemcontainer = 2346, count = 1, itemcontainer2 = 7443, count2 = 1, level = 230},
}

function onUse(cid, item, frompos, item2, topos)
local aid = config[item.aid]
	if getPlayerLevel(cid) < aid.level then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need level 230 for take item")
		return true
	end
	if getPlayerStorageValue(cid, 9874923) == 1 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You already recompense.")
		return true
	else
		bp = doPlayerAddItem(cid, aid.item, 1)
		doAddContainerItem(bp, aid.itemcontainer, aid.count)
		doAddContainerItem(bp, aid.itemcontainer2, aid.count2)
		setPlayerStorageValue(cid, 9874923,1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You take your recompense, thank you!")
	return true
	end
end
