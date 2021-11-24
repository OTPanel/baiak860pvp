local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local xmin = 3
local xmax = 3
local fmin = 3
local fmax = 9
local minuto = 60
local minutodois = 120
local velocidade = 300
local sqms = 3

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid	

	if(msgcontains(msg, 'folda')) then
		selfSay('Você realmente quer andar no meu tapete?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if getPlayerLevel(cid) >= 300 and getGlobalStorageValue(7647) <= 0 then
			ppos = {x=4425,y=1289,z=15,stackpos=1}
			pos = getThingfromPos(ppos)
				if pos.itemid == 10000 then
					cp = {x=4426,y=1290,z=5}
					parametro = {cp=cp}
						if getGlobalStorageValue(5600) <= 0 then
							addEvent(tapete,100,parametro)
							setGlobalStorageValue(5600,1)
                                       	 		setGlobalStorageValue(7647,1)
						else
                                       	 		setGlobalStorageValue(7647,1)
                                                	addEvent(tapete,100,parametro)
							setGlobalStorageValue(5601,0)
							setGlobalStorageValue(5600,1)
						end
				else
                                        print('>> Caiunamerdadoitem')
				end 			
			selfSay('Fique encima do tapete, ele ira decolar em 2 minutos, script desenvolvido por UpperHost.net !', cid)
		else
			selfSay('Tapete já esta ativado para folda e volta em 2 minutos ou você não tem level super a 500, script desenvolvido por UpperHost.net !', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

function tapete(parametro)
cp = parametro.cp
parametro = {cp=cp}
folda = {x=4547,y=1290,z=5}
city = {x=4426,z=1290,z=5}



-----------------------------------------------  PLANO DE VOO   DO TAPETE --------------------------------------------


status = getGlobalStorageValue(5600)

if status == 1 then

doBroadcastMessage("Aladin: O tapete foi ativado e partira para folda em 2 minutos.", MESSAGE_TYPES["blue"])
addEvent(tapete,minuto*2000,parametro)
setGlobalStorageValue(5600,2)
setGlobalStorageValue(5601,0)


elseif status == 2 then

addEvent(decola,1,parametro) 
setGlobalStorageValue(5601,0)

elseif status == 3 then

addEvent(voa,100,{cp=cp,togo={x=4547,y=1290,z=0}})   -- A posição togo é a posição que o tapete vai passar para outro status
setGlobalStorageValue(5602,0)
setGlobalStorageValue(5601,2) --  Seleciona o lado  [1=esquerda | 2=direita | 3=cima | 4=baxo]

elseif status == 4 then

addEvent(pousa,1,parametro)
setGlobalStorageValue(5601,0)

elseif status == 5 then

doBroadcastMessage("Aladin: O tapete acabou de chegar em folda e voltara para cidade em 4 minutos.", MESSAGE_TYPES["blue"])
addEvent(tapete,minutodois*2000,parametro)
setGlobalStorageValue(5600,6)
setGlobalStorageValue(5601,0)

elseif status == 6 then
                          
addEvent(decola,1,parametro) 
setGlobalStorageValue(5601,0)

elseif status == 7 then

addEvent(voa,100,{cp=cp,togo={x=4426,y=1290,z=0}})
setGlobalStorageValue(5602,0)
setGlobalStorageValue(5601,1) --esquerda

elseif status == 8 then

addEvent(pousa,1,parametro)
setGlobalStorageValue(5601,0)

elseif status == 9 then

doBroadcastMessage("Aladin: O tapete acabou de voltar para cidade, para ativa-lo novamente fale comigo.", MESSAGE_TYPES["blue"])
setGlobalStorageValue(7647,0)

end
end


      
-----------------------------------------------  PLANO DE VOO   DO TAPETE --------------------------------------------   
   
   
   
   
   
   
   
   
   
   
   
  function voa(parametro)
  cp = parametro.cp
  togo = parametro.togo
  


  
  

 
      
   
                                                                    
  
  
  if getGlobalStorageValue(5601) == 1 then
            if cp.x <= togo.x then
            setGlobalStorageValue(5601,5)
            end
            elseif getGlobalStorageValue(5601) == 2 then 
            if cp.x >= togo.x then
            setGlobalStorageValue(5601,5)
            end                                                            
            elseif getGlobalStorageValue(5601) == 3 then
            if cp.y <= togo.y then
            setGlobalStorageValue(5601,5)
            end
            elseif getGlobalStorageValue(5601) == 4 then
            if cp.y >= togo.y then
            setGlobalStorageValue(5601,5)
            end
            end
  
  
  
   
   
       if getGlobalStorageValue(5601) ~= 5 then
 
 
----VOA -------------------------------------------------------------------------------------




    
tapetepos1 = {x=cp.x-1,y=cp.y-1,z=cp.z,stackpos=1}
tapetepos2 = {x=cp.x,y=cp.y-1,z=cp.z,stackpos=1}
tapetepos3 = {x=cp.x+1,y=cp.y-1,z=cp.z,stackpos=1}
tapetepos4 = {x=cp.x-1,y=cp.y,z=cp.z,stackpos=1}
tapetepos5 = {x=cp.x,y=cp.y,z=cp.z,stackpos=1}
tapetepos6 = {x=cp.x+1,y=cp.y,z=cp.z,stackpos=1}
tapetepos7 = {x=cp.x-1,y=cp.y+1,z=cp.z,stackpos=1}
tapetepos8 = {x=cp.x,y=cp.y+1,z=cp.z,stackpos=1}
tapetepos9 = {x=cp.x+1,y=cp.y+1,z=cp.z,stackpos=1}

tapete1 = getThingfromPos(tapetepos1)
tapete2 = getThingfromPos(tapetepos2)
tapete3 = getThingfromPos(tapetepos3)
tapete4 = getThingfromPos(tapetepos4)
tapete5 = getThingfromPos(tapetepos5)
tapete6 = getThingfromPos(tapetepos6)
tapete7 = getThingfromPos(tapetepos7)
tapete8 = getThingfromPos(tapetepos8)
tapete9 = getThingfromPos(tapetepos9)

playerpos1 = {x=cp.x-1,y=cp.y-1,z=cp.z,stackpos=253}
playerpos2 = {x=cp.x,y=cp.y-1,z=cp.z,stackpos=253}
playerpos3 = {x=cp.x+1,y=cp.y-1,z=cp.z,stackpos=253}
playerpos4 = {x=cp.x-1,y=cp.y,z=cp.z,stackpos=253}
playerpos5 = {x=cp.x,y=cp.y,z=cp.z,stackpos=253}
playerpos6 = {x=cp.x+1,y=cp.y,z=cp.z,stackpos=253}
playerpos7 = {x=cp.x-1,y=cp.y+1,z=cp.z,stackpos=253}
playerpos8 = {x=cp.x,y=cp.y+1,z=cp.z,stackpos=253}
playerpos9 = {x=cp.x+1,y=cp.y+1,z=cp.z,stackpos=253}

player1 = getThingfromPos(playerpos1)
player2 = getThingfromPos(playerpos2)
player3 = getThingfromPos(playerpos3)
player4 = getThingfromPos(playerpos4)
player5 = getThingfromPos(playerpos5)
player6 = getThingfromPos(playerpos6)
player7 = getThingfromPos(playerpos7)
player8 = getThingfromPos(playerpos8)
player9 = getThingfromPos(playerpos9)


xaopos1 = {x=cp.x-1,y=cp.y-1,z=cp.z,stackpos=0}
xaopos2 = {x=cp.x,y=cp.y-1,z=cp.z,stackpos=0}
xaopos3 = {x=cp.x+1,y=cp.y-1,z=cp.z,stackpos=0}
xaopos4 = {x=cp.x-1,y=cp.y,z=cp.z,stackpos=0}
xaopos5 = {x=cp.x,y=cp.y,z=cp.z,stackpos=0}
xaopos6 = {x=cp.x+1,y=cp.y,z=cp.z,stackpos=0}
xaopos7 = {x=cp.x-1,y=cp.y+1,z=cp.z,stackpos=0}
xaopos8 = {x=cp.x,y=cp.y+1,z=cp.z,stackpos=0}
xaopos9 = {x=cp.x+1,y=cp.y+1,z=cp.z,stackpos=0}

xao1 = getThingfromPos(xaopos1)
xao2 = getThingfromPos(xaopos2)
xao3 = getThingfromPos(xaopos3)
xao4 = getThingfromPos(xaopos4)
xao5 = getThingfromPos(xaopos5)
xao6 = getThingfromPos(xaopos6)
xao7 = getThingfromPos(xaopos7)
xao8 = getThingfromPos(xaopos8)
xao9 = getThingfromPos(xaopos9)



if getGlobalStorageValue(5601) == 1 then


nextpos1 = {x=xaopos1.x-sqms,y=xaopos1.y,z=xaopos1.z,stackpos=0}
nextpos2 = {x=xaopos2.x-sqms,y=xaopos2.y,z=xaopos2.z,stackpos=0}
nextpos3 = {x=xaopos3.x-sqms,y=xaopos3.y,z=xaopos3.z,stackpos=0}
nextpos4 = {x=xaopos4.x-sqms,y=xaopos4.y,z=xaopos4.z,stackpos=0}
nextpos5 = {x=xaopos5.x-sqms,y=xaopos5.y,z=xaopos5.z,stackpos=0}
nextpos6 = {x=xaopos6.x-sqms,y=xaopos6.y,z=xaopos6.z,stackpos=0}
nextpos7 = {x=xaopos7.x-sqms,y=xaopos7.y,z=xaopos7.z,stackpos=0}
nextpos8 = {x=xaopos8.x-sqms,y=xaopos8.y,z=xaopos8.z,stackpos=0}
nextpos9 = {x=xaopos9.x-sqms,y=xaopos9.y,z=xaopos9.z,stackpos=0}

elseif getGlobalStorageValue(5601) == 2 then
nextpos1 = {x=xaopos1.x+sqms,y=xaopos1.y,z=xaopos1.z,stackpos=0}
nextpos2 = {x=xaopos2.x+sqms,y=xaopos2.y,z=xaopos2.z,stackpos=0}
nextpos3 = {x=xaopos3.x+sqms,y=xaopos3.y,z=xaopos3.z,stackpos=0}
nextpos4 = {x=xaopos4.x+sqms,y=xaopos4.y,z=xaopos4.z,stackpos=0}
nextpos5 = {x=xaopos5.x+sqms,y=xaopos5.y,z=xaopos5.z,stackpos=0}
nextpos6 = {x=xaopos6.x+sqms,y=xaopos6.y,z=xaopos6.z,stackpos=0}
nextpos7 = {x=xaopos7.x+sqms,y=xaopos7.y,z=xaopos7.z,stackpos=0}
nextpos8 = {x=xaopos8.x+sqms,y=xaopos8.y,z=xaopos8.z,stackpos=0}
nextpos9 = {x=xaopos9.x+sqms,y=xaopos9.y,z=xaopos9.z,stackpos=0}

elseif getGlobalStorageValue(5601) == 3 then
nextpos1 = {x=xaopos1.x,y=xaopos1.y-sqms,z=xaopos1.z,stackpos=0}
nextpos2 = {x=xaopos2.x,y=xaopos2.y-sqms,z=xaopos2.z,stackpos=0}
nextpos3 = {x=xaopos3.x,y=xaopos3.y-sqms,z=xaopos3.z,stackpos=0}
nextpos4 = {x=xaopos4.x,y=xaopos4.y-sqms,z=xaopos4.z,stackpos=0}
nextpos5 = {x=xaopos5.x,y=xaopos5.y-sqms,z=xaopos5.z,stackpos=0}
nextpos6 = {x=xaopos6.x,y=xaopos6.y-sqms,z=xaopos6.z,stackpos=0}
nextpos7 = {x=xaopos7.x,y=xaopos7.y-sqms,z=xaopos7.z,stackpos=0}
nextpos8 = {x=xaopos8.x,y=xaopos8.y-sqms,z=xaopos8.z,stackpos=0}
nextpos9 = {x=xaopos9.x,y=xaopos9.y-sqms,z=xaopos9.z,stackpos=0}

elseif getGlobalStorageValue(5601) == 4 then
nextpos1 = {x=xaopos1.x,y=xaopos1.y+sqms,z=xaopos1.z,stackpos=0}
nextpos2 = {x=xaopos2.x,y=xaopos2.y+sqms,z=xaopos2.z,stackpos=0}
nextpos3 = {x=xaopos3.x,y=xaopos3.y+sqms,z=xaopos3.z,stackpos=0}
nextpos4 = {x=xaopos4.x,y=xaopos4.y+sqms,z=xaopos4.z,stackpos=0}
nextpos5 = {x=xaopos5.x,y=xaopos5.y+sqms,z=xaopos5.z,stackpos=0}
nextpos6 = {x=xaopos6.x,y=xaopos6.y+sqms,z=xaopos6.z,stackpos=0}
nextpos7 = {x=xaopos7.x,y=xaopos7.y+sqms,z=xaopos7.z,stackpos=0}
nextpos8 = {x=xaopos8.x,y=xaopos8.y+sqms,z=xaopos8.z,stackpos=0}
nextpos9 = {x=xaopos9.x,y=xaopos9.y+sqms,z=xaopos9.z,stackpos=0}

end


cleanpos1 = {x=tapetepos1.x,y=tapetepos1.y,z=tapetepos1.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
cleanpos2 = {x=tapetepos2.x,y=tapetepos2.y,z=tapetepos2.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
cleanpos3 = {x=tapetepos3.x,y=tapetepos3.y,z=tapetepos3.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
cleanpos4 = {x=tapetepos4.x,y=tapetepos4.y,z=tapetepos4.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
cleanpos5 = {x=tapetepos5.x,y=tapetepos5.y,z=tapetepos5.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
cleanpos6 = {x=tapetepos6.x,y=tapetepos6.y,z=tapetepos6.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
cleanpos7 = {x=tapetepos7.x,y=tapetepos7.y,z=tapetepos7.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
cleanpos8 = {x=tapetepos8.x,y=tapetepos8.y,z=tapetepos8.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
cleanpos9 = {x=tapetepos9.x,y=tapetepos9.y,z=tapetepos9.z,stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}

clean1 = getThingfromPos(cleanpos1)
clean2 = getThingfromPos(cleanpos2)
clean3 = getThingfromPos(cleanpos3)
clean4 = getThingfromPos(cleanpos4)
clean5 = getThingfromPos(cleanpos5)
clean6 = getThingfromPos(cleanpos6)
clean7 = getThingfromPos(cleanpos7)
clean8 = getThingfromPos(cleanpos8)
clean9 = getThingfromPos(cleanpos9)


tapetes = {5569,5570,5571,5572,5573,5574,5575,5576,5577}


if clean1.itemid ~= 0 then
if not isInArray(tapetes,clean1.itemid) and (not isPlayer(clean1.uid)) then
count = getThingFromPos(cleanpos1).type
doRemoveItem(clean1.uid,count)
doSendMagicEffect(cleanpos1,13)
end
end

if clean2.itemid ~= 0 then
if not isInArray(tapetes,clean2.itemid) and (not isPlayer(clean2.uid)) then
count = getThingFromPos(cleanpos2).type
doRemoveItem(clean2.uid,count)
doSendMagicEffect(cleanpos2,13)
end
end

if clean3.itemid ~= 0 then
if not isInArray(tapetes,clean3.itemid) and (not isPlayer(clean3.uid)) then
count = getThingFromPos(cleanpos3).type
doRemoveItem(clean3.uid,count)
doSendMagicEffect(cleanpos3,13)
end
end

if clean4.itemid ~= 0 then
if not isInArray(tapetes,clean4.itemid) and (not isPlayer(clean4.uid)) then
count = getThingFromPos(cleanpos4).type
doRemoveItem(clean4.uid,count)
doSendMagicEffect(cleanpos4,13)
end
end

if clean5.itemid ~= 0 then
if not isInArray(tapetes,clean5.itemid) and (not isPlayer(clean5.uid)) then
count = getThingFromPos(cleanpos5).type
doRemoveItem(clean5.uid,count)
doSendMagicEffect(cleanpos5,13)
end
end

if clean6.itemid ~= 0 then
if not isInArray(tapetes,clean6.itemid) and (not isPlayer(clean6.uid)) then
count = getThingFromPos(cleanpos6).type
doRemoveItem(clean6.uid,count)
doSendMagicEffect(cleanpos6,13)
end
end

if clean7.itemid ~= 0 then
if not isInArray(tapetes,clean7.itemid) and (not isPlayer(clean7.uid)) then
count = getThingFromPos(cleanpos7).type
doRemoveItem(clean7.uid,count)
doSendMagicEffect(cleanpos7,13)
end
end

if clean8.itemid ~= 0 then
if not isInArray(tapetes,clean8.itemid) and (not isPlayer(clean8.uid)) then
count = getThingFromPos(cleanpos8).type
doRemoveItem(clean8.uid,count)
doSendMagicEffect(cleanpos8,13)
end
end

if clean9.itemid ~= 0 then
if not isInArray(tapetes,clean9.itemid) and (not isPlayer(clean9.uid)) then
count = getThingFromPos(cleanpos9).type
doRemoveItem(clean9.uid,count)
doSendMagicEffect(cleanpos9,13)
end
end




















doRemoveItemIdFromPos(5569, 1, tapetepos1)
doRemoveItemIdFromPos(5570, 1, tapetepos2)
doRemoveItemIdFromPos(5571, 1, tapetepos3)
doRemoveItemIdFromPos(5572, 1, tapetepos4)
doRemoveItemIdFromPos(5573, 1, tapetepos5)
doRemoveItemIdFromPos(5574, 1, tapetepos6)
doRemoveItemIdFromPos(5575, 1, tapetepos7)
doRemoveItemIdFromPos(5576, 1, tapetepos8)
doRemoveItemIdFromPos(5577, 1, tapetepos9)






if xao1.itemid == 460 then
doRemoveTile(tapetepos1)
end
if xao2.itemid == 460 then
doRemoveTile(tapetepos2)
end
if xao3.itemid == 460 then
doRemoveTile(tapetepos3)
end
if xao4.itemid == 460 then
doRemoveTile(tapetepos4)
end
if xao5.itemid == 460 then
doRemoveTile(tapetepos5)
end
if xao6.itemid == 460 then
doRemoveTile(tapetepos6)
end
if xao7.itemid == 460 then
doRemoveTile(tapetepos7)
end
if xao8.itemid == 460 then
doRemoveTile(tapetepos8)
end
if xao9.itemid == 460 then
doRemoveTile(tapetepos9)
end


 if getTileThingByPos(nextpos1).uid == 0 then 
doCreateTile(460,nextpos1)
end
if getTileThingByPos(nextpos2).uid == 0 then 
doCreateTile(460,nextpos2)
end
if getTileThingByPos(nextpos3).uid == 0 then 
doCreateTile(460,nextpos3)
end
if getTileThingByPos(nextpos4).uid == 0 then 
doCreateTile(460,nextpos4)
end
if getTileThingByPos(nextpos5).uid == 0 then 
doCreateTile(460,nextpos5)
end
if getTileThingByPos(nextpos6).uid == 0 then 
doCreateTile(460,nextpos6)
end
if getTileThingByPos(nextpos7).uid == 0 then 
doCreateTile(460,nextpos7)
end
if getTileThingByPos(nextpos8).uid == 0 then 
doCreateTile(460,nextpos8)
end
if getTileThingByPos(nextpos9).uid == 0 then 
doCreateTile(460,nextpos9)
end




 doCreateItem(5569,1,nextpos1)
doCreateItem(5570,1,nextpos2)  
doCreateItem(5571,1,nextpos3) 
doCreateItem(5572,1,nextpos4) 
doCreateItem(5573,1,nextpos5) 
doCreateItem(5574,1,nextpos6) 
doCreateItem(5575,1,nextpos7) 
doCreateItem(5576,1,nextpos8) 
doCreateItem(5577,1,nextpos9)




if isPlayer(player1.uid) then
doTeleportThing(player1.uid,nextpos1,0)
end
if isPlayer(player2.uid) then
doTeleportThing(player2.uid,nextpos2,0)
end
if isPlayer(player3.uid) then
doTeleportThing(player3.uid,nextpos3,0)
end
if isPlayer(player4.uid) then
doTeleportThing(player4.uid,nextpos4,0)
end
if isPlayer(player5.uid) then
doTeleportThing(player5.uid,nextpos5,0)
end
if isPlayer(player6.uid) then
doTeleportThing(player6.uid,nextpos6,0)
end
if isPlayer(player7.uid) then
doTeleportThing(player7.uid,nextpos7,0)
end
if isPlayer(player8.uid) then
doTeleportThing(player8.uid,nextpos8,0)
end
if isPlayer(player9.uid) then
doTeleportThing(player9.uid,nextpos9,0)
end


--- VOA ------------ ------------------------------------------------------------------------------------
 
 
 
 
 




 
      
             if getGlobalStorageValue(5601) == 1 then
              cp = {x=cp.x-sqms,y=cp.y,z=cp.z,stackpos=0}
              elseif getGlobalStorageValue(5601) == 2 then
              cp = {x=cp.x+sqms,y=cp.y,z=cp.z,stackpos=0}
              elseif getGlobalStorageValue(5601) == 3 then
              cp = {x=cp.x,y=cp.y-sqms,z=cp.z,stackpos=0}
              elseif getGlobalStorageValue(5601) == 4 then
              cp = {x=cp.x,y=cp.y+sqms,z=cp.z,stackpos=0}
              end
      

              parametro = {cp=cp,togo=togo}
              

addEvent(voa,velocidade,parametro)


       else
       
       parametro = {cp=cp}
       
        addEvent(tapete,velocidade,parametro)
status = getGlobalStorageValue(5600)
setGlobalStorageValue(5600,status+1)
end
       
       


end




   
   
   
      
      
      
      
      
      
      
      
 function decola(parametro)
 cp = parametro.cp
  xismin = cp.x-1
 xismax = cp.x+1
 ypsmin = cp.y-1
 ypsmax = cp.y+1
 zee = cp.z


for x=xismin,xismax do
for y=ypsmin,ypsmax do
ppos = {x=x,y=y,z=zee,stackpos=1}
pos = getThingfromPos(ppos)
playerpos = {x=x,y=y,z=zee,stackpos=253}
player = getThingfromPos(playerpos)
pxao = {x=x,y=y,z=zee,stackpos=0}
xao = getThingfromPos(pxao)




nextpos = {x=ppos.x,y=ppos.y,z=ppos.z-1,stackpos=0}




if getTileThingByPos(nextpos).uid == 0 then 
doCreateTile(460,nextpos)
end
doCreateItem(pos.itemid,1,nextpos)
doRemoveItem(pos.uid,1)
if xao.itemid == 460 then
doRemoveTile(ppos)
end


if isPlayer(player.uid) then
doTeleportThing(player.uid,nextpos)
end

end
end 
cp = {x=cp.x,y=cp.y,z=cp.z-1}


              parametro = {cp=cp}
              if cp.z == 0 then
addEvent(tapete,velocidade,parametro)
status = getGlobalStorageValue(5600)
setGlobalStorageValue(5600,status+1)
else
 addEvent(decola,velocidade,parametro)
 end


end


function pousa(parametro)
cp = parametro.cp
  xismin = cp.x-1
 xismax = cp.x+1
 ypsmin = cp.y-1
 ypsmax = cp.y+1
 zee = cp.z
    
for x=xismin,xismax do
for y=ypsmin,ypsmax do
ppos = {x=x,y=y,z=zee,stackpos=1}
pos = getThingfromPos(ppos)
playerpos = {x=x,y=y,z=zee,stackpos=253}
player = getThingfromPos(playerpos)
pxao = {x=x,y=y,z=zee,stackpos=0}
xao = getThingfromPos(pxao)

nextpos = {x=ppos.x,y=ppos.y,z=ppos.z+1}
if getTileThingByPos(nextpos).uid == 0 then 
doCreateTile(460,nextpos)
end
doCreateItem(pos.itemid,1,nextpos)
doRemoveItem(pos.uid,1)
if xao.itemid == 460 then
doRemoveTile(ppos)
end
if isPlayer(player.uid) then
doTeleportThing(player.uid,nextpos)
end

end
end

cp = {x=cp.x,y=cp.y,z=cp.z+1}

              parametro = {cp=cp}
              
                if cp.z == 5 then
addEvent(tapete,velocidade,parametro)
status = getGlobalStorageValue(5600)
setGlobalStorageValue(5600,status+1)

else
 addEvent(pousa,velocidade,parametro)
 end

end      
      
function doCreateTile(id,pos) -- By mock
    doAreaCombatHealth(0,0,pos,0,0,0,CONST_ME_NONE)
    doCreateItem(id,1,pos)
end

function doRemoveTile(pos)-- Script by mock
    pos.stackpos = 0
    local sqm = getTileThingByPos(pos)
    doRemoveItem(sqm.uid,1)
end

function doRemoveItemIdFromPos(id, n, position)-- Script by Ciroc
    local thing = getThingFromPos({x = position.x, y = position.y, z = position.z, stackpos = 1})
    if(thing.itemid ~= id) then
        return false
    end

    doRemoveItem(thing.uid, n)
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
