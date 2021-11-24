local cfg = {
	
	[61480] = 7429,
	[61481] = 2443,
	[61482] = 7407,
	[61483] = 7424,
	[61484] = 5907,
	[61485] = 2641

}

function onUse(cid, item, frompos, item2, topos)
	if cfg[item.uid] then
		if getAccountStorageValue(getPlayerAccountId(cid),145144) == -1 then
			setAccountStorageValue(getPlayerAccountId(cid),145144,1)
			local add_item = doCreateItemEx(cfg[item.uid])
			doItemSetAttribute(add_item,"description","Comprado pelo jogador "..getCreatureName(cid).."!")
			doPlayerAddItemEx(cid,add_item)
			doPlayerSendTextMessage(cid,25,"Você ganhou um "..getItemNameById(cfg[item.uid]))
		else
			doPlayerSendCancel(cid,"Você só pode pegar um prêmio por account.")
		end
	end
	return true
end 
