function onThink(interval)
	checkInvitationsAccepted()
	checkActiveWars()
	return true
end

function onShutdown()
	removeStoragesToShutDown()
	return true
end