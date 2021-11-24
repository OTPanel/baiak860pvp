function onAdvance(cid, skill, oldLevel, newLevel)

local config = {
[100] = {item = 2160, count = 100},
[200] = {item = 2160, count = 150},
[300] = {item = 9971, count = 2},
[350] = {item = 9971, count = 3},
[400] = {item = 9971, count = 4},
[450] = {item = 9971, count = 5},
[500] = {item = 9971, count = 6},
[550] = {item = 9971, count = 7},
[600] = {item = 9971, count = 10},
}

if skill == 8 then
for level, info in pairs(config) do
if newLevel >= level and (getPlayerStorageValue(cid, 30700) == -1 or not (string.find(getPlayerStorageValue(cid, 30700), "'" .. level .. "'"))) then
doPlayerAddItem(cid, info.item, info.count)
local itm = info.item == 2160 and info.count * 10 .. "k" or info.count.."kk" 
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parabéns! Você atingiu o level "..newLevel.." e ganhou "..itm..".")
local sat = getPlayerStorageValue(cid, 30700) == -1 and "Values: '" .. level .. "'" or getPlayerStorageValue(cid, 30700) .. ",'" .. level .. "'" 
setPlayerStorageValue(cid, 30700, sat)
end
end
end

if skill == SKILL__LEVEL then
local maxh = getCreatureMaxHealth(cid)
local maxm = getCreatureMaxMana(cid)
doCreatureAddHealth(cid, maxh)
doCreatureAddMana(cid, maxm)
end

return true
end