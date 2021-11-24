function onUse(cid, item, itemEx, toPosition, fromPosition)
if getPlayerStorageValue(cid, 20000) <= 0 then
setPlayerStorageValue(cid, 20000, 1)
doPlayerSendTextMessage(cid, 22, "Parabéns! Você ganhou o RETRO outfit.")
doSendMagicEffect(getPlayerPosition(cid), 30)
if getPlayerSex(cid) == 0 then
doPlayerAddOutfit(cid, 126, 1)
else
doPlayerAddOutfit(cid, 127, 1)
end
else
doPlayerSendCancel(cid, "Você já tem esse outfit.")
return true
end
return true
end