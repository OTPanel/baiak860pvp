local talkState = {}
local focus, old_focus = 0, 0 
local money_pos = {x=490,y=627,z=6}
local player_pos = {x=491,y=627,z=6}
local depot_pos = {x=489,y=626,z=6}
local nme = "Cassino"

function msgcontains(txt, str) 
	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)')) 
end 
 
function onCreatureSay(cid, type, msg) 
	local msg = string.lower(msg) 
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid 

	local function rollDice(cid,ammount,bet)
		doCleanTile(depot_pos)
		doSendMagicEffect(depot_pos,CONST_ME_CRAPS)
		local win = bet == "l" and {1,2,3} or {4,5,6}
		local lose = bet == "l" and {4,5,6} or {1,2,3}
		local roll = math.random(8)
		if isInArray(win,roll) then
			doCreatureSay(getNpcId(),"Cassino rolled a "..roll,TALKTYPE_MONSTER_SAY)
			doPlayerAddMoney(cid,math.abs(ammount * 2) * 1000000)
			doCreatureSay(getNpcId(),"Muito bem, você ganhou! Aqui estão seus ".. math.abs(ammount * 2) .."kks, parabéns!", TALKTYPE_MONSTER_SAY)
			addEvent(doSendMagicEffect,300,depot_pos,28)
		else
			local msg = roll > 6 and lose or {roll}
			local number = msg[math.random(#msg)]
			doCreatureSay(getNpcId(),"Cassino rolled a "..number,TALKTYPE_MONSTER_SAY)
			doCreatureSay(getNpcId(),"Que pena, você perdeu! Mais sorte na próxima hehehe!", TALKTYPE_MONSTER_SAY)
			addEvent(doSendMagicEffect,300,depot_pos,3)
		end
	end
 
	if isInArray({"l","h"},msg) and focus == cid then
		local money = getTileItemById(money_pos,9971)
		if money and money.uid and money.uid > 0 then
			if money.type <= 50 then
				doCleanTile(money_pos)
				doCreateItem(9971,money.type,depot_pos)
				addEvent(rollDice,800,cid,money.type,msg)
			else
				doCreatureSay(getNpcId(),"O valor máximo da aposta é de 50kk!", TALKTYPE_MONSTER_SAY)
			end
		else
			doCreatureSay(getNpcId(),"Você precisa colocar aqui no meio o dinheiro que quer apostar! Lembre-se que o mínimo é 1kk (Real Coin) e o máximo 50kk!", TALKTYPE_MONSTER_SAY)
		end
	end 
end

function onThink()

	local player = getTopCreature(player_pos)
	if player and player.uid and player.uid > 0 and isPlayer(player.uid) then
		if old_focus ~= player.uid then
			if getPlayerStorageValue(player.uid,722514) < os.time() then
				doCreatureSay(getNpcId(),"Olá, "..getCreatureName(player.uid).."! Para jogar diga H ou L (L = 1,2,3 e H = 4,5,6)", TALKTYPE_MONSTER_SAY)
				doPlayerSetStorageValue(player.uid,722514,os.time()+120)
			end
			doPlayerSetStorageValue(player.uid,722515,os.time()+120)
		end
		if getPlayerStorageValue(player.uid,722515) < os.time() then
			doTeleportThing(player.uid,getTownTemplePosition(1))
			doPlayerSendTextMessage(player.uid,MESSAGE_STATUS_CONSOLE_BLUE," Você ficou muito tempo ocupando o cassino e foi teleportado!")
			old_focus = 0
		end
 		focus = player.uid
	else
		old_focus = focus and focus or old_focus
		focus = nil
		if getGlobalStorageValue(722511) < os.time() then
			doCreatureSay(getNpcId(),"Venha tentar a sua sorte! Diga L para apostar entre 1 e 3 ou H para apostar entre 4 e 6, se ganhar você recebe o DOBRO do que apostou!", TALKTYPE_MONSTER_SAY)
			setGlobalStorageValue(722511,os.time()+60)
		end
	end

end