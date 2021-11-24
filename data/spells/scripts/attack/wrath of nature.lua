local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 4, 5, 9)

local area = createCombatArea(AREA_CROSS6X6)
setCombatArea(combat, area)

function onCastSpell(cid, var)
local pos_player = getCreaturePosition(cid)

	if pos_player.x >= 2189 and pos_player.x <= 2282 then
		if pos_player.y >= 522 and pos_player.y <= 614 then
			doPlayerSendCancel(cid, "Você não pode usar esta magia no castelo!")
			return false
		end
	end
	

	if getPlayerStorageValue(cid, WarConfigs.WarUEDisabled) == 1 then
		doPlayerSendCancel(cid, "Spell blocked for war administrator.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return false
	else
		return doCombat(cid, combat, var)
	end
end
