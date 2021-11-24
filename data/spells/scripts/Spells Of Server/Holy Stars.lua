local water = {490, 491, 492, 493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}

local combat = createCombatObject()

local meteor = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 49)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.10, -380, -10.40, -380)

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
local newpos = {x = pos.x - 9, y = pos.y - 8, z = pos.z}
doSendDistanceShoot(newpos, pos, CONST_ME_HOLYAREA)
addEvent(meteorCast, 100, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.z - 9, x = pos.y - 8, z = pos.z}
doSendDistanceShoot(newpos, pos, CONST_ME_HOLYAREA)
addEvent(meteorCast, 100, {cid = cid,pos = pos, combat = meteor})
end
end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end