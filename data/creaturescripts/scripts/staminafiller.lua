local stamina_stor = 19387
local tempo = 20 * 60
local minutes = 5

local bosses = {
    ["Wars Trainer"] = {},
    ["Treinner"] = {}
	
}

function onAttack(cid, target)
	local bid = bosses[getCreatureName(target)]
	if isMonster(target) and bid then
		local number = tonumber(getPlayerStorageValue(cid, stamina_stor))
		if not number then
			doPlayerSetStorageValue(cid, stamina_stor, 0)
		else
        	doPlayerSetStorageValue(cid, stamina_stor, getPlayerStorageValue(cid, stamina_stor)+1)
		end
		if getPlayerStorageValue(cid, stamina_stor) >= tempo then
			doPlayerAddStamina(cid, minutes)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua stamina está subindo...")
			doPlayerSetStorageValue(cid, stamina_stor, 0)
		end
    	end
   return true
end