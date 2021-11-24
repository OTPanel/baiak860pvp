 function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.uid == 61465 then
        local queststatus = getPlayerStorageValue(cid, 722352)
        if queststatus < 1 then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você upou 4 leveis.")
				doPlayerAddExp(cid, getExperienceForLevel(getPlayerLevel(cid)+2)-(getPlayerExperience(cid)))
                doPlayerSetStorageValue(cid, 722352, 1)
        else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
        end
    end
    return true
end
