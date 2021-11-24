local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 40, 40, 35, 40)

function onCastSpell(cid, var)
	if getCreatureCondition(cid, CONDITION_PARALYZE) then
		doRemoveCondition(cid, CONDITION_PARALYZE)
	end
	return doCombat(cid, combat, var)
end