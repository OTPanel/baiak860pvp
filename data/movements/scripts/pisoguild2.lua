function onStepIn(cid, item, position, fromPosition)
local n, g = getCreatureName(cid), getPlayerGuildName(cid)
if getPlayerGuildId(cid) == 0 then
doPlayerSendCancel(cid, "[Castle] Apenas jogadores com guild e acima de level 100 podem entrar nessa zona.")
doTeleportThing(cid, fromPosition, false) return true
end

if getPlayerStorageValue(cid, 9952) - os.time() < 1 then
setPlayerStorageValue(cid, 9952, os.time() + 250 * 1000)
broadcastMessage(n .." Está invadindo o [Castle24hrs] para a guild [" .. g .. "].", MESSAGE_STATUS_WARNING)
end
return true
end