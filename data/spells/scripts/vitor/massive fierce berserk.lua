local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

-- Original
--[[function onGetFormulaValues(cid, level, skill, attack, element, factor)
	local levelTotal, formula = level / 5, 0.1606
	local normal, elemental = -(skill * attack * formula + levelTotal), math.ceil((skill * element * formula + levelTotal))
	return normal/2, normal, -math.random(elemental/2, elemental)
end]]

--[[function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack * 1.5, level / 10
	return -(skillTotal * 1 + levelTotal), -(skillTotal * 1.5 + levelTotal)
end]]

function onGetFormulaValues(cid, level, skill, attack, element, factor)
	local levelTotal, formula = level / 5, 0.1106
	local normal, elemental = -(skill * attack * formula + levelTotal), math.ceil((skill * element * formula + levelTotal))
	return normal/2, normal, -math.random(elemental/2, elemental)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid,var)
	--if getPlayerStorageValue(cid,722357) ~= 2 then
		--doPlayerSendCancel(cid,"Você precisa completar a PvP Task para usar essa magia.")
		--return false
	--end
	--doPlayerSetStorageValue(cid, 722360, os.time() + 0.1)
	doSendAnimatedText(getThingPos(cid), "Spell", COLOR_BROWN)
	--return executeSpell(cid,combat,var,"Massive Fierce Berserk",2,722352)
	return doCombat(cid, combat, var)
end
