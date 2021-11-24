local config = {
   mana = 100,
   hp = 250,
   coins = 50,
 
   storage_id = 11321,
}
 
function onUse(cid)
 
   if getPlayerStorageValue(cid, config.storage_id) < 1 then
      setCreatureMaxHealth(cid, getCreatureHealth(cid) + 100)
		doSendMagicEffect(getThingPos(cid), 13)
		doPlayerSendTutorial(cid,19)
   else
      return doPlayerSendCancel(cid, "It's empty.")
   end
 
   return true
end
 