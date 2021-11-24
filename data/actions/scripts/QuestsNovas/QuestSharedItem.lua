function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storage = 54784
	local nome_quest = "Quest Acesso Shared"
	local mensagem = "["..nome_quest.."] O jogador "..getPlayerName(cid).." completou a "..nome_quest.." e recebeu como prêmio o item Acesso Shared!"
	if(getPlayerStorageValue(cid, storage) == 1) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já fez essa quest.")
	else
		doPlayerAddItem(cid, 9020, 1)
		doBroadcastMessage(mensagem, 22)
		doPlayerSetStorageValue(cid, storage, 1)
	end
	return true
end