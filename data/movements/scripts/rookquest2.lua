function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
	kickPos = fromPosition, kickEffect = CONST_ME_POFF,
	kickMsg = "Você precisa ter completado a quest do ring para iniciar esta quest.",
	enterMsg = "Cuidado!!! O Inferno é quente e perigoso!, Cuidado!",
	enterEffect = CONST_ME_MAGIC_RED,
}

if getPlayerStorageValue(cid, 47776) == -1 then
		doTeleportThing(cid, tileConfig.kickPos)
		doPlayerSendCancel(cid, tileConfig.kickMsg)
else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, tileConfig.enterMsg)
end

  return true
end