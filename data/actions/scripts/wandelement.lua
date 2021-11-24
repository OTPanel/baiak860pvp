function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 26730) >= 0 then
		if (itemEx.itemid == 7508) or (itemEx.itemid == 7509) or (itemEx.itemid == 7510) or (itemEx.itemid == 7511) then
			doCreatureSetStorage(cid, 101010, 1)
			doCreatureSetStorage(cid, 101011, os.time())
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua Bk Staff agora possui o dano de gelo!")
		elseif (itemEx.itemid == 7504) or (itemEx.itemid == 7505) or (itemEx.itemid == 7506) or (itemEx.itemid == 7507) then
			doCreatureSetStorage(cid, 101010, 2)
			doCreatureSetStorage(cid, 101011, os.time())
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua Bk Staff agora possui o dano de fogo!")
		elseif (itemEx.itemid == 7516) or (itemEx.itemid == 7517) or (itemEx.itemid == 7518) or (itemEx.itemid == 7519) then
			doCreatureSetStorage(cid, 101010, 3)
			doCreatureSetStorage(cid, 101011, os.time())
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua Bk Staff agora possui o dano de terra!")
		elseif (itemEx.itemid == 7512) or (itemEx.itemid == 7513) or (itemEx.itemid == 7514) or (itemEx.itemid == 7515) then
			doCreatureSetStorage(cid, 101010, 4)
			doCreatureSetStorage(cid, 101011, os.time())
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua Bk Staff agora possui o dano de energia!")
		elseif (itemEx.itemid == 1561) then
			doCreatureSetStorage(cid, 101010, 5)
			doCreatureSetStorage(cid, 101011, os.time())
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua Bk Staff agora possui o dano de holly!")
		elseif (itemEx.itemid == 3900) then
			doCreatureSetStorage(cid, 101010, 6)
			doCreatureSetStorage(cid, 101011, os.time())
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua Bk Staff agora possui o dano de morte!")
		end
        else
                doPlayerSendTextMessage(cid, 25, "Você não possui o encanto de trocar elementos.")
        end
    return true
end