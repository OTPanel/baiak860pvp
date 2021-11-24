 function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.uid == 61463 then
        local queststatus = getPlayerStorageValue(cid, 722350)
        if queststatus < 1 then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você upou 2 leveis.")
				doPlayerAddExp(cid, getExperienceForLevel(getPlayerLevel(cid)+2)-(getPlayerExperience(cid)))
                doPlayerSetStorageValue(cid, 722350, 1)
        else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
        end
    end
    return true
end
