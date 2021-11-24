function onKill(cid, target, damage, flags)
	if isPlayer(cid) and isPlayer(target) then
		if isHunted(target) then
			if getGlobalStorageValue(getPlayerGUID(target) + 20000) == getPlayerGUID(cid) then
			doPlayerSendTextMessage(cid, 21,"Voc� Matou a pessoa que voc� deu hunted, mais n�o pode ganhar a recompensa.")
				return true
			end

			if getPlayerIp(cid) == getPlayerIp(target) then
				doPlayerSendTextMessage(cid, 21,"Pode matar seu MC quantas vezes quiser mas n�o vai receber o pr�mio do hunted.")
				return true
			end
		
			local bounty = getPlayerBounty(getCreatureName(target))
			local prev_reward = getPlayerStorageValue(cid, bountyReward) > 0 and getPlayerStorageValue(cid, bountyReward) or 0
			local prev_rank = getPlayerStorageValue(cid, bountyRank) > 0 and getPlayerStorageValue(cid, bountyRank) or 0
			doPlayerSetBalance(cid, getPlayerBalance(cid) + (bounty * 1000000))
			setPlayerStorageValue(cid, bountyRank, prev_rank + bounty)
			
			doPlayerClearBounty(getCreatureName(target))
			if bountyConfig.points == false and bountyConfig.omegaPointSystem == false then
				doPlayerSendTextMessage(cid, 21, 'Voc� matou um jogador que estava hunted e recebeu '..bounty..'kk no banco.')
				doBroadcastMessage(getCreatureName(cid).." ("..getPlayerLevel(cid)..") matou "..getCreatureName(target).." ("..getPlayerLevel(target)..") que estava hunted e recebeu ".. bounty .."kk!")
				return true
			end
			local points = doPlayerAddBountyPoints(cid, bounty) 
			doPlayerSendTextMessage(cid, 21, 'You have killed a hunted target and won '..bounty..'gps and '..points..' bounty points. Talk to the Assassin leader to withdraw your money.')
		end
	end
	return true
end