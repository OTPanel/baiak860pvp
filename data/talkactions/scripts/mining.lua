function onSay(cid, words, param)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu level atual de minera��o �: "..getPlayerStorageValue(cid, 19333).." ")
return true
end