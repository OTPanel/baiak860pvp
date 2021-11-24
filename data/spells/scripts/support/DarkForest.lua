local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)
function onGetFormulaValues(cid, level, maglevel)
min = -(level * 2 + maglevel * 3) * 2.5
max = -(level * 2 + maglevel * 3) * 2.7
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end


