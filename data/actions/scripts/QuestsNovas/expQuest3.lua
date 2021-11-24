 function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.uid == 61468 then
        local queststatus = getPlayerStorageValue(cid, 722353)
        if queststatus < 1 then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você upou 4 leveis.")
				doPlayerAddExp(cid, getExperienceForLevel(getPlayerLevel(cid)+4)-(getPlayerExperience(cid)))
                doPlayerSetStorageValue(cid, 722353, 1)
        else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
        end
    end
    return true
end
