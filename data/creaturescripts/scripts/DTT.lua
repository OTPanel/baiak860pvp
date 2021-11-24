function onLogin(cid)
    registerCreatureEvent(cid, "dttDeath")
    registerCreatureEvent(cid, "dttPrepare")
    registerCreatureEvent(cid, "dttStats")
    registerCreatureEvent(cid, "dttOutfit")
    registerCreatureEvent(cid, "dttKill") 
    registerCreatureEvent(cid, "dttCombat")
    if (getPlayerStorageValue(cid, dtt.storage.team_blue) == 1) or (getPlayerStorageValue(cid, dtt.storage.team_red) == 1) then
        dtt.cleanPlayer(cid)
    end
    if (dtt.getBonusExp(cid)) then
        doPlayerSendTextMessage(cid,25, "[DEFEND THE TOWER] Voce esta com "..dtt.bonus_rate.."x de bonus experiencia.")
    end
    return true
end

--Preparar jogadores pra morte
function onPrepareDeath(cid, deathList)
    if not isPlayer(cid) then
    	return true
    end

    if (getPlayerStorageValue(cid, dtt.storage.team_blue) == 1) or (getPlayerStorageValue(cid, dtt.storage.team_red) == 1) then
        local strings = {""}
        local j, position, corpse = 1, 1, 0
        --Dropar corpo ficticio
        for _, pid in ipairs(deathList) do
            if isCreature(pid) == true then
                strings[position] = j == 1 and "" or strings[position] .. ", "
                strings[position] = strings[position] .. getCreatureName(pid) .. ""
                j = j + 1
            else
                strings[position] = j == 1 and "" or strings[position] .. ", "
                strings[position] = strings[position] .."a field item"
                j = j + 1
            end
        end
        for i, str in ipairs(strings) do
            if(str:sub(str:len()) ~= ",") then
                str = str .. "."
            end
            desc = "You recognize "
            desc = desc .. "" .. getCreatureName(cid) .. ". He was killed by " .. str
        end
        if(getPlayerSex(cid) == 1) then
            corpse = doCreateItem(3058, getCreaturePosition(cid))
        else
            corpse = doCreateItem(3065, getCreaturePosition(cid))
        end
        doItemSetAttribute(corpse, "description", desc)
        dtt.setDelay(cid)
        dtt.getDelay(cid)
    end

    --Adicionando contagem de frags
    if (getPlayerStorageValue(cid, dtt.storage.team_blue) == 1) then
        setGlobalStorageValue(dtt.storage.kill_blue, (getGlobalStorageValue(dtt.storage.kill_blue)+1))
        doPlayerSetTown(cid, dtt.townid.blue)
    end
    if (getPlayerStorageValue(cid, dtt.storage.team_red) == 1) then
        setGlobalStorageValue(dtt.storage.kill_red, (getGlobalStorageValue(dtt.storage.kill_red)+1))
        doPlayerSetTown(cid, dtt.townid.red)
    end
    return true
end

--Atacar jogadores do mesmo time
function onCombat(cid, target)
    --Membros do mesmo time se atacando
    if isPlayer(cid) and isPlayer(target) then
        if (getPlayerStorageValue(cid, dtt.storage.team_blue) == 1) and (getPlayerStorageValue(target, dtt.storage.team_blue) == 1) then
		  doPlayerSendCancel(cid, "[DEFEND THE TOWER] Nao se pode atacar um membro do mesmo time.") 
		  return false
	   end
	   if (getPlayerStorageValue(cid, dtt.storage.team_red) == 1) and (getPlayerStorageValue(target, dtt.storage.team_red) == 1) then
		  doPlayerSendCancel(cid, "[DEFEND THE TOWER] Nao se pode atacar um membro do mesmo time.") 
		  return false
	   end
    end

    --Membro time azul atacando propria torre
    if getPlayerStorageValue(cid, dtt.storage.team_blue) == 1 and isMonster(target) then
        if (getCreatureName(target) == dtt.monster.name.a1) then
            return false
        end
        if (getCreatureName(target) == dtt.monster.name.a2) then
            return false
        end
        if (getCreatureName(target) == dtt.monster.name.a3) then
            return false
        end
        if (getCreatureName(target) == dtt.monster.name.a4) then
            return false
        end
    end

    --Membro time vermelho atacando propria torre
    if getPlayerStorageValue(cid, dtt.storage.team_red) == 1 and isMonster(target) then
        if (getCreatureName(target) == dtt.monster.name.b1) then
            return false
        end
        if (getCreatureName(target) == dtt.monster.name.b2) then
            return false
        end
        if (getCreatureName(target) == dtt.monster.name.b3) then
            return false
        end
        if (getCreatureName(target) == dtt.monster.name.b4) then
            return false
        end
    end

    --Impedir que ataquem torres secundarias
    if (getCreatureName(target) == dtt.monster.name.a1) and isMonster(target) then
        if(isCreature(getThingFromPos(dtt.monster.pos.a2).uid) or isCreature(getThingFromPos(dtt.monster.pos.a3).uid) or isCreature(getThingFromPos(dtt.monster.pos.a4).uid)) then  -- SE ALGUM VALOR DER TRUE NÃO VAI PODER ATACAR 
            return false
        end
    end

    if (getCreatureName(target) == dtt.monster.name.b1) and isMonster(target) then
        if(isCreature(getThingFromPos(dtt.monster.pos.b2).uid) or isCreature(getThingFromPos(dtt.monster.pos.b3).uid) or isCreature(getThingFromPos(dtt.monster.pos.b4).uid)) then  -- SE ALGUM VALOR DER TRUE NÃO VAI PODER ATACAR 
            return false
        end
    end

    return true
