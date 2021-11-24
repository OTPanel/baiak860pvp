function onSay(cid, words, param, channel)
	if param == '' then
		return doPlayerSendCancel(cid, 'Please, type mute or unmute.')
	end
	
	local tmp = string.explode(param, ',')
	if isInArray({'mute', 'unmute'}, tmp[1]:lower()) then

		local default = 600
		if isCreature(getCreatureByName(tmp[2])) then
			setPlayerStorageValue(getCreatureByName(tmp[2]), 455010, tmp[1]:lower() == 'mute' and os.time() + (tmp[3] ~= nil and tonumber(tmp[3]) or default) or -1)
			doPlayerSendCancel(cid, 'Player ' .. tmp[2] .. ' ' .. (tmp[1]:lower() == 'mute' and 'muted' or 'unmuted') .. '.')
		else
			
			doPlayerSendCancel(cid, 'Player not exists or is off-line.')
		end
	end
	
	return true
end