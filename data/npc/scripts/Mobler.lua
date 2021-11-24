local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

function firewalker(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	if getPlayerItemCount(cid, 10022) >= 1 and getPlayerItemCount(cid, 2160) > 1 then
		if doPlayerRemoveItem(cid, 10022, 1) and doPlayerRemoveItem(cid, 2160, 1) == true then
			npcHandler:say('Pronto, firewalker boots recarregada!', cid)
			doPlayerAddItem(cid, 9933, 1)
		end
	else
		npcHandler:say('Você não tem uma firewalker vazia ou está sem dinheiro!', cid)
	end
end

function soft(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
	if getPlayerItemCount(cid, 10021) >= 1 and getPlayerItemCount(cid, 2160) > 1 then
        if doPlayerRemoveItem(cid, 10021, 1) and doPlayerRemoveItem(cid, 2160, 1) == true then
            npcHandler:say('Pronto, soft boots recarregada!', cid)
            doPlayerAddItem(cid, 6132, 1)
        end
        else
            npcHandler:say('Você não tem uma soft vazia ou está sem dinheiro!', cid)
    end
end	
	

local node1 = keywordHandler:addKeyword({'firewalker'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você deseja recarregar sua firewalker boots por 10k?'})
    node1:addChildKeyword({'yes'}, firewalker, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, o que deseja então?', reset = true})

local node2 = keywordHandler:addKeyword({'soft'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você deseja recarregar sua soft boots por 10k??'})
    node2:addChildKeyword({'yes'}, soft, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, o que deseja então?', reset = true})

npcHandler:addModule(FocusModule:new())