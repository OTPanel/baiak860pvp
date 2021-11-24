-- Script feito por Vítor Bertolucci (Killua)
-- 07/06/2014

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if getPlayerStorageValue(cid, 1827311) > 0 then
        doPlayerSetStorageValue(cid, 1827311, 0)
    end
    
    if getPlayerGuildId(cid) <= 0 or not getPlayerGuildId(cid) or getPlayerGuildId(cid) == false or getPlayerLevel(cid) < 25 then
        doTeleportThing(cid, fromPosition)
        doPlayerSendCancel(cid, "Voce nao tem guild ou eh level menor que 25 e nao pode entrar no castelo!")
        return true
    end
    
    if getGlobalStorageValue(18219113) == -1 then
        if getGlobalStorageValue(1821999) ~= getPlayerGuildId(cid) then
            doTeleportThing(cid, fromPosition)
            doPlayerSendCancel(cid, "Sua guild nao eh dona do castelo e o evento nao esta aberto")
            return true
        end
    end
    return true
end