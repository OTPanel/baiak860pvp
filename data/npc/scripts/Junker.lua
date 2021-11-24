local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local npcTopic, factionId = {}, {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function getItemsFromTable(items)
local str = ''
if table.maxn(items) > 0 then
for i = 1, table.maxn(items) do
str = str .. items[i].count .. ' ' .. (items[i].count == 1 and getItemNameById(items[i].id) or getItemPluralNameById(items[i].id))
if i ~= table.maxn(items) then str = str .. ', ' end end end
return str
end

function creatureSayCallback(cid, type, msg)
    local talkUser, msg = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid, string.lower(msg)
    if(not npcHandler:isFocused(cid)) then
        if isInArray({"hi", "hello"}, msg) then
            npcHandler:addFocus(cid)
            if getPlayerLevel(cid) >= FACTION_SYS.minLevel then
                if getPlayerFaction(cid) == -1 then
                    npcHandler:say("Hi, "..getPlayerName(cid)..". I really see a lot of potential in you. However, just like everything in life, you have to choose between one of two sides: {Pk} or {Hero}.", cid)
                    npcTopic[talkUser] = 1
                else
                    npcHandler:say("Hi, "..getPlayerName(cid)..". Feel free to do {tasks} for me, dear "..getPlayerFactionName(cid)..".", cid)
                    npcTopic[talkUser] = 3
                end
            else
                npcHandler:say("Hi, "..getPlayerName(cid)..". Sorry, but I am interested only in players with level "..FACTION_SYS.minLevel.." or higher.", cid)
                npcTopic[talkUser] = 0
            end
        else
            return false
        end
    elseif msgcontains(msg, "pk") and npcTopic[talkUser] == 1 then
        factionId[cid] = 1
        npcHandler:say("A PK! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!", cid)
        npcTopic[talkUser] = 2
    elseif msgcontains(msg, "hero") and npcTopic[talkUser] == 1 then
        factionId[cid] = 2
        npcHandler:say("A HERO! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!", cid)
        npcTopic[talkUser] = 2
    elseif msgcontains(msg, "yes") and npcTopic[talkUser] == 2 then
        setPlayerStorageValue(cid, FACTION_SYS.storages.faction, factionId[cid])
        doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYAREA)
        npcHandler:say("SO BE IT! Feel free to do {tasks} for me and receive rewards.", cid)
        npcTopic[talkUser] = 3
    elseif msgcontains(msg, "no") and npcTopic[talkUser] == 2 then
        npcHandler:say("I understand. Come back when you are ready.", cid)
        npcTopic[talkUser] = 0
    elseif msgcontains(msg, "tasks") and npcTopic[talkUser] == 3 then
        if getPlayerFactionTask(cid) == -1 then
            local first = FACTION_SYS.tasks[1]
            local levelinfo = first.rewards.level > 0 and (" and "..first.rewards.level.." level"..(first.rewards.level > 1 and "s" or "")) or ""
            npcHandler:say("To start, I need you to kill {"..first.kills.."} "..getPlayerFactionEnemyName(cid, (first.kills > 1)):lower()..". I will give you "..getItemsFromTable(first.rewards.items)..""..levelinfo..". Come back when the job is finished, dear "..getPlayerFactionName(cid)..".", cid)
            setPlayerStorageValue(cid, FACTION_SYS.storages.current, 1) 
            npcTopic[talkUser] = 0
        elseif getPlayerFactionTask(cid) > #FACTION_SYS.tasks then
            npcHandler:say("Dear "..getPlayerFactionName(cid)..", you already did all tasks, I have nothing for you to do anymore, good job though.", cid)
            npcTopic[talkUser] = 0
        else
            npcHandler:say("Did you kill "..FACTION_SYS.tasks[getPlayerFactionTask(cid)].kills.." "..getPlayerFactionEnemyName(cid, true):lower().."?", cid)
            npcTopic[talkUser] = 4
        end
    elseif msgcontains(msg, "yes") and npcTopic[talkUser] == 4 then
        local x = FACTION_SYS.tasks
        local playerTask = x[getPlayerFactionTask(cid)]
        local checkKills = getPlayerFactionKills(cid) - playerTask.kills
        if checkKills >= 0 then
            setPlayerStorageValue(cid, FACTION_SYS.storages.kills, checkKills)
            doPlayerAddLevel(cid, playerTask.rewards.level)
            for k = 1, #playerTask.rewards.items do
                local item = playerTask.rewards.items[k]
                if not isItemStackable(item.id) then
                    doPlayerAddItem(cid, item.id, item.count)
                else
                    for j = 1, item.count do
                        doPlayerAddItem(cid, item.id, 1)
                    end
                end
            end
            setPlayerStorageValue(cid, FACTION_SYS.storages.current, getPlayerFactionTask(cid) + 1)
            local xplayer = x[getPlayerFactionTask(cid)]
            npcHandler:say("Good job, "..getPlayerFactionName(cid).."! You are really demonstrating your value. Take your reward as I promised.", cid)
            if getPlayerFactionTask(cid) > #x then
                npcHandler:say("Dear "..getPlayerFactionName(cid)..", you already did all tasks, I have nothing for you to do anymore, good job though.", cid)
            elseif getPlayerFactionTask(cid) == #x then
                local levelinfo = xplayer.rewards.level > 0 and (" and "..xplayer.rewards.level.." level"..(xplayer.rewards.level > 1 and "s" or "")) or ""
                npcHandler:say("I have one last task for you. You need to kill "..xplayer.kills.." "..getPlayerFactionEnemyName(cid, true)..". I will give you "..getItemsFromTable(xplayer.rewards.items)..""..levelinfo..". I'll wait right here.", cid)
            else
                local levelinfo = xplayer.rewards.level > 0 and (" and "..xplayer.rewards.level.." level"..(xplayer.rewards.level > 1 and "s" or "")) or ""
                npcHandler:say("For the next task, kill {"..xplayer.kills.."} "..getPlayerFactionEnemyName(cid, (xplayer.kills > 1))..". I will give you "..getItemsFromTable(xplayer.rewards.items)..""..levelinfo..".", cid)
            end
            npcTopic[talkUser] = 0
        else
            local left = - checkKills
            npcHandler:say("You didn't kill them all, you still need to kill "..left.." "..getPlayerFactionEnemyName(cid, (left > 1))..".", cid)
            npcTopic[talkUser] = 0
        end
    elseif msgcontains(msg, "no") and npcTopic[talkUser] == 4 then
            npcHandler:say("Ok, come back when you finished the job.", cid)
            npcTopic[talkUser] = 0    
    elseif msgcontains(msg, "bye") then
        npcHandler:say("Bye.", cid)
        npcHandler:releaseFocus(cid)
    else
        npcHandler:say("What?! I cannot understand what you mean...", cid)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye.") 