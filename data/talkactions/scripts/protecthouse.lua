function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite /protecthouse on para ligar a proteção ou /protecthouse off para desligá-la.")
		return true
	end
	local parame = tostring(param) 
	
	if parame == "on" then
		
		
		local house = getHouseFromPos(getCreaturePosition(cid))
		
		if not house then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não está dentro de nenhuma casa!")
			return true
		end
		if getHouseInfo(house, false).owner ~= getPlayerGUID(cid) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não é o dono desta casa!")
			return true
		end
		if isHouseProtected(house) == true then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A sua casa já está protegida!")
			return true
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você ativou a proteção na sua casa! Agora apenas você poderá mexer nos items!")
		setHouseProtection(house, true)
		
	elseif parame == "off" then
		local house = getHouseFromPos(getCreaturePosition(cid))
		
		if not house then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não está dentro de nenhuma casa!")
			return true
		end
		if getHouseInfo(house, false).owner ~= getPlayerGUID(cid) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não é o dono desta casa!")
			return true
		end
		
		if isHouseProtected(house) == false then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A proteção na sua casa já está desativada!")
			return true
		end
		
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você desativou a proteção na sua casa! Agora qualquer player poderá mover os itens.")
		setHouseProtection(house, false)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite /protecthouse on para ligar a proteção ou /protecthouse off para desligá-la.")
		return true
	end
	
	return true
end
