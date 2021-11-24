local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1497)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false) 

local ret = nil
 
function onCastSpell(cid, var) 
	ret = doCombat(cid, combat, var)
	if ret then
		local mWall = getTileItemById(variantToPosition(var), 1497).uid
		if mWall ~= 0 then
			doItemSetAttribute(mWall, "description", string.format("By: %s.", getCreatureName(cid)))
		end
	end
	return ret
end