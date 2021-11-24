function onSay(cid, words, param, channel)
local ms = ping.CheckPing(cid)
doPlayerSendTextMessage(cid, 22, "ping aproximado --> ["..ms.."].")
return true
end
