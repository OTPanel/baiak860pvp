function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storage = 98733
	local nome_quest = "Quest Insane"
	local mensagem = "["..nome_quest.."] O jogador "..getPlayerName(cid).." completou a "..nome_quest.." e recebeu como prêmio 1x Double Exp e 30KK"
	if(getPlayerStorageValue(cid, storage) == 1) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
	else
		doPlayerAddItem(cid, 5957, 1)
		doPlayerAddItem(cid, 9971, 30)
		doBroadcastMessage(mensagem, 22)
		doPlayerSetStorageValue(cid, storage, 1)
	end
	return true
end