end

--Bonus exp
function onKill(cid, target)
    if (dtt.getBonusExp(cid)) and isMonster(target) then     
        doPlayerAddExp(cid, getMonsterInfo(getCreatureName(target)).experience * dtt.bonus_rate)
    end
    return true
end

--Aviso de attack sobre as torres
function onStatsChange(cid, attacker, type, combat, value)
    if not isPlayer(attacker) then
        return true
    end

    -- Avisar que as torres estão sendo atacadas | a2 =  top, a3 = middle, a4 = bottom.
    if (type == STATSCHANGE_HEALTHLOSS) and (getCreatureName(cid) == dtt.monster.name.a2) then
        dtt.warningAttack(cid, "azul do topo", dtt.storage.team_blue) 
    end
    if (type == STATSCHANGE_HEALTHLOSS) and (getCreatureName(cid) == dtt.monster.name.a3) then
        dtt.warningAttack(cid, "azul do meio", dtt.storage.team_blue) 
    end
    if (type == STATSCHANGE_HEALTHLOSS) and (getCreatureName(cid) == dtt.monster.name.a4) then
        dtt.warningAttack(cid, "azul de baixo", dtt.storage.team_blue)   
    end
    if (type == STATSCHANGE_HEALTHLOSS) and (getCreatureName(cid) == dtt.monster.name.b2) then
        dtt.warningAttack(cid, "vermelha do topo", dtt.storage.team_red) 
    end
    if (type == STATSCHANGE_HEALTHLOSS) and (getCreatureName(cid) == dtt.monster.name.b3) then
        dtt.warningAttack(cid, "vermelha do meio", dtt.storage.team_red) 
    end
    if (type == STATSCHANGE_HEALTHLOSS) and (getCreatureName(cid) == dtt.monster.name.b4) then
        dtt.warningAttack(cid, "vermelha de baixo", dtt.storage.team_red) 
    end

    return true
end 

--Impedindo troca de outfit durante o evento
function onOutfit(cid, old, current)
    if getPlayerStorageValue(cid, dtt.storage.team_blue) == 1 or getPlayerStorageValue(cid, dtt.storage.team_red) == 1  then
        doPlayerSendCancel(cid, dtt.msg.outfit)
        return false
    end
    return true
end

--Tratando morte dos montros buff e torres
function onDeath(cid, corpse, mostDamageKiller) 
--Avisos de morte torres time azul
if getCreatureName(cid) == dtt.monster.name.a2 then
    broadcastMessage("[DEFEND THE TOWER] A torre azul do topo foi destruida.", MESSAGE_EVENT_ADVANCE)
    doCreateItem(9596, dtt.monster.pos.a2)
    setGlobalStorageValue(dtt.storage.tower_red, (getGlobalStorageValue(dtt.storage.tower_red)+1))
end 

if getCreatureName(cid) == dtt.monster.name.a3 then
    broadcastMessage("[DEFEND THE TOWER] A torre azul do meio foi destruida.", MESSAGE_EVENT_ADVANCE)
    doCreateItem(9596, dtt.monster.pos.a3)
    setGlobalStorageValue(dtt.storage.tower_red, (getGlobalStorageValue(dtt.storage.tower_red)+1))
end

if getCreatureName(cid) == dtt.monster.name.a4 then
    broadcastMessage("[DEFEND THE TOWER] A torre azul de baixo foi destruida.", MESSAGE_EVENT_ADVANCE)
    doCreateItem(9596, dtt.monster.pos.a4)
    setGlobalStorageValue(dtt.storage.tower_red, (getGlobalStorageValue(dtt.storage.tower_red)+1))
