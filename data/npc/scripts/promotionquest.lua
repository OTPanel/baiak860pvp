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



	if msgcontains(msg, 'quero ir') and getTilePzInfo(getCreaturePosition(cid)) then
		if(doPlayerRemoveMoney(cid, 15000000)) then
			doTeleportThing(cid, {x = 2814, y = 3545 , z = 4})
			selfSay('Olha Você aqui.', cid)
		else
			selfSay('Desculpe, Você não tem dinheiro suficiente.', cid)
		end

	end



	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())