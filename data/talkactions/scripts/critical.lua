local critical = 48903
function onSay(cid)
	if(not checkExhausted(cid, 666, 5)) then
		return false
	end

if getPlayerStorageValue(cid, critical) >= 1 then
doPlayerPopupFYI(cid, "Critical :\n O sistema consiste em hitar 50% a mais dos ataques causados.\n Por Exemplo: Com 10 criticals, voce vai hitar \n 50% de dano de 3 entre \n 100 ataques desferidos a seu oponente. \n Com 100 criticals (o maximo) voce vai hitar 50% \n de dano de 30 entre 100 \n ataques desferidos ao seu openente. \n Cada pedra que voce usar, sua skill de critical \n aumenta em 1 ponto.  \n Podendo no maximo ter 100 \n pontos. Para obter a pedra \n voce precisa comprar \n no Npc Dodge/critical Seller. \n["..getPlayerStorageValue(cid, critical).."/100]")
else
doPlayerPopupFYI(cid,"Critical :\n O sistema consiste em hitar 50% a mais dos ataques causados.\n Por Exemplo: Com 10 criticals, voce vai hitar \n 50% de dano de 3 entre \n 100 ataques desferidos a seu oponente. \n Com 100 criticals (o maximo) voce vai hitar 50% \n de dano de 30 entre 100 \n ataques desferidos ao seu openente. \n Cada pedra que voce usar, sua skill de critical \n aumenta em 1 ponto.  \n Podendo no maximo ter 100 \n pontos. Para obter a pedra \n voce precisa comprar \n no Npc Dodge/critical Seller. \n [0/100]")
end
return 1
end