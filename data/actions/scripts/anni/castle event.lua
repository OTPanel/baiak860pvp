-- Script feito por Vítor Bertolucci (Killua)
-- 07/06/2014

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getGlobalStorageValue(1821999) ~= getPlayerGuildId(cid) then
        doTeleportThing(cid, fromPosition)
		doPlayerSendCancel(cid, "Somente donos do castelo podem abrir a porta")
		return true
	else
		doTeleportThing(cid, toPosition)
    end
    return true
end