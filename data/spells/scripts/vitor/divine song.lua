local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SOUND_YELLOW)
--setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 1, 1, 24, 28)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack * 2, level / 7
	return -(skillTotal * 3.2 + levelTotal), -(skillTotal * 3 + levelTotal)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid,var)
	--if getPlayerStorageValue(cid,722357) ~= 2 then
		--doPlayerSendCancel(cid,"Você precisa completar a PvP Task para usar essa magia.")
		--return false
	--end
	doSendAnimatedText(getThingPos(cid), "Spell", COLOR_DARKYELLOW)
	--return executeSpell(cid,combat,var,"Divine Song",2,722354)
	return doCombat(cid, combat, var)
end
