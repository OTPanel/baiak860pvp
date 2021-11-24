local conditionGreen = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionGreen, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionGreen, {lookType = 129, lookHead = 82, lookBody = 82, lookLegs = 82, lookFeet = 82})

local function teste(cid)
doAddCondition(cid, conditionGreen)
end


function onUse(cid, item)
local player = CTF.getFirstPlayer()
teste(player)
addEvent(doRemoveCondition, 10000, player, CONDITION_OUTFIT)
return true
end