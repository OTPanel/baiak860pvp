function onSay(cid, words, param)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu level atual de mineração é: "..getPlayerStorageValue(cid, 19333).." ")
return true
end