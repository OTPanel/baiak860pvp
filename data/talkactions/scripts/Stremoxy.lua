local function hasBoss()

	local id = getGlobalStorageValue("bossSys")
	if id ~= -1 then
		if isMonster(id) then
			return true
		else
			return false
		end
	end
	return false
end



local postp, postpentrada = {x = 126, y = 59, z = 7},{x = 62, y = 339, z = 7}



function onSay(cid, words, param, channel)
	if not hasBoss() then
        doCreateTeleport(1387, postpentrada, postp)
		local id = doCreateMonster("Boss Stremoxy", {x = 38, y = 340, z = 7})
		setGlobalStorageValue("bossSys", id)
		doBroadcastMessage("O Boss Stremoxy nasceu! Corram para matar ele -> Teleporte no templo!")
		doPlayerSendTextMessage(cid, 27, "Você executou o comando Stremoxy Manual, o Boss ja foi criado!")
	end
	return true
end