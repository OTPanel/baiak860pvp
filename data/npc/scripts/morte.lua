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

	if(msgcontains(msg, 'missao') or msgcontains(msg, 'mission')) then
		setPlayerStorageValue(cid,22867,1)
		selfSay('Mate 30 jogadores level 200 mais e eu lhe entregarei uma surprise box. Você pode verificar seu progresso com o comando !mortes, ja matou? diga yes', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
	if getPlayerLevel(cid) >= 200 then
		if getPlayerStorageValue(cid,34766) < os.time() then
			if(getPlayerStorageValue(cid, 34765) >= 30) then				
				doPlayerAddItem(cid, 10503)
				setPlayerStorageValue(cid,34766, os.time()+(1*24*60*60))
				setPlayerStorageValue(cid,34765,0)
				setPlayerStorageValue(cid,22867,0)
				selfSay('Obrigado você pode fazer esta missão novamente amanha.', cid)
			else
				selfSay('Você ainda não cumprio o objetivo.', cid)
			end
		else
			selfSay('Você ja fez esta task em menos de 24 horas espere 1 dia e volte novamente.', cid)
		end
	else
		selfSay('Você precisa ser level superior a 200 para completar a missao.', cid)
	end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok bye.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())