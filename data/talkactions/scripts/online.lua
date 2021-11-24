function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 10)) then
		return false
	end
		doPlayerSendTextMessage(cid, 27, #getPlayersOnline().." Jogadores Online.")
	return true
end
