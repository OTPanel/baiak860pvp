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

	if(msgcontains(msg, 'boots ek') or msgcontains(msg, 'boots kina')) then
		selfSay('Você precisa de 1 Fragmento Especial e uma boots de ek voce possui?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerItemCount(cid, 12706) >= 1) and (getPlayerItemCount(cid, 12649) >= 1) then
			if(doPlayerRemoveItem(cid, 12706, 1) == TRUE) and (doPlayerRemoveItem(cid, 12649, 1) == TRUE) then				
				doPlayerAddItem(cid, 12718)
				selfSay('Here you are.', cid)
			else
				selfSay('Desculpe, mas você não tem o material.', cid)
			end
		else
			selfSay('Desculpe, mas você não tem o material.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 2 or cid
	
	if(msgcontains(msg, 'boots pali') or msgcontains(msg, 'boots rp')) then
		selfSay('Você precisa de 1 Fragmento Especial e uma boots de rp voce possui?', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		if(getPlayerItemCount(cid, 12706) >= 1) and (getPlayerItemCount(cid, 12639) >= 1) then
			if(doPlayerRemoveItem(cid, 12706, 1) == TRUE) and (doPlayerRemoveItem(cid, 12639, 1) == TRUE) then				
				doPlayerAddItem(cid, 12719)
				selfSay('Here you are.', cid)
			else
				selfSay('Desculpe, mas você não tem o material.', cid)
			end
		else
			selfSay('Desculpe, mas você não tem o material.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 3 or cid
	
	if(msgcontains(msg, 'boots mage') or msgcontains(msg, 'boots ml')) then
		selfSay('Você precisa de 1 Fragmento Especial e uma boots de mage voce possui?', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		if(getPlayerItemCount(cid, 12706) >= 1) and (getPlayerItemCount(cid, 12644) >= 1) then
			if(doPlayerRemoveItem(cid, 12706, 1) == TRUE) and (doPlayerRemoveItem(cid, 12644, 1) == TRUE) then				
				doPlayerAddItem(cid, 12720)
				selfSay('Here you are.', cid)
			else
				selfSay('Desculpe, mas você não tem o material.', cid)
			end
		else
			selfSay('Desculpe, mas você não tem o material.', cid)
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