end

--Avisos de morte torres time vermelho
if getCreatureName(cid) == dtt.monster.name.b2 then
    broadcastMessage("[DEFEND THE TOWER] A torre vermelha do topo foi destruida.", MESSAGE_EVENT_ADVANCE)
    doCreateItem(9596, dtt.monster.pos.b2)
    setGlobalStorageValue(dtt.storage.tower_blue, (getGlobalStorageValue(dtt.storage.tower_blue)+1))
end 

if getCreatureName(cid) == dtt.monster.name.b3 then
    broadcastMessage("[DEFEND THE TOWER] A torre vermelha do meio foi destruida.", MESSAGE_EVENT_ADVANCE)
    doCreateItem(9596, dtt.monster.pos.b3)
    setGlobalStorageValue(dtt.storage.tower_blue, (getGlobalStorageValue(dtt.storage.tower_blue)+1))
end

if getCreatureName(cid) == dtt.monster.name.b4 then
    broadcastMessage("[DEFEND THE TOWER] A torre vermelha de baixo foi destruida.", MESSAGE_EVENT_ADVANCE)
    doCreateItem(9596, dtt.monster.pos.b4)
    setGlobalStorageValue(dtt.storage.tower_blue, (getGlobalStorageValue(dtt.storage.tower_blue)+1))
end


--Aviso ultimas torres e abertura do teleporte
if getCreatureName(cid) == dtt.monster.name.a1 then
    dtt.removeMonsters()
    setGlobalStorageValue(dtt.storage.win, "red")
    setGlobalStorageValue(dtt.storage.tower_red, (getGlobalStorageValue(dtt.storage.tower_red)+1))
    dtt.close()
    broadcastMessage(dtt.msg.win_team_red, MESSAGE_EVENT_ADVANCE)
    dtt.resultBattle()
end 

--Aviso ultimas torres e abertura do teleporte
if getCreatureName(cid) == dtt.monster.name.b1 then
    dtt.removeMonsters()
    setGlobalStorageValue(dtt.storage.win, "blue")
    setGlobalStorageValue(dtt.storage.tower_blue, (getGlobalStorageValue(dtt.storage.tower_blue)+1))
    dtt.close()
    broadcastMessage(dtt.msg.win_team_blue, MESSAGE_EVENT_ADVANCE)
    dtt.resultBattle()
end 

--Verificando buff sorcerer and paladin
if getCreatureName(cid) == dtt.monster.name.buff1 then
    if (getPlayerStorageValue(mostDamageKiller[1], dtt.storage.team_blue) == 1) then
        dtt.setBuff(dtt.storage.team_blue, 1, 3)
        for _, index in ipairs(dtt.getPlayersInEvent()) do
            if getPlayerStorageValue(index.pid, dtt.storage.team_blue) == 1 then
                doPlayerSendTextMessage(index.pid, 25, "[DEFEND THE TOWER] Os sorcerers e paladinos do seu time receberao buff, utilize as magias wizard buff ou archer buff.")  
            end
        end
    else
        dtt.setBuff(dtt.storage.team_red, 1, 3)
        for _, index in ipairs(dtt.getPlayersInEvent()) do
            if getPlayerStorageValue(index.pid, dtt.storage.team_red) == 1 then
                doPlayerSendTextMessage(index.pid, 25, "[DEFEND THE TOWER] Os sorcerers e paladinos do seu time receberao buff, utilize as magias wizard buff ou archer buff.")  
            end
        end
    end
end

--Verificando buff druid and knight
if getCreatureName(cid) == dtt.monster.name.buff2 then
    if (getPlayerStorageValue(mostDamageKiller[1], dtt.storage.team_blue) == 1) then
        dtt.setBuff(dtt.storage.team_blue, 2, 4)
        for _, index in ipairs(dtt.getPlayersInEvent()) do
            if getPlayerStorageValue(index.pid, dtt.storage.team_blue) == 1 then
                doPlayerSendTextMessage(index.pid, 25, "[DEFEND THE TOWER] Os druids e knights do seu time receberao buff, utilize as magias magician buff ou warrior buff.")  
            end
        end
    else
        dtt.setBuff(dtt.storage.team_red, 2, 4)
        for _, index in ipairs(dtt.getPlayersInEvent()) do
            if getPlayerStorageValue(index.pid, dtt.storage.team_red) == 1 then
                doPlayerSendTextMessage(index.pid, 25, "[DEFEND THE TOWER] Os druids e knights do seu time receberao buff, utilize as magias magician buff ou warrior buff.")  
            end
        end
    end
end
return true
end

