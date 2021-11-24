-----------------------------------            
---------SCRIPT por PC98------------    NAO REMOVA OS CREDITOS      
-----------------------------------            


function onUse(cid, item, frompos, item2, topos) 


	if getPlayerLevel(cid) < 150 then
		doPlayerSendCancel(cid,"Somente jogadores level 150+ podem dominar o castelo.")
		return true
	end


------------------ Inicio das Config ------------

local castle_one_name = "New Of War"                  -- Nome do castelo 1
local storages = {154154,54321,123123}               -- Storages ( se vc eh iniciante, deixe como está...)



-------PREMIOs  I N D I V I D U A L ---------

local premio_por_vezes = 0        -- Premio por vezes de conquista de castelo. (1) = Ativo  (0) = Desativa. 
local premio_vezes = 1500            -- Caso ativo, a quantidade de conquista que o player tem, para ganhar PREMIO.
local premio = 5957                 -- ID do Premio
local premio_cont = 1              -- Quantidade do Premio
local premio_reset = 1             -- Resetar o contador do premio depois que atingir a meta?? (1) = SIM  (0) = NAO
 
-------FIM PREMIOs I N D I V I D U A L ---------



 
----------------- FIM DAS CONFIG -----------------

local sto_ativ = getGlobalStorageValue(storages[2])
position = getCreaturePosition(cid)
local teleport = {x=1349, y=1504, z=7}


   if isPlayerGuild(cid) == TRUE then
      if sto_ativ == 1 or sto_ativ == -1 then

         guildname = getPlayerGuildName(cid)     
         guild = getPlayerGuildId(cid)               
         guild_sto = getGlobalStorageValue(storages[3])
                  
            if guild ~= guild_sto then            
               setPlayerStorageValue(cid,guild_sto,guild)                      
               if getPlayerStorageValue(cid,storages[1]) == -1 then
                  setPlayerStorageValue(cid,storages[1],0)
               end
               
               sto_vezes = getPlayerStorageValue(cid,storages[1])                   
               
               setGlobalStorageValue(storages[3],getPlayerGuildId(cid))
               setPlayerStorageValue(cid,storages[1], sto_vezes + 1)
               
               sto_vezes_total = getPlayerStorageValue(cid,storages[1])
                        
               doBroadcastMessage("[Castle] O(a) "..getCreatureName(cid).." acabou de conquistar o castelo "..castle_one_name.." para a guild \""..guildname.."\" pela "..sto_vezes_total.."ª vez(s). Premio: 20% a mais de exp.", 22)
			   doCreatureSay(cid, "[Castle] Sua guild ganhou 20% a mais de experiencia, relogue para ativar!", TALKTYPE_ORANGE_1)
               doSendMagicEffect(position, 39)  
                 
                 if premio_por_vezes == 1 then
                    if getPlayerStorageValue(cid,storages[1]) == premio_vezes then
                       if getItemWeightById(premio,1) <= getPlayerFreeCap(cid) then
                          doBroadcastMessage("[Castle] O "..getCreatureName(cid).." ganhou uma(o) "..getItemNameById(premio).." como recompensa das suas "..premio_vezes.." conquistas!", 21)
                          doPlayerAddItem(cid, premio,premio_cont)
                          doPlayerSendTextMessage(cid, 18, "[Castle] Voce recebeu o(a) "..getItemNameById(premio).." como recompensa das suas "..premio_vezes.." conquistas!")
                        -----------------------------------------------  --  
                            if premio_reset == 1 then                    --
                               setPlayerStorageValue(cid,storages[1],0)  --  Resetar a contagem
                            end                                          --
                        -----------------------------------------------  --
                        
                       else
                       doPlayerSendTextMessage(cid, 18, "[Castle] Voce nao tem capacidade para ganhar o item. Vamos verificar novamente em 10 segundos!")
                       addEvent(additem,10000,cid,premio,premio_cont,premio_reset)
                       end
                    end                                        
                 end               
            else
              doPlayerSendCancel(cid,"[NewCastle] Este castelo ja foi conquistado pela sua guild!")
              doSendMagicEffect(position, 2)
            end
      else
      doPlayerSendCancel(cid,"[Castle] O sistema está desativado")
      end      
   else
   doPlayerSendCancel(cid,"[Castle] É nescessario ter guild para dominar o castelo!")
   doSendMagicEffect(position, 2)
   end
end

------------------------- por pc98

function additem(cid,premio,premio_cont,premio_reset)

 if getItemWeightById(premio,1) <= getPlayerFreeCap(cid) then
    doPlayerAddItem(cid, premio,premio_cont)
    doPlayerSendTextMessage(cid, 18, "[Castle] Voce recebeu o(a) "..getItemNameById(premio).." como recompensa das suas "..premio_vezes.." conquistas!")
     if premio_reset == 1 then
        setPlayerStorageValue(cid,storages[1],0)
     end
    stopEvent(additem)
  else
  doPlayerSendTextMessage(cid, 18, "[Castle] Voce nao tem capacidade para ganhar o item. Verificando novamente em 10 segundos!")
  addEvent(additem,10000,cid)
  end
end

-------------------------  por pc98
function isPlayerGuild(cid)
if getPlayerGuildName(cid) ~= "" then
return TRUE
else
return FALSE
end
end