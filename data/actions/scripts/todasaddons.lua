function onUse(cid, item, frompos, item2, topos)

local level = 1 -- Level necessário para poder usar o item.

	if item.itemid == 11138 then
		if getPlayerLevel(cid) >= level then
			doPlayerAddAddons(cid, 3) -- 3 significa os dois addons.
			doSendMagicEffect(getThingPos(cid), 28)
			doPlayerSendCancel(cid, "Você recebeu todas as addons full!.")
			doRemoveItem(item.uid, 1)
		else
			doPlayerSendCancel(cid, "You don't have level enought.")
		end
	end
	return true
end