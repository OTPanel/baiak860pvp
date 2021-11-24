function onUse(cid, item, frompos, item2, topos)
	if getCreatureStorage(cid,722640) == -1 then
		doCreatureSetStorage(cid,722640,1)
		startSpiritualAura(cid)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu a aura espiritual e agora vai dar 10% mais dodge.")
	else
		doPlayerSendCancel(cid, "Você já tem a aura espiritual!")
	end
	return true
end
