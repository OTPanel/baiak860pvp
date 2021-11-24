function onLogin(cid)
    registerCreatureEvent(cid, "fraglook")
    registerCreatureEvent(cid, "playerFrag")
    return true
end

local vocs = {

    [9] = "Real Sorcerer",
    [10] = "Real Druid",
    [11] = "Real Paladin",
    [12] = "Real Knight"

}

function getDeathsAndKills(cid, type) -- by vodka
    local query,d = db.getResult("SELECT `player_id` FROM "..(tostring(type) == "kill" and "`player_killers`" or "`player_deaths`").." WHERE `player_id` = "..getPlayerGUID(cid)),0
    if (query:getID() ~= -1) then 
        repeat
            d = d+1
        until not query:next()
        query:free()
    end
    return d 
end
 
function onLook(cid, thing, position, lookDistance)
    if isPlayer(thing.uid) then
        if getPlayerAccess(cid) > 3 then return true end
        local artigo = getPlayerSex(thing.uid) == 0 and "Ela" or "Ele"
        local voc = getPlayerStorageValue(thing.uid,722380) > 0 and vocs[getPlayerStorageValue(thing.uid,722380)] or getPlayerVocationName(thing.uid)
        local str = ""
        if getPlayerGuildId(thing.uid) > 0 then
            local nick = getPlayerGuildNick(thing.uid) ~= "" and " ("..getPlayerGuildNick(thing.uid)..")." or "."
            if thing.uid ~= cid then
                str = " "..artigo.." é "..getPlayerGuildRank(thing.uid).." da guild "..getPlayerGuildName(thing.uid)..nick
            else
                str = " Você é "..getPlayerGuildRank(thing.uid).." da guild "..getPlayerGuildName(thing.uid)..nick
            end
        end
        if thing.uid ~= cid then
            doPlayerSendTextMessage(cid,25,"Você vê "..getCreatureName(thing.uid).." (Level "..getPlayerLevel(thing.uid).."). "..artigo.." é "..voc..".\nTem o ping ["..ping.CheckPing(thing.uid).."]."..str.."\n"..artigo.." matou ["..getDeathsAndKills(thing.uid,"kill").."] players e morreu ["..getDeathsAndKills(thing.uid,"death").."] vezes. Sua patente é {"..killua.getPatente(thing.uid).." - "..killua.getKills(thing.uid).." kills}.")
        else
            doPlayerSendTextMessage(cid,25,"Você se vê. Você é "..voc.."."..str.."\nSeu ping é ["..ping.CheckPing(cid).."].\nVocê matou ["..getDeathsAndKills(thing.uid,"kill").."] players e morreu ["..getDeathsAndKills(thing.uid,"death").."] vezes. Sua patente é {"..killua.getPatente(thing.uid).." - "..killua.getKills(thing.uid).." kills}.")
        end
        return false
    end
    return true
end