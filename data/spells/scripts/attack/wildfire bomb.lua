local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 6)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 3)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1500)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
    if doPlayerRemoveItem(cid, 2300, 1) then
	       return doCombat(cid, combat, var)
    else
        doPlayerSendCancel(cid, "A runa deve estar em sua bp!")
    end
end
