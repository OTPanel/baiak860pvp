--[[ script By Subwat Reparar soft e firewalker!]]-- 

function onSay(cid, words, param) 
	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

local config = {
price = 100000,
new_soft = 6132, -- id da nova soft boots
worn_soft = 10021, -- id da velha soft boots
new_firewalker = 9933, -- id da firewalker boots
worn_firewalker = 10022, -- id da velha firewalker boots
needPremium = true -- se precisa ser premium (true or false)
}

if (config.needPremium == true) and (not isPremium(cid)) then
doPlayerSendTextMessage(cid, 23, "desculpe apenas Premium players podem recarregar Suas Botas.")
return TRUE
end

if param == "soft" then
if getPlayerItemCount(cid, config.worn_soft) >= 1 then
if doPlayerRemoveMoney(cid,config.price) == TRUE then
doPlayerRemoveItem(cid,config.worn_soft,1)
doPlayerAddItem(cid,config.new_soft, 1) 
end
end
return TRUE 
end

if param == "firewalker" then
if getPlayerItemCount(cid, config.worn_firewalker) >= 1 then
if doPlayerRemoveMoney(cid,config.price) == TRUE then
doPlayerRemoveItem(cid,config.worn_firewalker,1)
doPlayerAddItem(cid,config.new_firewalker, 1) 
end
end
return TRUE 
end
end