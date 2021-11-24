function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 6)) then
		return true
	end
if doPlayerRemoveMoney(cid, 20000) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
local efeitos = math.random(34, 54)
doSendMagicEffect(getCreaturePosition(cid), efeitos)
doCreatureSay(cid, "Voce comprou um AOL", TALKTYPE_ORANGE_1)
return true
else
doPlayerSendTextMessage(cid, 22, "Você precisa de dinheiro para comprar um aol")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
return true
end