function onStepIn(cid, item, position, fromPosition)
	if getPlayerAccess(cid) < 4 then
		setGlobalStorageValue(17, getGlobalStorageValue(17)+1)
		doRemoveCondition(cid, CONDITION_POISON)
		doRemoveCondition(cid, CONDITION_FIRE)
		doPlayerPopupFYI(cid, "-BR-\nVocê precisa desviar dos fogos o máximo que puder para vencer o evento.\n\n-ENG-\nTo win and get a Rewards, to stay as long as possible in the arena.")
	end
	return true
end