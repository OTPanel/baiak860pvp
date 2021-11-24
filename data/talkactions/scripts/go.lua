---- Script By Daian ----
local config = {
exhaustionInSeconds = 30,
storage = 34534
}

function onSay(cid, words, param)
if(exhaustion.check(cid, config.storage) == TRUE) then
doPlayerSendCancel(cid, "Voçê só pode alterar o Outfit da guild a cada " .. config.exhaustionInSeconds .. " segundos.")
return TRUE
end

local playerGuild = getPlayerGuildId(cid)
if(playerGuild == FALSE) then
doPlayerSendCancel(cid, "Desculpe, mais voçê não tem guild.")
return TRUE
end

local playerGuildLevel = getPlayerGuildLevel(cid)
if(playerGuildLevel < GUILDLEVEL_LEADER) then
doPlayerSendCancel(cid, "Voçê tem que ser Lider de uma guild para executar este comando!")
return TRUE
end

local players = getPlayersOnline()
local outfit = getCreatureOutfit(cid)
local message = "*Guild* Seu Outfit foi mudado pelo lider da guild. (" .. getCreatureName(cid) .. ")"
local members = 0
local tmp = {}
for i, tid in ipairs(players) do
if(getPlayerGuildId(tid) == playerGuild and cid ~= tid) then
tmp = outfit
if(canPlayerWearOutfit(tid, outfit.lookType, outfit.lookAddons) ~= TRUE) then
local tidOutfit = getCreatureOutfit(tid)
tmp.lookType = tidOutfit.lookType
tmp.lookAddons = tidOutfit.lookAddons
end

doSendMagicEffect(getCreaturePosition(tid), 66)
doCreatureChangeOutfit(tid, tmp)
doPlayerSendTextMessage(tid, MESSAGE_INFO_DESCR, message)
members = members + 1
end
end

exhaustion.set(cid, config.storage, config.exhaustionInSeconds)
doPlayerSendCancel(cid, "Outfit da guild foi mudado com sucesso. (Total de Mudanças: " .. members .. ")")
return TRUE
end