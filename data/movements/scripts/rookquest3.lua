function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
	kickPos = fromPosition, kickEffect = CONST_ME_POFF,
	kickMsg = "Voce não tem permissão para entrar na sala, pegue a permissão no meio do deserto.",
	enterMsg = "Parabéns.",
	enterEffect = CONST_ME_MAGIC_RED,
}

if getPlayerStorageValue(cid, 47780) == -1 then
		doTeleportThing(cid, tileConfig.kickPos)
		doPlayerSendCancel(cid, tileConfig.kickMsg)
else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, tileConfig.enterMsg)
end

  return true
end