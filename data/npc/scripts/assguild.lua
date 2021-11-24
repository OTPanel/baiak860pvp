--[[
            SISTEMA DE CAÇADOR DE RECOMPENSAS FEITO POR LEORIC [OMEGA]
]]--

local nme = getCreatureName(getNpcCid())

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 		  	end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)    	end
function onCreatureSay(cid, type, msg) 	NpcSystem.parseParameters(npcHandler,cid)	npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local playerReward = getPlayerStorageValue(cid, bountyReward)
	local points = getPlayerStorageValue(cid, bountyPoints) > 0 and getPlayerStorageValue(cid, bountyPoints) or 0
	
	if msgcontains(msg,'assassin guild') then
		selfSay("Sim, eu sou o líder da Guild dos Assassinos. Você quer dar {hunted} em alguém, ver os players {mais procurados} ou quer {informações} sobre o sistema?",cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 then
		if msgcontains(msg,'hunted') then
			selfSay("Muito bem... Me diga o {nome} do jogador que você quer dar hunted",cid)
			talkState[talkUser] = 2
		elseif isInArray({"informações","informaçoes","informacoes","information"},msg) then
			selfSay("É muito simples: você me diz o nome e me dá o dinheiro que eu coloco um prêmio pela cabeça desse jogador e quem matar ele recebe o dinheiro. Você pode conferir nestes quadros ao meu lado quem são os caçadores de recompensa ativos e quais jogadores estão hunted.",cid)
		elseif isInArray({'mais procurados','most wanted'},msg) then
			local players = getTopBounties(10)
			local names = {}
			local str = ''
			if not players then
				selfSay("Ninguém está hunted neste momento.",cid)
				return true
			end
			for index, pid in ipairs(players) do
				if getPlayerNameByGUID(pid) then
					table.insert(names,'{'..index..'} '..getPlayerNameByGUID(pid)..' ['.. getPlayerBounty(getPlayerNameByGUID(pid)) ..'kk]\n')
				end
			end
			str = table.concat(names)
			doPlayerPopupFYI(cid, str)
		end			
	elseif talkState[talkUser] == 2 then
		if not playerExist(msg) then
			selfSay("Este jogador não existe! Me diga um nome certo!",cid)
		elseif string.lower(msg) == string.lower(getCreatureName(cid)) then
			selfSay("Você não pode dar hunted em si mesmo, está louco?!", cid)
		else
			playername = {}
			playername[cid] = msg
			selfSay("Muito bem, o valor mínimo para um hunted é de "..bountyConfig.min.." e eu cobro uma taxa de "..bountyConfig.fee.."% pelo serviço. Quanto de dinheiro você quer oferecer pela cabeça deste jogador?",cid)
			talkState[talkUser] = 3
		end
	elseif talkState[talkUser] == 3 then
		if tonumber(msg) ~= nil and tonumber(msg) and tonumber(msg) >= bountyConfig.min then
			bounty = tonumber(msg)
			if doPlayerRemoveMoney(cid, bounty) then
				doPlayerAddBounty(playername[cid], math.ceil(((1-(bountyConfig.fee/100))* (bounty/1000000))))
				setGlobalStorageValue(tonumber(getPlayerGUIDByName(playername[cid]))+20000, getPlayerGUIDByName(getCreatureName(cid)))				
				selfSay("Você deu hunted no jogador "..playername[cid].." com sucesso.",cid)
				selfSay("Você gostaria de algo mais? Como dar {hunted} em outra pessoa, checar os jogadores {mais procurados} ou algumas {informações} sobre o sistema?",cid)
				playername[cid] = nil
				talkState[talkUser] = 1
			else
				selfSay("Você não pode me enganar! Se você não tem dinheiro, nada de hunted!",cid)
				talkState[talkUser] = 1
			end
		else
			selfSay("Você precisa me dar um valor de verdade meu amigo... E precisa ser maior que "..bountyConfig.min..".",cid)
		end
	end			
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())