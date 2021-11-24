local combat = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, 1)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 1)
setCombatParam(combat1, COMBAT_PARAM_CREATEITEM, 2160)


local stun = createConditionObject(CONDITION_PARALYZE)
setConditionParam(stun, CONDITION_PARAM_TICKS, 0)
setConditionFormula(stun, -0.9, 1, -0.9, 1)
setCombatCondition(combat1, stun)

local stun = createConditionObject(CONDITION_PARALYZE)
setConditionParam(stun, CONDITION_PARAM_TICKS, 0)
setConditionFormula(stun, -0.9, 1, -0.9, 1)
setCombatCondition(combat1, stun)

local stun = createConditionObject(CONDITION_PARALYZE)
setConditionParam(stun, CONDITION_PARAM_TICKS, 0)
setConditionFormula(stun, -0.9, 1, -0.9, 1)
setCombatCondition(combat, stun)

local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, 1)
setCombatParam(meteor_water, COMBAT_PARAM_EFFECT, 1)
setCombatFormula(meteor_water, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0)

arr = {
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
}


local combat_area = createCombatArea(arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function stunEffect(cid)
doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
if (math.random(0, 40) == 1) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 1})
if (isInArray(underWater, ground.itemid) == TRUE) then
local newpos = {x = pos.x - 9, y = pos.y - 8, z = pos.z}
doSendDistanceShoot(newpos, pos, 28)
addEvent(meteorCast, 100, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x + 8, y = pos.y - 7, z = pos.z}
doSendDistanceShoot(newpos, pos, 28)
addEvent(meteorCast, 100, {cid = cid,pos = pos, combat = combat1})
setCombatParam(combat1, COMBAT_PARAM_CREATEITEM, 2160)
end
end
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
doCombat(cid, combat, var)
end