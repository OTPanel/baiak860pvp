local water = {490, 491, 492, 493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}

local combat = createCombatObject()

local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -7.5, -80, -7.7, 15)

local stun = createConditionObject(CONDITION_PARALYZE)
setConditionParam(stun, CONDITION_PARAM_TICKS, 2000)
setConditionFormula(stun, -0.8, 1, -0.8, 1)
setCombatCondition(meteor, stun)

local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(meteor_water, COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
setCombatFormula(meteor_water, COMBAT_FORMULA_LEVELMAGIC, -8.30, -300, -8.40, -300)

combat_arr = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function stunEffect(cid)
doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
if (math.random(0, 0) == 0) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 1})
if (isInArray(underWater, ground.itemid) == TRUE) then
local newpos = {x = pos.x + 9, y = pos.y - 8, z = pos.z}
doSendDistanceShoot(newpos, pos, 28)
addEvent(meteorCast, 100, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x + 9, y = pos.y - 8, z = pos.z}
doSendDistanceShoot(newpos, pos, 28)
addEvent(meteorCast, 100, {cid = cid,pos = pos, combat = meteor})
end
end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end