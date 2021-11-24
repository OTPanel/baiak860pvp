local dodge = 98798644
function onSay(cid)
if getPlayerStorageValue(cid, dodge) >= 1 then
doPlayerPopupFYI(cid, "Dodge System:\n O sistema consiste em defender 50% dos ataques recebidos.\n Por Exemplo: Com 10 dodges, voce vai defender \n 50% de dano de 3 entre \n 100 ataques do seu oponente. \n Com 100 dodges (o maximo) voce vai defender 50% \n de dano de 30 entre 100 \n ataques do oponente. \n Cada pedra que voce usar, sua skill de dodge \n aumenta em 1 ponto.  \n Podendo no maximo ter 100 \n pontos. Para obter a pedra \n voce precisa comprar \n no Npc Dodge/critical Seller. \n["..getPlayerStorageValue(cid, dodge).."/100]")
else
doPlayerPopupFYI(cid,"Dodge System:\n O sistema consiste em defender 50% dos ataques recebidos.\n Por Exemplo: Com 10 dodges, voce vai defender \n 50% de dano de 3 entre \n 100 ataques do seu oponente. \n Com 100 dodges (o maximo) voce vai defender 50% \n de dano de 30 entre 100 \n ataques do oponente. \n Cada pedra que voce usar, sua skill de dodge \n aumenta em 1 ponto.  \n Podendo no maximo ter 100 \n pontos. Para obter a pedra \n voce precisa comprar \n no Npc Dodge/critical Seller. \n [0/100]")
end
return 1
end