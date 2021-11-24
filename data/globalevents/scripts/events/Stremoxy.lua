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
local days = {"Saturday"}

function onTime()
	if isInArray(days, os.date("%A")) then
	if not hasBoss() then
        doCreateTeleport(1387, postpentrada, postp)
		local id = doCreateMonster("Boss Stremoxy", {x = 38, y = 340, z = 7})
		setGlobalStorageValue("bossSys", id)
		doBroadcastMessage("O Boss Stremoxy nasceu! Corram para matar ele -> Teleporte no templo!")
		end
	end
	return true
end

function onThink(interval, lastExecution)	
	
	if hasBoss() then
	doSendAnimatedText(postp, "Stremoxy", 245)
	doSendMagicEffect(postp, 11)
	end
	return true
end
