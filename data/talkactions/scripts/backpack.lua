function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 6)) then
		return true
	end
if doPlayerRemoveMoney(cid, 5000) == TRUE then
local bp = doPlayerAddItem(cid, 10518, 1)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Voce comprou uma backpack", TALKTYPE_ORANGE_1)
return true
else
doCreatureSay(cid, "Voce nao tem dinheiro suficiente", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)

end
end