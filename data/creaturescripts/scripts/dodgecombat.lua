local storagedodge = 98798644 -- storage do dodge
local cor = 250 -- cor do texto
local effect = 31 -- id do magic effect 
local msg = "Esquivou." -- msg
 
 local dodge = { 
    {min = 1, max = 10, chance = 4}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 11, max = 20, chance = 5}, -- vocês pode adicionar mas se quiserem
    {min = 21, max = 40, chance = 6},    --- quando chance estriver = 1 equivale a 10%, quando estiver 0.5 = 5 % e etc..
    {min = 41, max = 50, chance = 7},
    {min = 51, max = 70, chance = 8},
    {min = 71, max = 90, chance = 9},
    {min = 91, max = 100, chance = 12},
}
 
function onStatsChange(cid, attacker, type, combat, value)
    if not isPlayer(cid) then
        return false
    end
    if combat == COMBAT_HEALING then return true end
    local sto_doge = tonumber(getPlayerStorageValue(cid, storagedodge))
    if sto_doge and sto_doge >= 1 then
        if getCreatureStorage(cid,722640) == 1 then
            sto_doge = tonumber(sto_doge + 10)
        end
        local chance = (sto_doge/6) >= 1 and math.ceil(sto_doge / 6) or 1
        local random = math.random(100)
        if random <= chance then
            local cid_pos = getCreaturePosition(cid)
            doSendMagicEffect(cid_pos, effect)
            doSendAnimatedText(cid_pos, msg, cor)
            return false
        end
    end

    if getCreatureStorage(cid, 722640) == 1 then
        value = value - (value * 0.03)
        return true
    end
    --[[for _, tudo in pairs(dodge) do
        if sto_doge and sto_doge >= tudo.min and sto_doge < tudo.max then
            local chancex = math.random(1, 100)
            if chancex <= tudo.chance then
                doSendMagicEffect(getCreaturePosition(cid), effect)
                doSendAnimatedText(getCreaturePosition(cid), msg, cor)
                return false
            end
        end
    end]]
    return true
end
