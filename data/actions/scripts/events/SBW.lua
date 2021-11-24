function onUse(cid, item, frompos, item2, topos)
if item.actionid == 7900 then
	if(SBW_AMMOINFI) then
		doPlayerSendTextMessage(cid, 27, "bolas de neve infinita, voce nao precisa comprar.")
	else
		if (getPlayerStorageValue(cid, SBW_SCORE) > 0) and (getPlayerStorageValue(cid, SBW_AMMO) < 30) then
			doPlayerSetStorageValue(cid, SBW_SCORE, getPlayerStorageValue(cid, SBW_SCORE)-1)
			doPlayerSetStorageValue(cid, SBW_AMMO, getPlayerStorageValue(cid, SBW_AMMO)+SBW_AMMOBUY)
			doPlayerSendTextMessage(cid, 27, "Voce trocou " .. SBW_AMMOBUY .. "x bolas de neve por 1 ponto de jogo.")
			doSendMagicEffect(getCreaturePosition(cid),4)
		else
			doPlayerSendTextMessage(cid, 27, "Voce nao possui pontos de jogo o suficiente ou ja esta carregando muitas bolas de neve.")                      
		end
	end
end
end