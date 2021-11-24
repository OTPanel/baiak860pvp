local config = {
message = "Parabéns, teleport fecha em 1 minuto !",
timeToRemove = 60, -- seconds
teleportId = 1387,
bosses = {
	["Massive Water Elemental"] = { x = 888, y = 1190, z = 6 },
	["Massive Fire Elemental"] = { x = 998, y = 1184, z = 7 },
	["Massive Earth Elemental"] = { x = 1036, y = 1184, z = 7 },
	["Massive Energy Elemental"] = { x = 1070, y = 1184, z = 7 },
	["Magician"] = { x = 459, y = 594, z = 7 },
	}
}
 
local function removal(position)
    if getThingfromPos(position).itemid == config.teleportId then
        doRemoveItem(getThingfromPos(position).uid)
    end
    return TRUE
end
 
function onKill(cid, target)
    local position = getCreaturePosition(target)

    for name, pos in pairs(config.bosses) do
        if name == getCreatureName(target) and isMonster(target) then
            teleport = doCreateTeleport(config.teleportId, pos, position)
            doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
            addEvent(removal, config.timeToRemove * 1000, position)
            doSendMagicEffect(position,10)
        end
    end
   return true
end