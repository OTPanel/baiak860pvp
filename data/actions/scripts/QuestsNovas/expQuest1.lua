 function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.uid == 61464 then
        local queststatus = getPlayerStorageValue(cid, 722351)
        if queststatus < 1 then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você upou 3 leveis.")
				doPlayerAddExp(cid, getExperienceForLevel(getPlayerLevel(cid)+3)-(getPlayerExperience(cid)))
                doPlayerSetStorageValue(cid, 722351, 1)
        else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
        end
    end
    return true
end
