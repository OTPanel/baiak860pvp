local cfg = {
   
   [1] = 9,
   [2] = 10,
   [3] = 11,
   [4] = 12,
   [5] = 9,
   [6] = 10,
   [7] = 11,
   [8] = 12

}

function onUse(cid, item, frompos, item2, topos)

   local sto = getPlayerStorageValue(cid,722380)

   local ring = getPlayerSlotItem(cid,CONST_SLOT_RING)
   if ring and ring.uid and ring.uid > 0 and ring.itemid == 10502 then
   		doPlayerSendCancel(cid,"Retire o mega ring antes de fazer a quest.")
   		return true
   end
   
   if getPlayerVocation(cid) >= 9 then
      doPlayerSendCancel(cid,"Você já tem a segunda promote.")
      return true
   end

   if sto == -1 then
      local voc = cfg[getPlayerVocation(cid)]
      doPlayerSetStorageValue(cid,722380,voc)
      doPlayerSetStorageValue(cid,722423,1)
      doPlayerSetStorageValue(cid,VOCATION_STORAGE,voc)
      --doPlayerSetVocation(cid,voc)
      doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Você recebeu sua segunda promote, parabéns!")
      doBroadcastMessage("O jogador "..getCreatureName(cid).." conseguiu a sua segunda promote, parabéns!")
      setCreatureMaxHealth(cid,getCreatureMaxHealth(cid) + 1000)
      setCreatureMaxMana(cid,getCreatureMaxMana(cid) + 1000)
   else
      doPlayerSendCancel(cid,"Você já tem a segunda promote.")
   end
   return true
end
