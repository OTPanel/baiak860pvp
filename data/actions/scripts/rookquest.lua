local cfg = {
amount = 7
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerStorageValue(cid, 56564) <= 0 then
	doAccountAddPoints(cid, cfg.amount)
	doCreatureSay(cid, "Parabéns! Você recebeu 7 Premium Points! ", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getCreaturePosition(cid), 28)
	setPlayerStorageValue(cid, 56564, 1)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você vai ser kikado em 4 segundos para salvar.")
else
	doPlayerSendCancel(cid,"Você ja ganhou a recompensa.")
end
return TRUE
end