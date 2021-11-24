local cfg = {
amount = 200
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerLevel(cid) > 7 then
doAccountAddPoints(cid, cfg.amount)
doCreatureSay(cid, "Parabéns! Você recebeu 200 Premium Points! ", TALKTYPE_ORANGE_1)
doSendMagicEffect(getCreaturePosition(cid), 28)
doRemoveItem(item.uid,1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você vai ser kikado em 4 segundos para salvar.")
else
doPlayerSendCancel(cid,"Você precisa de level 400 para usar este item.")
end
return TRUE
end