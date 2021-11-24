local area_entrance = {x = 13705, y = 2295, z = 7}
local nme = getCreatureName(getNpcCid())

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)        npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)  NpcSystem.parseParameters(npcHandler,cid) npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()              npcHandler:onThink()            end
function onPlayerEndTrade(cid)        npcHandler:onPlayerEndTrade(cid)      end
function onPlayerCloseChannel(cid)      npcHandler:onPlayerCloseChannel(cid)    end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)

	if isInArray({'como funciona','how it works'},msg) then
    	selfSay(gm(cid,nme,1),cid)
	elseif isInArray({'entrar','enter'},msg) then
    	if getPlayerLevel(cid) >= 400 then
      		selfSay(gm(cid,nme,2),cid)
      		talkState[talkUser] = 10
   		else
     		selfSay(gm(cid,nme,3),cid)
    	end
	elseif agreeNPC(msg) and talkState[talkUser] == 10 then
    	local storage = getPlayerStorageValue(cid,722532)
    	if (os.time() - tonumber(storage)) >= 86400 then
        	if doPlayerRemoveMoney(cid,500000000) then
        		  doTeleportThing(cid,area_entrance)
          			doPlayerSetStorageValue(cid,722532,os.time())
          			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,gm(cid,nme,4))
        	else
          		selfSay(gm(cid,nme,5),cid)
        	end
    	else
        	selfSay(gm(cid,nme,6).." ".. timeString((86400 - ((os.time() - tonumber(storage)))), getPlayerStorageValue(cid,language) == "en" and true or false) ..".",cid)
    	end

	elseif disagreeNPC(msg) and talkState[talkUser] == 10 then
    	selfSay(gm(cid,nme,7),cid)
	end
   
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())