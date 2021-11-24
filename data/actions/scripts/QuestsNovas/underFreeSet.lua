local cfg = {
	
	[10084] = {reward = 10047, storage = 722702},
	[10085] = {reward = 8868, storage = 722703},
	[10086] = {reward = 11349, storage = 722704},
	[10087] = {reward = 12645, storage = 722702},
	[10088] = {reward = 12646, storage = 722703},
	[10089] = {reward = 12647, storage = 722704},
	[10090] = {reward = 6099, storage = 722702},
	[10091] = {reward = 6100, storage = 722703},
	[10092] = {reward = 5918, storage = 722704}

}

function onUse(cid, item, frompos, item2, topos)
	local tmp = cfg[item.uid]
	if tmp then
		if getCreatureStorage(cid, tmp.storage) == EMPTY_STORAGE then
			doCreatureSetStorage(cid, tmp.storage, 1)
			doPlayerAddItem(cid, tmp.reward, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ganhou um ".. getItemNameById(tmp.reward) .."!")
		else
			doPlayerSendCancel(cid, "It is empty.")
		end
	end
	return true
end 
