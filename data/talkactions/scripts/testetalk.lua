function onSay(cid, words, param, channel)
    if param == "1" then
        doPlayerSendCancel(cid, "ok")
        return false
    elseif param == "2" then
        doPlayerSendCancel(cid, "Ok")
        return true
    end
end