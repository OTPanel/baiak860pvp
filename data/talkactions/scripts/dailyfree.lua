local daily = 12314
function onSay(cid)

if getPlayerStorageValue(cid, daily) > os.time() then
doPlayerPopupFYI(cid, "Sistema Daily: O Sistema Daily é um ótimo sistema para \n conseguir os itens de graça no jogo.\n Você precisa esperar \n["..getPlayerStorageValue(cid, daily) - os.time() .." segundos para refazer]")
else
doPlayerPopupFYI(cid,"Sistema Daily: O Sistema Daily é um ótimo sistema para \n conseguir os itens de graça no jogo.\n Você ja pode fazer a daily FREE. Boa sorte!")
end
return 1
end