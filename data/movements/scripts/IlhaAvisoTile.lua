function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, 46937) < 1 then
		setPlayerStorageValue(cid, 46937, 1)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Estes são os melhores SETs do server, não possui e nunca possuirá SETs pagos por points donates, melhores armas e shields você pode obter em quest!")
	end
   return true
end