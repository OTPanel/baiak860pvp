function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if item.actionid == GUILD_BATTLE.teleport.actionid then
        if not isInArray(getGuildsRegisteredInBattle(), getPlayerGuildBattleId(cid)) then
            doPlayerSendCancel(cid, "[Guild Battle]: Your guild is not registered to the battle.")
            doTeleportThing(cid, fromPosition, false)
            return true
        end
        if getPlayerLevel(cid) < GUILD_BATTLE.min_level then
            doPlayerSendCancel(cid, "[Guild Battle]: Only players level "..GUILD_BATTLE.min_level.." or higher can participate.")
            doTeleportThing(cid, fromPosition, false)
            return true
        end
        if getMembersInGuildBattle(cid) == GUILD_BATTLE.max_players_per_guild then
            doPlayerSendCancel(cid, "[Guild Battle]: Your guild already reached "..GUILD_BATTLE.max_players_per_guild.." members for the battle.")
            doTeleportThing(cid, fromPosition, false)
            return true
        end
        local guildBattleId, c = getPlayerGuildBattleId(cid), false
        for _, pid in ipairs(getPlayersOnline()) do
            if isPlayerInGuildBattle(pid) then
                if getPlayerGuildBattleId(pid) == guildBattleId then
                    if getPlayerIp(pid) == getPlayerIp(cid) then
                        c = true
                        break
                    end
                end
            end
        end
        if c then
            doPlayerSendCancel(cid, "[Guild Battle]: Your IP has already been detected in the battle.")
            doTeleportThing(cid, fromPosition, false)
            return true
        end 
        doPlayerJoinGuildBattle(cid)
        local destination = GUILD_BATTLE.guilds[guildBattleId].spawn
        doTeleportThing(cid, destination)
        doSendMagicEffect(destination, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You joined in Guild Battle. Wait until event starts. If you go through the teleport, you will be removed from the Guild Battle.")
    elseif item.actionid == GUILD_BATTLE.teleport_exit_actionid then
        if not isGuildBattleRunning() then
            local destination = getTownTemplePosition(getPlayerTown(cid))
            doTeleportThing(cid, destination)
            doSendMagicEffect(destination, CONST_ME_TELEPORT)
            doPlayerRemoveGuildBattle(cid)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You were removed from Guild Battle.")
        else
            doPlayerSendCancel(cid, "[Guild Battle]: You can not leave while battle is running.")
            doTeleportThing(cid, fromPosition, false)
            return true
        end
    end    
    return true
end