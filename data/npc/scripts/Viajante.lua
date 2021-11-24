local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 		 	end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)   		end
function onCreatureSay(cid, type, msg) 	NpcSystem.parseParameters(npcHandler,cid)	npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	local msg = string.lower(msg)

	if not getTilePzInfo(getCreaturePosition(cid)) then
		doPlayerSendCancel(cid,"Você Não pode viajar fora da area PZ.")
		return false
	end
	
	if getPlayerLevel(cid) < 150 then
	selfSay('Você precisa ser level maior que 150 para viajar.', cid)
	return false
	end



	if msgcontains(msg, 'pvp city') and getTilePzInfo(getCreaturePosition(cid)) then
		if(doPlayerRemoveMoney(cid, 50)) then
			doTeleportThing(cid, {x = 182, y = 84 , z = 6})
			selfSay('Olha Você aqui.', cid)
		else
			selfSay('Desculpe, Você não tem dinheiro suficiente.', cid)
		end

	end

	if msgcontains(msg, 'morgum') and getTilePzInfo(getCreaturePosition(cid)) then
		if(doPlayerRemoveMoney(cid, 50)) then
			doTeleportThing(cid, {x = 2507, y = 129, z = 7})
			selfSay('Olha Você aqui.', cid) 
		else
			selfSay('Desculpe, Você não tem dinheiro suficiente.', cid)
		end
	end
	
	
		if msgcontains(msg, 'venom') and getTilePzInfo(getCreaturePosition(cid)) then
		if(doPlayerRemoveMoney(cid, 50)) then
			doTeleportThing(cid, {x = 2912, y = 2918, z = 6})
			selfSay('Olha Você aqui.', cid)
		else
			selfSay('Desculpe, Você não tem dinheiro suficiente.', cid)
		end
	end
	
		if msgcontains(msg, 'al druhn') and getTilePzInfo(getCreaturePosition(cid)) then
		if(doPlayerRemoveMoney(cid, 50)) then
			doTeleportThing(cid, {x = 1288, y = 543, z = 5})
			selfSay('Olha Você aqui.', cid)
		else
			selfSay('Desculpe, Você não tem dinheiro suficiente.', cid)
		end
	end
	
	
		if msgcontains(msg, 'port hope') and getTilePzInfo(getCreaturePosition(cid)) then
		if(doPlayerRemoveMoney(cid, 50)) then
			doTeleportThing(cid, {x = 155, y = 202, z = 6})
			selfSay('Olha Você aqui.', cid)
		else
			selfSay('Desculpe, Você não tem dinheiro suficiente.', cid)
		end
	end
	
		if msgcontains(msg, 'roshamuul') and getTilePzInfo(getCreaturePosition(cid)) then
		if(doPlayerRemoveMoney(cid, 50)) then
			doTeleportThing(cid, {x = 33291, y = 31686, z = 7})
			selfSay('Olha Você aqui.', cid)
		else
			selfSay('Desculpe, Você não tem dinheiro suficiente.', cid)
		end
	end
	
		if msgcontains(msg, 'gengia') and getTilePzInfo(getCreaturePosition(cid)) then
		if(doPlayerRemoveMoney(cid, 50)) then
			doTeleportThing(cid, {x = 2388, y = 3291, z = 6})
			selfSay('Olha Você aqui.', cid)
		else
			selfSay('Desculpe, Você não tem dinheiro suficiente.', cid)
		end
	end
	

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())