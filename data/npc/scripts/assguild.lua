--[[
            SISTEMA DE CA�ADOR DE RECOMPENSAS FEITO POR LEORIC [OMEGA]
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
		selfSay("Sim, eu sou o l�der da Guild dos Assassinos. Voc� quer dar {hunted} em algu�m, ver os players {mais procurados} ou quer {informa��es} sobre o sistema?",cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 then
		if msgcontains(msg,'hunted') then
			selfSay("Muito bem... Me diga o {nome} do jogador que voc� quer dar hunted",cid)
			talkState[talkUser] = 2
		elseif isInArray({"informa��es","informa�oes","informacoes","information"},msg) then
			selfSay("� muito simples: voc� me diz o nome e me d� o dinheiro que eu coloco um pr�mio pela cabe�a desse jogador e quem matar ele recebe o dinheiro. Voc� pode conferir nestes quadros ao meu lado quem s�o os ca�adores de recompensa ativos e quais jogadores est�o hunted.",cid)
		elseif isInArray({'mais procurados','most wanted'},msg) then
			local players = getTopBounties(10)
			local names = {}
			local str = ''
			if not players then
				selfSay("Ningu�m est� hunted neste momento.",cid)
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
			selfSay("Este jogador n�o existe! Me diga um nome certo!",cid)
		elseif string.lower(msg) == string.lower(getCreatureName(cid)) then
			selfSay("Voc� n�o pode dar hunted em si mesmo, est� louco?!", cid)
		else
			playername = {}
			playername[cid] = msg
			selfSay("Muito bem, o valor m�nimo para um hunted � de "..bountyConfig.min.." e eu cobro uma taxa de "..bountyConfig.fee.."% pelo servi�o. Quanto de dinheiro voc� quer oferecer pela cabe�a deste jogador?",cid)
			talkState[talkUser] = 3
		end
	elseif talkState[talkUser] == 3 then
		if tonumber(msg) ~= nil and tonumber(msg) and tonumber(msg) >= bountyConfig.min then
			bounty = tonumber(msg)
			if doPlayerRemoveMoney(cid, bounty) then
				doPlayerAddBounty(playername[cid], math.ceil(((1-(bountyConfig.fee/100))* (bounty/1000000))))
				setGlobalStorageValue(tonumber(getPlayerGUIDByName(playername[cid]))+20000, getPlayerGUIDByName(getCreatureName(cid)))				
				selfSay("Voc� deu hunted no jogador "..playername[cid].." com sucesso.",cid)
				selfSay("Voc� gostaria de algo mais? Como dar {hunted} em outra pessoa, checar os jogadores {mais procurados} ou algumas {informa��es} sobre o sistema?",cid)
				playername[cid] = nil
				talkState[talkUser] = 1
			else
				selfSay("Voc� n�o pode me enganar! Se voc� n�o tem dinheiro, nada de hunted!",cid)
				talkState[talkUser] = 1
			end
		else
			selfSay("Voc� precisa me dar um valor de verdade meu amigo... E precisa ser maior que "..bountyConfig.min..".",cid)
		end
	end			
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())