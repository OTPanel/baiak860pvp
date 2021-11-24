local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

local condition3 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition3, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition3, CONDITION_PARAM_SUBID, 3)
setConditionParam(condition3, CONDITION_PARAM_TICKS, 10 * 80 * 1000)
setConditionParam(condition3, CONDITION_PARAM_STAT_MAXHEALTHPERCENT, 140)
setCombatCondition(combat, condition3)


function onCastSpell(cid, var)
doCreatureSay(cid, "Master Heap Up" ,20)
return doCombat(cid, combat, var)
end