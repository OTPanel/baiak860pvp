--[[Script criado por Henrique Matheus 1.0]]



function onPush(cid, target)
	if getPlayerAccess(cid) > 3 then
	return true
	else
    if getTilePzInfo(getThingPos(cid)) or getTilePzInfo(getThingPos(target)) then
		doPlayerSendCancel(cid, "Você não pode empurrar players em protection zone.")
        return false
		end
    end
	return true
end

