
function onChannelRequest(cid, channel, custom)

	if not tonumber(channel) then
		return true
	end

	if tonumber(channel) > 1000 then
	
		if channel == 65534 then
			return false
		end
			
		if not getTileInfo(getCreaturePosition(cid)). protection then
			doPlayerSendCancel(cid, "Você precisa estar em uma protection zone para assistir cast!")
			return false
		end
	
		if getPlayerStorageValue(cid, "broadcast") == 1 then
			doPlayerSendCancel(cid, "Você não pode assistir a outros players enquanto tiver com seu cast ligado!")
			return false
		end
		local name = getPlayerNameByGUID(channel -1000)
		if not getPlayerByName(name) then

			doPlayerSendCancel(cid, "Cast indisponível.")
			return false
		end


		doPlayerSpectate(cid, name)
		return false

	end
return true
end