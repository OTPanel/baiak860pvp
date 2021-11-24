function onSay(cid, words, param, channel)
        hour = tonumber(os.date('%H'))
        if hour >= 7 and hour < 8 then
		extraPlayers = 18
	elseif hour >= 8 and hour < 9 then
		extraPlayers = 24
        elseif hour >= 9 and hour < 10 then
		extraPlayers = 29
        elseif hour >= 10 and hour < 12 then
		extraPlayers = 36
        elseif hour >= 12 and hour < 13 then
		extraPlayers = 41
        elseif hour >= 13 and hour < 15 then
		extraPlayers = 47
        elseif hour >= 15 and hour < 17 then
		extraPlayers = 55
        elseif hour >= 17 and hour < 19 then
		extraPlayers = 59
        elseif hour >= 19 and hour < 21 then
		extraPlayers = 63
	elseif hour >= 21 and hour < 22 then
		extraPlayers = 68
	elseif hour >= 22 and hour < 23 then
		extraPlayers = 60
        elseif hour >= 23 and hour < 0 then
		extraPlayers = 52
        elseif hour >= 0 and hour < 2 then
		extraPlayers = 47
        elseif hour >= 2 and hour < 3 then
		extraPlayers = 38
        elseif hour >= 3 and hour < 4 then
		extraPlayers = 29
        elseif hour >= 4 and hour < 5 then
		extraPlayers = 21
        elseif hour >= 5 and hour < 7 then
		extraPlayers = 14
        end
	if(not checkExhausted(cid, 666, 10)) then
		return false
	end

	local strings, i, position, added, showGamemasters = {""}, 1, 1, false, getBooleanFromString(getConfigValue('displayGamemastersWithOnlineCommand'))
	for _, pid in ipairs(getPlayersOnline()) do

		if((showGamemasters or getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES) or not getPlayerCustomFlagValue(pid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES)) and (not isPlayerGhost(pid) or getPlayerGhostAccess(cid) >= getPlayerGhostAccess(pid))) then
			i = i + 1
		end
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, (i + extraPlayers - 1) .. " player" .. (i > 1 and "s" or "") .. " online!")
	for i, str in ipairs(strings) do
		if(str:sub(str:len()) ~= "") then
			str = str .. ""
		end
	end

	return true
end