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


local StorageTaskDemon = 2312115
local QuantMonsterDemon = 50000
local positionEnterQuest = {x = 6780, y = 5519, z = 10}
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	local msg = string.lower(msg)

	if msgcontains(msg, 'claro') and getTilePzInfo(getCreaturePosition(cid)) then
		if getPlayerStorageValue(cid,2312115) < QuantMonsterDemon then
			selfSay("Você precisa completar a task Demons do npc [TASK] Maria no Templo para poder entrar na quest.", cid)
		else
			doTeleportThing(cid, positionEnterQuest)
			doSendMagicEffect(getThingPos(cid), 10)
			selfSay('Agora é com você tenha uma boa sorte, e uma bela paciencia.', cid)
			end
		return true
	end



	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())