local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 52)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 4, 3, 12.7, 15)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid,var)
	--if getPlayerStorageValue(cid,722357) ~= 2 then
		--doPlayerSendCancel(cid,"Você precisa completar a PvP Task para usar essa magia.")
		--return false
	--end
	if isPlayer(cid) then
		if getCreatureStorage(cid, Entrosa.sto) ~= EMPTY_STORAGE then
			doPlayerSendCancel(cid, "Você não pode usar essa magia no Anti-Entrosa.")
			return false
		end
	end
	doSendAnimatedText(getThingPos(cid), "Spell", COLOR_MAYABLUE)
	--return executeSpell(cid,combat,var,"Rage of The Ice",2,722355)
	return doCombat(cid, combat, var)
end
