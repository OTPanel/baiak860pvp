function onSay(cid, words, param, channel) 
 setGlobalStorageValue(GUILD_BATTLE.storages.registration, 1)
        local GBtp = doCreateItem(GUILD_BATTLE.teleport.id, 1, GUILD_BATTLE.teleport.createPosition)
        doItemSetAttribute(GBtp, "aid", GUILD_BATTLE.teleport.actionid)
        doBroadcastMessage("[Guild Battle]: Event starting in "..getStrTime(GUILD_BATTLE.time_to_start).."! The teleport was opened. Register your guild to the battle!", MESSAGE_EVENT_ADVANCE)
        doGuildBattleWallsCountdown(mathtime(GUILD_BATTLE.time_to_start))
        addEvent(function()
            setGlobalStorageValue(GUILD_BATTLE.storages.registration, -1)
            setGlobalStorageValue(GUILD_BATTLE.storages.running, 1) 
            doGuildBattleWallsAction("open")
            doGuildBattleSendMsg("[Guild Battle]: Battle starts now! Brace yourself!", MESSAGE_INFO_DESCR)
            local tp = getTileItemById(GUILD_BATTLE.teleport.createPosition, GUILD_BATTLE.teleport.id)
            if tp.uid > 0 then
                doRemoveItem(tp.uid)
                doSendMagicEffect(GUILD_BATTLE.teleport.createPosition, CONST_ME_POFF)
            end
        end, mathtime(GUILD_BATTLE.time_to_start) * 1000)
        addEvent(getGuildBattleWinner,(mathtime(GUILD_BATTLE.time_to_start) + mathtime(GUILD_BATTLE.battle_duration)) * 1000)
		return true
    end