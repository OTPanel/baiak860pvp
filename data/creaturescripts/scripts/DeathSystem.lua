--[[local monster = 'a morte' -- criatura
local timer = 3 -- quanto tempo vai demorar pra sumir

local function creatDeath(cid,pos)

	function removeMonster()
   		if isPlayer(cid) then
     		for _, pid in ipairs(getCreatureSummons(cid)) do
      		doRemoveCreature(pid)
     		end
    	end
   		return true
   	end

	if isWalkable(cid,pos,true) then
		doConvinceCreature(cid,doCreateMonster(monster,pos))
		addEvent(removeMonster,timer*1000)
	end
end]]

local exp_config = {
	
	{200, 299, 50000},
	{300, 399, 20000},
	{400, 499, 10000},
	{500, 599, 5000},
	{600, 9999999, 3000},

}

function onDeath(cid, corpse, killer)
 
local pos = getCreaturePosition(cid)
local level = getPlayerLevel(cid)
local player_ip = getPlayerIp(cid)
 

 
	if isPlayer(cid) and isPlayer(killer[1]) then
		if player_ip ~= getPlayerIp(killer[1]) then

			if getPlayerLevel(killer[1]) - level < 100 then -- PATENTE
				local patente = killua.getPatente(killer[1])
				killua.addKill(killer[1])
				local newPatente = killua.getPatente(killer[1])
				if patente ~= newPatente then
					reward = killua.getPatenteReward(killer[1])
					if reward then
						doSendMagicEffect(getThingPos(killer[1]),30)
						doSendAnimatedText(getThingPos(killer[1]),"Patente UP!",108)
						doPlayerSendTextMessage(killer[1],MESSAGE_EVENT_ADVANCE,"Você evoluiu para a patente "..newPatente.." e recebeu "..reward.."kks no seu banco!")
						doPlayerSetBalance(killer[1],getPlayerBalance(killer[1]) + (reward * 1000000))
					end
				end
			end
		else
			doPlayerSendTextMessage(killer[1], MESSAGE_STATUS_CONSOLE_ORANGE, "Fazer free kill é contra as regras e seu personagem pode ser deletado.")
		end

		if level >= 300 then -- PVP EXP SYSTEM
			local exp = 0
			for a, b in next, exp_config do
				if level >= b[1] and level <= b[2] then
					exp = b[3]
				end
			end
			for _, pid in next, killer do
				if isPlayer(pid) then
					if player_ip ~= getPlayerIp(pid) then
						local gained = math.random(exp - 1000, exp + 10000)
						doPlayerAddExp(pid,gained)
						gained = math.ceil(gained/1000)
						doSendAnimatedText(getThingPos(pid), "+"..gained.."k EXP", 155)
					end
				end
			end
		end

	   local tops = getGlobalTableStorage(722351)
	   if tops[1] and tops[2] then
	   		if string.lower(tops[1]) == string.lower(getCreatureName(cid)) then
	   			doBroadcastMessage("O jogador "..getCreatureName(killer[1]).." matou o top 1 do servidor ("..getCreatureName(cid)..") e ganhou 30kk!")	
	   			doPlayerAddMoney(killer[1],30000000)
	   		elseif string.lower(tops[2]) == string.lower(getCreatureName(cid)) then
	   			doBroadcastMessage("O jogador "..getCreatureName(killer[1]).." matou o top 2 do servidor ("..getCreatureName(cid)..") e ganhou 20kk!")
	   			doPlayerAddMoney(killer[1],20000000)
	   		end
	   	end
	   --addEvent(creatDeath,50,killer[1],pos)
	   doSendAnimatedText(getThingPos(cid), "DEATH", 19) -- O "death" é  a frase que irá aparece em cima do corpo
	   doSendMagicEffect(getThingPos(cid), 65)
	   for _,pid in pairs(getPlayersOnline()) do
	   		doPlayerSendChannelMessage(pid, "", "O jogador ".. getCreatureName(killer[1]) .." [".. getPlayerLevel(killer[1]) .."]  acabou de matar o noob " .. getCreatureName(cid) .. " [".. level .."]!", TALKTYPE_CHANNEL_HIGHLIGHT, 8)
	   end
	end
	return true
end
