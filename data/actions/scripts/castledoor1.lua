  ---------------                                                   
-----BY PC98-------  
  ---------------                                                   
         
function onUse(cid, item, frompos, item2, topos) 

-------------------------Config-----------------------------------------------------------------

door_opened = 1230                          -- ID da porta aberta
storage_guild = getGlobalStorageValue(123123)  -- A 3ª storage configurada em Castle.lua

guarda_ativ = 1      -- Caso um invasor tente abrir a porta, sumonar o Monstro "Guarda"??  | (0) = SIM  (1) = NAO
guarda_cont = 2                                 -- Caso ativo: a quantidade de guardas a sumonar
guarda_pos = {x=900,y=1194,y=7}                  -- Posiçao a ser sumonada os guardas!

-------------------------Fim de Config-----------------------------------------------------------


if getPlayerGuildId(cid) == storage_guild then
   doTeleportThing(cid,getThingPos(item.uid))
   doTransformItem(item.uid, door_opened)
   doPlayerSendTextMessage(cid, 22, "Seja bem vindo a vosso castelo!")   
   return TRUE
else
    if guarda_ativ == 1 then
       doPlayerSendTextMessage(cid, 22, "Este castelo nao pertence a sua guild")
        for i=1, guarda_cont do
            
        end
    return FALSE
    else
    doPlayerSendTextMessage(cid, 22, "Este castelo nao pertence a sua guild")
    return FALSE
    end
end
end