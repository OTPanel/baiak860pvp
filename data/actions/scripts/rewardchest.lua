function onUse(cid, item, fromPosition, itemEx, toPosition)
	strikeLoot = math.random(1, 3)
	strikeLootUm = math.random(1, 3)
	strikeLootDois = math.random(1, 3)

	if getPlayerStorageValue(cid, 54195) >= 1 then
		setPlayerStorageValue(cid, 54195, -1)
		doPlayerSendTextMessage(cid, 21, "Você recebeu sua parte no loot do boss Pennis do ADM.")
	elseif getPlayerStorageValue(cid, 54196) >= 1 then
		setPlayerStorageValue(cid, 54196, 0)
		doPlayerSendTextMessage(cid, 21, "Você recebeu sua parte no loot do boss The Boss Striker.")
		-- if strikeLoot == 1 then
			-- doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			-- doPlayerAddItem(cid, 12396, 1)
		-- elseif strikeLoot == 2 then
			-- doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			--doPlayerAddItem(cid, 12575, 1)
		--elseif strikeLoot == 3 then
			--doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			--doPlayerAddItem(cid, 9971, 1)
		--end
		--if strikeLootUm == 1 then
			--doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			--doPlayerAddItem(cid, 12575, 1)
		--elseif strikeLootUm == 2 then
			--doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			--doPlayerAddItem(cid, 9971, 1)
		--elseif strikeLootUm == 3 then
			--doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			--doPlayerAddItem(cid, 9693, 1)
		--end
		--if strikeLootDois == 1 then
			--doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			--doPlayerAddItem(cid, 12396, 2)
		--elseif strikeLootDois == 2 then
			--doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			--doPlayerAddItem(cid, 2346, 1)
		--elseif strikeLootDois == 3 then
			--doSendMagicEffect(fromPosition, CONST_ME_EXPLOSIONHIT)
			--doPlayerAddItem(cid, 9971, 1)
		--end
	elseif getPlayerStorageValue(cid, 54197) >= 1 then
		setPlayerStorageValue(cid, 54197, -1)
		doPlayerSendTextMessage(cid, 21, "Você recebeu sua parte no loot do boss Gerador.")
	elseif getPlayerStorageValue(cid, 54198) >= 1 then
		setPlayerStorageValue(cid, 54198, -1)
		doPlayerSendTextMessage(cid, 21, "Você recebeu sua parte no loot do boss Ferumbras Bk.")
	else
		doPlayerSendTextMessage(cid, 21, "Você não tem nenhum loot disponivel.")
	end

   return true
end