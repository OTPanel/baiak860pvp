function onSay(cid,words,param)

	if(not checkExhausted(cid, 666, 3)) then
		return false
	end



	if getPlayerGroupId(cid) >= 5 then
	local backpack = doCreateItemEx(10521)
		if param == "kina" then
		doAddContainerItem(backpack,2443,1)
		doAddContainerItem(backpack,2504,1)
		doAddContainerItem(backpack,2503,1)
		doAddContainerItem(backpack,2646,1)
		doAddContainerItem(backpack,2121,1)
		doAddContainerItem(backpack,2538,1)
		doAddContainerItem(backpack,2496,1)
		doPlayerAddItemEx(cid,backpack, 1)
		doPlayerSendTextMessage(cid, 27, "Você criou um set para Warfront Kina.")
		return true
		end
		
		if param == "pally" then
		doAddContainerItem(backpack,5907,1)
		doAddContainerItem(backpack,6099,1)
		doAddContainerItem(backpack,5462,1)
		doAddContainerItem(backpack,6100,1)
		doAddContainerItem(backpack,5918,1)
		doAddContainerItem(backpack,2527,1)
		doAddContainerItem(backpack,6300,1)
		doPlayerAddItemEx(cid, backpack, 1)
		doPlayerSendTextMessage(cid, 27, "Você criou um set para Warfront Pally.")
		return true
		end
		end
		
	return true
end
	
		
	