function onUse(cid, item, fromPosition, itemEx, toPosition)
    local guildId = getPlayerGuildId(cid)
    if guildId == 0 then
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You are only a guest and can not invite players to the castle's hunt area.")
        return true
    end
    if not isInArray({GUILDLEVEL_LEADER, GUILDLEVEL_VICE}, getPlayerGuildLevel(cid)) then
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Only leaders or vices members can invite players to the castle's hunt area.")
        return true
    end
    if guildId ~= getGlobalStorageValue(realCastle.guild_storage) then
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your guild is not currently dominating the castle.")
        return true
    end
    if getPlayerStorageValue(cid, realCastle.storages.inviteInterval) > os.time() then
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You can make invitations again at "..os.date("%d %B %Y %X", getPlayerStorageValue(cid, realCastle.storages.inviteInterval))..".")
        return true
    end
    doSetItemText(item.uid, '')
    local players = getCastleInvitedPlayers(true)
    if #players > 0 then
        local txt = ''
        for i = 1, #players do
            txt = txt .. players[i] .. "\n"
        end
        doSetItemText(item.uid, txt)
    end
end