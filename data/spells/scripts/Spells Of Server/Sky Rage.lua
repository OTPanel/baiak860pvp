local combat = createCombatObject()

local meteor = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7.8, -80, -7.9, 15)
local stun = createConditionObject(CONDITION_PARALYZE)
setConditionParam(stun, CONDITION_PARAM_TICKS, 2000)
setConditionFormula(stun, -0.8, 0, -0.8, 0)

setCombatCondition(meteor, stun)



local arr = {
{0, 0, 0, 0, 0},
{0, 0, 1, 0, 0},
{0, 1, 3, 1, 0},
{0, 0, 1, 0, 0},
{0, 0, 0, 0, 0}
}



local area = createCombatArea(arr)
setCombatArea(combat, area)

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
doSendDistanceShoot(newpos, pos, 3)
addEvent(meteorCast, 200, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x - 9, y = pos.y - 8, z = pos.z}
doSendDistanceShoot(newpos, pos, 3)
addEvent(meteorCast, 100, {cid = cid,pos = pos, combat = meteor})
end
end
end


setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end