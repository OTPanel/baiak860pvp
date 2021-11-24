local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 49)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7.7, -85, -7.8, -85)

combat_arr = {
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}

local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)


function onCastSpell(cid, var)

local pos = getThingPos(getCreatureTarget(cid))
local posy = {x = pos.x, y = pos.y - 1, z = pos.z}
local posy2 = {x = pos.x, y = pos.y + 1, z = pos.z}
local posx = {x = pos.x - 1, y = pos.y, z = pos.z}
local posx2 = {x = pos.x + 1, y = pos.y, z = pos.z}

doSendDistanceShoot(getThingPos(cid), posy, 18)
doSendDistanceShoot(getThingPos(cid), posy2, 18)
doSendDistanceShoot(getThingPos(cid), posx, 18)
doSendDistanceShoot(getThingPos(cid), posx2, 18)

return doCombat(cid, combat, var)
end