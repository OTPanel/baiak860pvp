local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)

setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)




local condition = createConditionObject(CONDITION_ATTRIBUTES)

setConditionParam(condition, CONDITION_PARAM_TICKS, 5 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 150)

setConditionParam(condition, CONDITION_PARAM_BUFF, true)

setCombatCondition(combat, condition)






function onCastSpell(cid, var)
doCreatureSay(cid, "Mastery Archer" ,19)
	return doCombat(cid, combat, var)
end
