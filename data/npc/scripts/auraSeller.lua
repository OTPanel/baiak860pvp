local real_token = 12637
local storage = 722422
local nme = "Aura Seller"

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 		  	end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)   	end
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

	if msgcontains(msg,'aura') then
		selfSay(gm(cid,nme,1),cid)
		talkState[talkUser] = 10
	elseif msgcontains(msg,'real token') or msgcontains(msg,'real tokens') then
		selfSay(gm(cid,nme,2),cid)
	elseif agreeNPC(msg) and talkState[talkUser] == 10 then
		if getPlayerStorageValue(cid,storage) == -1 then
			if doPlayerRemoveItem(cid,real_token,100) then
				doPlayerSetStorageValue(cid,storage,1)
				startAura(cid)
				selfSay(gm(cid,nme,3),cid)
			else
				selfSay(gm(cid,nme,4),cid)
			end
		else
			selfSay(gm(cid,nme,5),cid)
		end
	elseif disagreeNPC(msg) and talkState[talkUser] == 10 then
		selfSay(gm(cid,nme,6),cid)
	end
   
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())