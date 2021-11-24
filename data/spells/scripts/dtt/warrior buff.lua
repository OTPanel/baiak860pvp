local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXEPERCENT, 130)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUBPERCENT, 130)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORDPERCENT, 130)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	local statsBuff = getPlayerStorageValue(cid, dtt.storage.buffvoc4)
	if (statsBuff <= 0) then return false end
	return doCombat(cid, combat, var)
end
