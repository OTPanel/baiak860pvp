function onUse(cid, item, frompos, item2, topos)

  local sto, sto20 = getPlayerStorageValue(cid,722362), getPlayerStorageValue(cid,722384)
  if sto == -1 then
  	if sto20 == -1 then
	    if doRemoveItem(item.uid, 1) then
	      doPlayerSetStorageValue(cid,722384 ,tonumber(os.time() + 3600*2))
        doPlayerSetExperienceRate(cid, getPlayerRates(cid)[8] + 0.2)
	      doPlayerSendTextMessage(cid,22,"Você recebeu 20% a mais de exp por 2 horas. Use !doubleexp para saber quanto tempo de exp bonus você ainda tem.")
	      doSendMagicEffect(frompos,13)
	      addEvent(function()
	        if isPlayer(cid) then
            doPlayerSetExperienceRate(cid, getPlayerRates(cid)[8] - 0.2)
	          doPlayerSetStorageValue(cid,722384 ,-1)
	          doPlayerSendTextMessage(cid,22,"O efeito acabou e você voltou a receber exp normalmente.")
	        end
	        end,120*1000*60)
	    end
  	else
    	doPlayerSendCancel(cid,"Você já está recebendo o 20% a mais de exp.")
  	end
  else
  	doPlayerSendCancel(cid,"Você não pode usar double exp e 20% de exp ao mesmo tempo.")
  end
  return true
end
