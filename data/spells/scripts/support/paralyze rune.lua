local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.7, 90, -0.6, 90)
setCombatCondition(combat, condition)

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_SUBID, 1)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, getConfigValue('paralyzeDelay'))

function onTargetCreature(cid, target)
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
    if isPlayer(target)    then
        doAddCondition(target, exhaust)
    end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end