local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 200000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if getPlayerStorageValue(cid,_Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid,_Lib_Battle_Info.TeamTwo.storage) >= 1 then
		return doPlayerSendCancel(cid, "Nao pode ficar invisivel aqui!")
	end
	return doCombat(cid, combat, var)
end
