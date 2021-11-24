function onUse(cid, item, frompos, item2, topos)
	if doRemoveItem(item.uid,1) then
		doPlayerAddStamina(cid, 2520)
		doSendMagicEffect(frompos, 1)
	end
	return true
end
