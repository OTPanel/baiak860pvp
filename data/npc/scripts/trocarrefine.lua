local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid	

	if(msgcontains(msg, 'refine') or msgcontains(msg, 'refines') or msgcontains(msg, 'refinar')) then
		selfSay('Realmente deseja trocar seus fragmentos pelo refine? Diga {yes}.', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerItemCount(cid, 12707) >= 7) then
			if(doPlayerRemoveItem(cid, 12707, 7) == TRUE) then				
				doPlayerAddItem(cid, 12706)
				selfSay('Here you are.', cid)
			else
				selfSay('Desculpe, mas você não tem 7 fragmentos.', cid)
			end
		else
			selfSay('Desculpe, mas você não tem 7 fragmentos.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
