function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
	kickPos = fromPosition, kickEffect = CONST_ME_POFF,
	kickMsg = "Voce n�o tem permiss�o para entrar na sala, pegue a permiss�o no meio do deserto.",
	enterMsg = "Parab�ns.",
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