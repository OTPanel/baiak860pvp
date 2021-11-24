local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition, CONDITION_PARAM_SUBID, 2)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_MANAGAIN, 100)
setConditionParam(condition, CONDITION_PARAM_MANATICKS, 2000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
doPlayerSay(cid, "Energy Up", TALKTYPE_ORANGE_1, cid)
return doCombat(cid, combat, var)
end