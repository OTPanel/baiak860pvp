-- Prevent spamm commands --
function checkExhausted(cid, storage, seconds)
	local v = exhaustion.get(cid, storage)
	if(not v) then
		exhaustion.set(cid, storage, seconds)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Waiting " .. v .. " second".. (v > 1 and "s" or "") .." for use command again.")
		return false
	end
	return true
end
