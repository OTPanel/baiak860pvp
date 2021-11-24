function onTime()
				
function isInWallArray(pos)
    for k = 0, table.getn(SBW_WALLSID) do
        if (getTileItemById(pos, SBW_WALLSID[k]).itemid == SBW_WALLSID[k]) then
			return true    
        end	
    end
 return false
end

               
function endsnowball()
	local score = {}
	if not SBW_USEWAIT then
		doRemoveItem(getTileItemById(SBW_TP, 1387).uid)
	end
	for _, pid in ipairs(getPlayersOnline()) do
		if getPlayerStorageValue(pid, SBW_INEVENT) > 0 then
			table.insert(score, {getCreatureName(pid), getPlayerStorageValue(pid, SBW_SCORE)})
			doPlayerSetStorageValue(pid, SBW_INEVENT, 0)
			doPlayerSetStorageValue(pid, SBW_SCORE, 0)
			doPlayerSetStorageValue(pid, SBW_AMMO, 0)
			doTeleportThing(pid, SBW_TPEND)
		end
	end
	table.sort(score, function(a, b) return a[2] > b[2] end)
	--local random_item = SBW_REWARDS[math.random(1, #SBW_REWARDS)]
	local hora = os.date("%X")
	local data = os.date("%x")	
	if table.getn(score) > 0 then
		if SBW_ADDREWARD then
			for _, pid in ipairs(getPlayersOnline()) do
				if getCreatureName(pid) == score[1][1] then
					for op,ad in pairs(SBW_REWARDS) do
						doPlayerAddItem(pid, ad[1], ad[2])
					end
					break
                end
            end
        end
		db.query("INSERT INTO `snowballwar`  VALUES ('', ".. db.escapeString(score[1][1]) ..  ",".. score[1][2] ..", ".. db.escapeString(data) ..", ".. db.escapeString(hora) ..");")  
		db.query("UPDATE `players` SET `sbw_points`=`sbw_points`+".. score[1][2] .." WHERE `name` = " .. db.escapeString(score[1][1]) .. ";") 
        doBroadcastMessage("[SNOWBALL WAR] Foi encerrado, parabens ao jogador "..score[1][1].." que venceu o SnowBall com "..score[1][2].." pontos.")
    end
	return true
end

local t_l = SBW_AREA[1]
local b_r = SBW_AREA[2]

function moveToEvent()
for _, pid in ipairs(getPlayersOnline()) do
	if isInRange(getCreaturePosition(pid), SBW_WAITROOM[1], SBW_WAITROOM[2]) then
		local posti = {}
		local isPossibleToTeleportPlayer = false
		while (isPossibleToTeleportPlayer == FALSE) do
			posti = Position(math.random(t_l.x,b_r.x), math.random(t_l.y, b_r.y), 7)
			if (isInWallArray(posti) == FALSE) then
				isPossibleToTeleportPlayer = TRUE
			end
		end
		doTeleportThing(pid, posti)
		doPlayerSetStorageValue(pid, SBW_INEVENT, 1)
		doPlayerSetStorageValue(pid, SBW_AMMO, SBW_MINAMMO)
		doPlayerSetStorageValue(pid, SBW_SCORE, 0)
		doPlayerSendTextMessage(pid, 27, "[SNOWBALL WAR] Seja bem vindo, aqui estao os comandos que voce vai usar durante o evento\n!snowball atirar --Atirar uma bola de neve.\n!snowball info --Isso mostra seus pontos de jogos e a quantia de bolas de neve que voce tem. Tambem mostra o ranking de pontos do evento.\n Recarregue suas bolas de neve clicando em frente ao gerador no centro do campo.\nAltamente recomendado adicionar estes comandos a sua hotkeys.")               														
	end
end
doRemoveItem(getTileItemById(SBW_TP, 1387).uid)
addEvent(endsnowball, SBW_DURATION*1000*60)
doBroadcastMessage(SBW_MSGSTART)
end

local time = os.date("*t")
local timeopen1 = math.ceil(SBW_TIMEWAIT / 4)
local timeopen2 = math.ceil(SBW_TIMEWAIT / 2)
if (SBW_STARTAUTO) and (isInArray(SBW_DAYS,time.wday)) then
	doBroadcastMessage(SBW_MSGWARNING)
	if SBW_USEWAIT then
		addEvent(doBroadcastMessage, timeopen1*1000*60, "[SNOWBALL WAR] - Resta(m) ".. timeopen2 .." minuto(s) para iniciar o evento!")
		if (timeopen2 ~= timeopen1) then
			addEvent(doBroadcastMessage, timeopen2*1000*60, "[SNOWBALL WAR] - Resta(m) ".. timeopen1 .." minuto(s) para iniciar o evento!")
		end
        addEvent(moveToEvent, SBW_TIMEWAIT*1000*60)
        doCreateTeleport(1387, SBW_TPGO, SBW_TP)
		countDownTeleport(SBW_TP, 120)
    else
		if SBW_TFS == "0.3" then
			doItemSetAttribute(doCreateItem(1387, SBW_TP), "aid", 2880)
		else
			doSetItemActionId(doCreateItem(1387, SBW_TP), 2880)
        end
        if(SBW_DURATION > 0) then
            addEvent(endsnowball, SBW_DURATION*1000*60)
        end
    end
end
return true
end