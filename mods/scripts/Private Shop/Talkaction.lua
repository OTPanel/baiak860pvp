-- ########################################################
-- #####        Name: ShopOff System             #####
-- #####        Version: 2.0                          #####
-- ########################################################
-- #####  Developed by Maxwell Alcantara[MaXwEllDeN]  #####
-- #####  Contact: maxwellmda@gmail.com               #####
-- #####           maxwellden@hotmail.com             #####
-- ########################################################

local function tabletama(tb)
	local tam = 0

	for i, v in pairs(tb) do
		tam = tam + 1
	end

	return tam
end

local funcs = {"on", "off", "add", "remove", "list", "help"}

function onSay(cid, words, param)	

	local param = param:lower()
	local params = string.explode(param, ",")
	local param = params[1]

	local configs = _PV_SHOP_CONFIG

	if (configs.premmy) and not(isPremium(cid)) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You must have a premium account to use this system.")
	end
	
    if (not getTileInfo(getThingPos(cid)).protection) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You may only use this item in a protection zone.")
        return true
    end

	if (getPlayerLevel(cid) < 8) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You must be at least level " .. configs.level .. " to use this system.")
	end

	if not(isInArray(funcs, param)) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You typed a invalid option, to see help window type ".. words .. " help.")
	end

	if (param == "on") then
		if (getCreatureCondition(cid, CONDITION_INFIGHT)) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You can't activate the system with your pz locked.")
		end

		local pos = getThingPos(cid)
		local pos1 = {x = pos.x-4, y = pos.y-4, z = pos.z}
		local pos2 = {x = pos.x+4, y = pos.y+4, z = pos.z}
		local uids = getUidsInArea(pos1, pos2)

		for _, b in pairs(uids) do
			if (not(isPlayer(b)) and not (isMonster(b))) then
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Leave away from other NPCs and try again.")
			end
		end

		local pikznelis = 0
		for _, a in pairs(getPlayerShopItens(getPlayerGUIDByName(getCreatureName(cid)))) do
			pikznelis = 1
			break
		end

		if (pikznelis == 0) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You must add a item to your shop before ative it.")
		end

		setPlayerStorageValue(cid, 75431, 1)
		addEvent(doRemoveCreature, 1, cid)
	elseif (param == "add") then

		if not(params[4]) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You typed a invalid option, to see help window type ".. words .. " help.")
		end
	
		local item	
		if type(errors) == "function" then
			errors(false)
			item = getItemIdByName(params[2])
			errors(true)
		else
			item = getItemIdByName(params[2], false)
		end
		
		if not (item) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, params[2] .." isn't a valid item.")
		end

		if (tabletama(getPlayerShopItens(getPlayerGUIDByName(getCreatureName(cid)))) >= configs.maxitens) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You can't have more than ".. configs.maxitens.." types of items in your ShopOff.")
		end

		if (isInArray(configs.notadd, item)) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You can't add " .. params[2] .. " to ShopOff.")
		end

		if not(tonumber(params[3])) or (tonumber(params[3]) < 1) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, params[3] .. " isn't a valid quanty.")
		end

		if (getPlayerItemCount(cid, item) < tonumber(params[3])) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You haven't ".. params[3] .." " .. params[2] .."(s).")
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You added with successful ".. params[3] .. " ".. params[2] .."(s) to your ShopOff.")
		doAddItemForPlayerShop(getPlayerGUIDByName(getCreatureName(cid)), item, params[3], params[4])
		doPlayerRemoveItem(cid, item, tonumber(params[3]))
	elseif (param == "list") then
		local itens = getPlayerShopItens(getPlayerGUIDByName(getCreatureName(cid)))
		local msgiteins = "Items in your ShopOff:\n"

		for a, b in pairs(itens) do
			msgiteins = msgiteins .. "\n".. b[1] .. " " .. getItemNameById(a) .. getPrefix(b[1]) .. " - ".. b[2] .. " Gold Coins"
		end

		local msgiteins = msgiteins .. "\nX-X-X-X-X-X-X-X-X-X-X-X-X"
			doPlayerPopupFYI(cid, msgiteins)
	elseif (param == "remove") then
		if not(params[3]) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You typed a invalid option, to see help window type ".. words .. " help.")
		end

		if not(tonumber(params[3])) or (tonumber(params[3]) < 1) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, params[3] .. " isn't a valid quanty.")
		end

		local item = getItemIdByName(params[2])
		if not (item) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, params[2] .." isn't a item.")
		end

		local shopt = getPlayerShopItens(getPlayerGUIDByName(getCreatureName(cid)))
		if not(shopt[item]) or (tonumber(shopt[item][1]) < tonumber(params[3])) then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You haven't ".. params[3] .." " .. params[2] .."(s) in ShopOff.")
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You removed with successful ".. params[3] .. " ".. params[2] .."(s) from your ShopOff.")
		doRemoveItemFromPlayerShop(getPlayerGUIDByName(getCreatureName(cid)), item, params[3])
		doPlayerAddItem(cid, item, tonumber(params[3]))
	elseif (param == "help") then
		local msg = "ShopOff System Help: \n \n * add - é usado para adicionar um item ao seu ShopOff. \n"
		local msg = msg .."			Examplo: " .. words .. " add, item, quantidade, preço por um."
		local msg = msg .."\n" .. words .. " add, demon armor, 1, 60000\n"
		local msg = msg .."\n * remove - é usado para remover um item do seu ShopOff. \n"
		local msg = msg .."			Examplo: " .. words .. " remove, item, quantidade."
		local msg = msg .."\n" .. words .. " remove, demon armor, 5\n"
		local msg = msg .."\n * on - é usado para ligar o seu ShopOff.\n"
		local msg = msg .. "\n * list - é usado para saber quais items estao no seu ShopOff."
		doPlayerPopupFYI(cid, msg)
   end

   return true
end
