local nme = "Sell Points"

local getPlayerPoints = function(cid)
	local accid, points = getPlayerAccountId(cid), 0
	local query = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `id` = '"..accid.."'")
	if query:getID() ~= -1 then
		points = query:getDataInt("premium_points")
		query:free()
	end
	return tonumber(points)
end

local query = db.query or db.executeQuery
		

function onSay(cid, words, param)

	if param == "" then
		return doPlayerSendCancel(cid, "[Sell Points System] Escolha uma quantidade de points.")
	end
	
	if tonumber(param) and tonumber(param) >= 1 and (tonumber(param) % 1) == 0 then
		if getPlayerPoints(cid) >= tonumber(param) then
			if canPlayerReceiveItem(cid, 7702, 1) then
				local papel = doCreateItemEx(7702)
				doItemSetAttribute(papel, "pontos", tonumber(param))
				doItemSetAttribute(papel, "seller", tonumber(getPlayerAccountId(cid)))
				doItemSetAttribute(papel, "description", "[Sell Points System] Este documento vale "..param.." points para você usar no site.")
				doPlayerAddItemEx(cid, papel)
				query("UPDATE `accounts` SET `premium_points` = `premium_points` - '"..tonumber(param).."' WHERE `id` = '"..getPlayerAccountId(cid).."'")
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Sell Points System] Você transferiu "..param.." points para este documento.")
				doSendMagicEffect(getThingPos(cid), CONST_ME_FIREWORK_YELLOW)
			else
				doPlayerSendCancel(cid, "[Sell Points System] Você não tem espaço para o documento, libere um slot na sua backpack.")
			end
		else
			doPlayerSendCancel(cid, "[Sell Points System] Desculpe, os points não foram encontrados.")
		end
	else
		doPlayerSendCancel(cid, "[Sell Points System] Escolha a quantidade de points que você quer transferir ao documento.")
	end
	return true
end
