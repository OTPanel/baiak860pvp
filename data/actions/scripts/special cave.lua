local function filtrateString(str)
	if type(str) ~= "string" then
		return false
	end
	local first, last = 0, 0
	local second, final = 0, #str
	for i = 1, #str do
		if string.byte(str:sub(i,i)) == string.byte('a') then
			first = i + 2
			for t = first, #str do
				if string.byte(str:sub(t,t)) == string.byte(' ') then
					last = t - 1
					break
				end
			end
		end
		if string.byte(str:sub(i,i)) == string.byte('b') then
			second = i + 2
		end
	end
	return {str:sub(first, last), str:sub(second, final)}
end


function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerLevel(cid) > 500 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas level 500 inferior pode entrar na cave exclusiva")
	return false
	end
    	if tonumber(filtrateString(getGlobalStorageValue(922081))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922081, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 1 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922082))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922082, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 2 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922083))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922083, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 3 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922084))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922084, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 4 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922085))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922085, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 5 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922086))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922086, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 6 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922087))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922087, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 7 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922088))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922088, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 8 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922089))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922089, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 9 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922090))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922090, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 10 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922091))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922091, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 11 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922092))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922092, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 12 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922093))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922093, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 13 you can stary for 6 hours.")
	elseif tonumber(filtrateString(getGlobalStorageValue(922098))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(922098, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 6))
		doPlayerSendTextMessage(cid, 25, "You are owner of cave 14 you can stary for 6 hours.")
	else
		doPlayerSendCancel(cid, "Todas as caves já estão com dono no momento. Tente mais tarde.")
	end
	
	return true
end