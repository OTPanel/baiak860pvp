local combat = createCombatObject()
local combat2 = createCombatObject()
local combat1 = createCombatObject()

setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 49)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -7.3, -200, -7.5, -200)

local stun = createConditionObject(CONDITION_PARALYZE)
setConditionParam(stun, CONDITION_PARAM_TICKS, 1000)
setConditionFormula(stun, -0.0, 0, -0.0, 0)
setCombatCondition(combat1, stun)

local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatFormula(meteor_water, COMBAT_FORMULA_LEVELMAGIC, -9.3, -200, -9.5, -200)
arr = {
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 2, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0}
}
local combat_area = createCombatArea(arr)
setCombatArea(combat, combat_area)
local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end
local function stunEffect(cid)
doSendMagicEffect(getThingPos(cid), 0)
end
function onTargetTile(cid, pos)
if (math.random(0, 0) == 0) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 1})
if (isInArray(underWater, ground.itemid) == TRUE) then
local newpos = {x = pos.x + 9, y = pos.y + 8, z = pos.z}
addEvent(meteorCast, 100, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x + 9, y = pos.y + 8, z = pos.z}
addEvent(meteorCast, 100, {cid = cid,pos = pos, combat = combat2})
end
end
end

function onTargetTile2(cid, pos)
if (math.random(0, 3) == 1) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 1})
if (isInArray(underWater, ground.itemid) == TRUE) then
local newpos = {x = pos.x + 9, y = pos.y + 8, z = pos.z}
addEvent(meteorCast, 100, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x + 9, y = pos.y + 8, z = pos.z}
addEvent(meteorCast, 100, {cid = cid,pos = pos, combat = combat1})
end
end
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(combat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end