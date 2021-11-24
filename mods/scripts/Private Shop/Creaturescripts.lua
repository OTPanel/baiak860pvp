-- ########################################################
-- #####        Name: ShopOff System             	  #####
-- #####        Version: 2.0                          #####
-- ########################################################
-- #####  Developed by Maxwell Alcantara[MaXwEllDeN]  #####
-- #####  Contact: maxwellmda@gmail.com               #####
-- #####           maxwellden@hotmail.com             #####
-- ########################################################

function onLogin(cid)
	if (getPlayerStorageValue(cid, 75431) > 0) then
		local playerguid = getPlayerGUIDByName(getCreatureName(cid))
		local ddec = 0

		for a, b in pairs(getPlayerShopLucro(playerguid)) do
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You sold ".. b[1] .. "x ".. getItemNameById(a) .. getPrefix(b[1]) ..".")
			if (getPlayerStorageValue(cid, 21147) < 0) then
				setPlayerStorageValue(cid, 21147, 0)
			end

			setPlayerStorageValue(cid, 21147, getPlayerStorageValue(cid, 21147) + b[2])
		end

		if (getPlayerStorageValue(cid, 21147) > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Total Gain: ".. getPlayerStorageValue(cid, 21147) .. " gold coin" .. getPrefix(getPlayerStorageValue(cid, 21147)) .. ".")
			doPlayerAddMoney(cid, getPlayerStorageValue(cid, 21147))
			setPlayerStorageValue(cid, 21147, -1)
		end

		deleteNPCFile(getCreatureName(cid))
		setPlayerShopLucro(playerguid, "{}")
		setPlayerStorageValue(cid, 75431, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "ShopOff disabled.")
	end

	registerCreatureEvent(cid, "PvShopLOGOUT")
	registerCreatureEvent(cid, "PvShopDEATH")
	return true
end


function onLogout(cid)
	if (getPlayerStorageValue(cid, 75431) > 0) then
		addEvent(createNPCShop, 1, getCreatureName(cid), getCreatureOutfit(cid), getPlayerGUIDByName(getCreatureName(cid)), getThingPos(cid), getCreatureLookDir(cid))
	end

	return true
end

local function aol(cid)
	if (getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid) and (getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid == 2173) then
		return true
	end
	return false
end
	
function onPrepareDeath(cid, deathList)

	if (not getPlayerBlessing(cid, 33)) and (not aol(cid)) then
		setPlayerShopItens(getPlayerGUIDByName(getCreatureName(cid)), "{}")
	end
	
	return true
end
