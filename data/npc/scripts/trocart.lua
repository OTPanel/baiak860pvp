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

	if(msgcontains(msg, 'staff') or msgcontains(msg, 'wand')) then
		selfSay('Você precisa de 1 Fragmento Especial e uma bk staff +6 voce possui?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerItemCount(cid, 12706) >= 1) and (getPlayerItemCount(cid, 12665) >= 1) then
			if(doPlayerRemoveItem(cid, 12706, 1) == TRUE) and (doPlayerRemoveItem(cid, 12665, 1) == TRUE) then				
				doPlayerAddItem(cid, 12737)
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
	
	if(msgcontains(msg, 'sword') or msgcontains(msg, 'swords')) then
		selfSay('Você precisa de 1 Fragmento Especial e uma bk sword +6 voce possui?', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		if(getPlayerItemCount(cid, 12706) >= 1) and (getPlayerItemCount(cid, 12679) >= 1) then
			if(doPlayerRemoveItem(cid, 12706, 1) == TRUE) and (doPlayerRemoveItem(cid, 12679, 1) == TRUE) then				
				doPlayerAddItem(cid, 12736)
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
	
	if(msgcontains(msg, 'axe') or msgcontains(msg, 'axes')) then
		selfSay('Você precisa de 1 Fragmento Especial e um bk axe +6 voce possui?', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		if(getPlayerItemCount(cid, 12706) >= 1) and (getPlayerItemCount(cid, 12697) >= 1) then
			if(doPlayerRemoveItem(cid, 12706, 1) == TRUE) and (doPlayerRemoveItem(cid, 12697, 1) == TRUE) then				
				doPlayerAddItem(cid, 12734)
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
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 4 or cid
	
	if(msgcontains(msg, 'club') or msgcontains(msg, 'clubs')) then
		selfSay('Você precisa de 1 Fragmento Especial e um bk club +6 voce possui?', cid)
		talkState[talkUser] = 4
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
		if(getPlayerItemCount(cid, 12706) >= 1) and (getPlayerItemCount(cid, 12691) >= 1) then
			if(doPlayerRemoveItem(cid, 12706, 1) == TRUE) and (doPlayerRemoveItem(cid, 12691, 1) == TRUE) then				
				doPlayerAddItem(cid, 12735)
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
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 5 or cid
	
	if(msgcontains(msg, 'bow') or msgcontains(msg, 'bows')) then
		selfSay('Você precisa de 1 Fragmento Especial e um bk slingshot +6 voce possui?', cid)
		talkState[talkUser] = 5
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
		if(getPlayerItemCount(cid, 12706) >= 1) and (getPlayerItemCount(cid, 12685) >= 1) then
			if(doPlayerRemoveItem(cid, 12706, 1) == TRUE) and (doPlayerRemoveItem(cid, 12685, 1) == TRUE) then				
				doPlayerAddItem(cid, 12733)
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
