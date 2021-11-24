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


local eventcoins = 6527
local priceInEventCoins = 600
local positionEnterQuest = {x = 8498, y = 14880, z = 11}
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


	if msgcontains(msg, 'vamos la') and getTilePzInfo(getCreaturePosition(cid)) then
		if getPlayerItemCount(cid,eventcoins) < priceInEventCoins then
			selfSay("Você precisa de " .. priceInEventCoins .. " Event Coins para poder entrar na quest.", cid)
		else
			doPlayerRemoveItem(cid,eventcoins,priceInEventCoins)
			doTeleportThing(cid, positionEnterQuest)
			doSendMagicEffect(getThingPos(cid), 10)
			selfSay('Agora é com você tenha uma boa sorte, caso você morra será obrigado a pagar os '..priceInEventCoins..' Event Coins novamente.', cid)
			end
		return true
	end



	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())