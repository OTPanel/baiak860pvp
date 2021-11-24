--[[	

			Real Team Battle Event
	Desenvolvido por Vítor Bertolucci (Killua)

]]

local conditionRed = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionRed, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionRed, {lookType = 152, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookAddons = 3})

local conditionBlue = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionBlue, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionBlue, {lookType = 251, lookHead = 86, lookBody = 86, lookLegs = 86, lookFeet = 86, lookAddons = 3})

local conditionBlack = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionBlack, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionBlack, {lookType = 289, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114, lookAddons = 3})

local conditionGreen = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionGreen, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionGreen, {lookType = 153, lookHead = 81, lookBody = 119, lookLegs = 119, lookFeet = 119, lookAddons = 3})

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if getPlayerLevel(cid) < 100 then
        doTeleportThing(cid,lastPosition)
        doCreatureSay(cid,"Somente level 100+",TALKTYPE_ORANGE_1)
        return true
    end

 	local ip = getPlayerIp(cid)
    if realTeamBattle.ips[ip] and tonumber(realTeamBattle.ips[ip]) and tonumber(realTeamBattle.ips[ip]) >= os.time() then
        doTeleportThing(cid,lastPosition)
        doCreatureSay(cid,"Somente 1 jogador por IP", TALKTYPE_ORANGE_1)
        return true
    end
	
    local ring = getPlayerSlotItem(cid,CONST_SLOT_RING)
    if ring and ring.uid and ring.uid > 0 and ring.itemid == 2165 then
        doRemoveItem(ring.uid)
    end

    local check = getGlobalStorageValue(realTeamBattle.checkStorage)
    if check == 0 then
        doPlayerSetStorageValue(cid,realTeamBattle.teamStorage,realTeamBattle.redTeam.storage)
        doAddCondition(cid,conditionRed)
        doTeleportThing(cid,realTeamBattle.redTeam.startPos)
        doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Team Battle] Você entrou para o time "..realTeamBattle.redTeam.name..". Aguarde o evento iniciar.")
        realTeamBattle.ips[ip] = os.time() + 600
        setGlobalStorageValue(realTeamBattle.countStorage, getGlobalStorageValue(realTeamBattle.countStorage) - 1)
        setGlobalStorageValue(realTeamBattle.checkStorage,1)

    elseif check == 1 then
        doPlayerSetStorageValue(cid,realTeamBattle.teamStorage,realTeamBattle.blueTeam.storage)
        doAddCondition(cid,conditionBlue)
        doTeleportThing(cid,realTeamBattle.blueTeam.startPos)
        doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Team Battle] Você entrou para o time "..realTeamBattle.blueTeam.name..". Aguarde o evento iniciar.")
        realTeamBattle.ips[ip] = os.time() + 600
        setGlobalStorageValue(realTeamBattle.countStorage, getGlobalStorageValue(realTeamBattle.countStorage) - 1)
        setGlobalStorageValue(realTeamBattle.checkStorage,2)

    elseif check == 2 then
        doPlayerSetStorageValue(cid,realTeamBattle.teamStorage,realTeamBattle.blackTeam.storage)
        doAddCondition(cid,conditionBlack)
        doTeleportThing(cid,realTeamBattle.blackTeam.startPos)
        doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Team Battle] Você entrou para o time "..realTeamBattle.blackTeam.name..". Aguarde o evento iniciar.")
        realTeamBattle.ips[ip] = os.time() + 600
        setGlobalStorageValue(realTeamBattle.countStorage, getGlobalStorageValue(realTeamBattle.countStorage) - 1)
        setGlobalStorageValue(realTeamBattle.checkStorage,3)

    elseif check == 3 then
        doPlayerSetStorageValue(cid,realTeamBattle.teamStorage,realTeamBattle.greenTeam.storage)
        doAddCondition(cid,conditionGreen)
        doTeleportThing(cid,realTeamBattle.greenTeam.startPos)
        doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Team Battle] Você entrou para o time "..realTeamBattle.greenTeam.name..". Aguarde o evento iniciar.")
        realTeamBattle.ips[ip] = os.time() + 600
        setGlobalStorageValue(realTeamBattle.countStorage, getGlobalStorageValue(realTeamBattle.countStorage) - 1)
        setGlobalStorageValue(realTeamBattle.checkStorage,0)
    end
    if getGlobalStorageValue(realTeamBattle.countStorage) == 0 then
        realTeamBattle.removeTeleport()
    end
    return true
end
