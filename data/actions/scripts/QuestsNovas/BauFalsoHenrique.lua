function onUse(cid, item, frompos, item2, topos)
	 if getGlobalStorageValue(722404) > os.time() then
			doPlayerSendCancel(cid, "Voc� n�o pode clicar no bau varias vezes assim!.")
			return true
		end
		
	if isPlayer(cid) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Achou que a quest termina aqui n�? kkkk ande mais um pouco ainda n�o terminou!")
		setGlobalStorageValue(722404, os.time() + 6)
	end
	return true
end 