function onEquip(cid, item, slot, boolean)
	if getPlayerStorageValue(cid, WarConfigs.WarSSAMight) > 0 then
		return false
	end
	doTransformItem(item.uid, 12717)
	return true
end
