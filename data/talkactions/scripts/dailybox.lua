function onSay(cid, words, param)

    if param == "" then
        return doPlayerPopupFYI(cid, 
        table.concat({"\nDaily Box Drop:\n",
                    "-1 Dia de Vip\n",
					"-1~3 Premium points\n",
					"-1 Bk Refine Stone\n",
					"-1 Refine Stone\n",
					"-1 Pote de Double Exp\n",				
					"-1 Cave Exclusiva\n",
					"\n Ps: Dropa somente 1 item, tente a sorte!\n",

								"\n#  Bom Jogo  #\n"}))
    end
	return true
	end