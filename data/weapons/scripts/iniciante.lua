local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 43)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 36)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -140, 0, -250)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end