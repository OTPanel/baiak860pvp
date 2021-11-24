function onTime()
	local days = {"Tuesday","Thursday","Saturday"}
	local players = getPlayersOnline()
	local cid = players[math.random(1,#players)]
	
	if isInArray(days, os.date("%A")) then
	if isPlayer(cid) then
		doBroadcastMessage("[Loteria VIP] O jogador "..getCreatureName(cid).." foi sorteado e recebeu a backpack donate!")
		doPlayerAddItem(cid, 12628)
		end
	end
	return true
end
