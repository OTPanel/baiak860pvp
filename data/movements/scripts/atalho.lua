function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
storage_guild = getGlobalStorageValue(123123)

	    if getPlayerGuildId(cid) == storage_guild then
                doCreatureSay(cid, "[Castle] Seja Bem vindo!", TALKTYPE_ORANGE_1)
		doTeleportThing(cid,position)
	else
		doTeleportThing(cid,lastPosition)
                doCreatureSay(cid, "[Castle] Sua guild nao e dona do Castelo!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getPlayerPosition(cid),3)
	end
	return true
end