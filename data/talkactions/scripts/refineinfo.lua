function onSay(cid, words, param)
	if(not checkExhausted(cid, 666, 5)) then
		return false
	end
    if param == "" then
        return doPlayerPopupFYI(cid, 
        table.concat({"\n Nosso servidor possui sistema de refines para armas e sets",
						"\n Para Refinar Armas basta adquirir Bk Refine Stone ou Refine Stone",
						"\n Refine Stone e Bk Refine Stone são adquiridos dentro do jogo, ",
						"\n mas também podem ser obtido através de nosso site",
						"\n Site: www.baiak-revol.com\n",
						"\n Max de upgrade das armas / wands (+6).\n Para refinar armas para o nível super voce precida ter o Refine Especial e trocar no NPC: Change Weapon.\n",
						"\n Para Refinar anel e bota precisa dos seguintes Refine Especial.",
						"\n Refine Especial pode ser adquirido em eventos ou no site.",
						"\n Os eventos que dropam os fragmentos são:\n",
						"\n Defend The Tower às 22:10",
						"\n Desert War 23:00",
						"\n Guild Battle 20:00",
						"\n Para trocar os fragmentos basta ir no NPC Refiner Especial localizado no templo\n",
					
					

								"\n                                   Boa Sorte a todos!\n"}))
    end
	return true
	end