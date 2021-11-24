function onStatsChange(cid, attacker, type, combat, value, target)
	if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isPlayer(attacker) then
		if (getPlayerStorageValue(attacker, 48904)*1) >= math.random (0,1000) then
			dano = math.ceil(value*(0.5)) -- aqui o multiplicador de dano
			doTargetCombatHealth(attacker, cid, combat, -dano, -dano, 20) -- aqui é o valor que vai dar a mais de dano. no caso esta 20
			doSendAnimatedText(getCreaturePos(attacker), "Critical!", 100)
		end
	end
	return true
end