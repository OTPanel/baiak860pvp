function onSay(cid, words, param, channel)
	local time = getPlayerStorageValue(cid, 455010)
	if channel == 9 and time > os.time() then
		return doPlayerSendCancel(cid, 'You are muted for ' .. (time - os.time()).. ' second' .. ((time - os.time()) > 1 and 's' or '').. ' in this channel.')
	end
	
end