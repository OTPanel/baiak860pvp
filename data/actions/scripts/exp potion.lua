function onUse(cid, item, frompos, item2, topos)

  local sto, sto20 = getPlayerStorageValue(cid,722362), getPlayerStorageValue(cid,722384)
  if sto20 == -1 then
    if sto == -1 then
      if doRemoveItem(item.uid, 1) then
        doPlayerSetStorageValue(cid,722362 ,tonumber(os.time() + 3600*2))
        doPlayerSetExperienceRate(cid, getPlayerRates(cid)[8] + 0.4) 
        doPlayerSendTextMessage(cid,22,"Você recebeu 2x exp por 2 horas. Use !doubleexp para saber quanto tempo de double exp ainda tem.")
        doSendMagicEffect(frompos,13)
        addEvent(function()
          if isPlayer(cid) then
            doPlayerSetExperienceRate(cid, getPlayerRates(cid)[8] - 0.4)
            doPlayerSetStorageValue(cid,722362 ,-1)
            doPlayerSendTextMessage(cid,22,"O efeito acabou e você voltou a receber exp normalmente.")
          end
          end,120*1000*60)
      end
    else
      doPlayerSendCancel(cid,"Você já está recebendo o dobro de xp.")
    end
  else
    doPlayerSendCancel(cid,"Você não pode usar double exp e 20% de exp ao mesmo tempo.")
  end
  return true
end
