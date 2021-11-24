local config = {
   mana = 100,
   hp = 250,
   coins = 50,
 
   storage_id = 11321,
}

function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 5)) then
		return false
	end
	
	if param == "add" then
		setPlayerStorageValue(cid, 2351232, 1)
		doPlayerSendCancel(cid, "Storage Added")
	return true
	end
	if param == "remove" then
		setPlayerStorageValue(cid, 11321, -1)
		doPlayerSendCancel(cid, "Storage Removed")
		setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) - config.hp)
		setCreatureMaxMana(cid, getCreatureMaxMana(cid) - config.mana)
	return true
	end
end