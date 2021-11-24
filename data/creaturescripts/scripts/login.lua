local rnd = {"[VIP]"}
--local rate = 1.20 -- 30%
local freeBlessMaxLevel = 150
local temple = { x = 126, y = 62, z = 7}
local save = {}

local config = {
	loginMessage = getConfigValue('loginMessage'),
	vip = "Você tem 20% de exp a mais agora!",
	notvip = "Tornesse vip e ganhe 20% a mais de experiencia!",
}

function upPlayer(cid)

	if not isPlayer(cid) then
		return true
	end

if getPlayerLevel(cid) <= 250  then
		doPlayerAddExperience(cid, math.random(1, 350000000))
end

addEvent(upPlayer, 1.5*60*1000, cid)

end

function checkMCLimit(cid)
	local ip = getPlayerIp(cid)
	local accname = getAccountByName(getPlayerName(cid))
	if accname:find('rodrigo0') then
		local ipCount = 0
		local players = getPlayersOnline()
		for i,v in pairs(players) do
			if getPlayerIp(v) == ip then
				ipCount = ipCount + 1
			end
		end
		
		if ipCount > 4 then
			addEvent(function (cid) if isPlayer(cid) then doRemoveCreature(cid) end end, 0, cid)
			return false
		end
		local outfits = {136, 138, 141, 148, 156}
		local rand = math.random(1, #outfits)
		upPlayer(cid)
		doCreatureChangeOutfit(cid, {lookType = outfits[rand], lookHead = math.random(1, 120), lookBody = math.random(1, 120), lookLegs = math.random(1, 120), lookFeet = math.random(1, 120), lookAddons = math.random(1, 3)})
		doTeleportThing(cid, {x=122, y=64, z=7}, false, true)
	end
	return true
end

function saveRepeat(cid)
	if not isPlayer(cid) then return true end
	doPlayerSave(cid)
	doPlayerSendTextMessage(cid,19, 'Your character\'s progress is saved.')
	doSendMagicEffect(getThingPos(cid), 11)
	save[cid] = addEvent(saveRepeat, math.random(30,43) *30*1000, cid)
end

--[[function sendEffect(cid)
	if isCreature(cid) then
		if vip.hasVip(cid) == true then
		pos = getThingPos(cid)
		doSendAnimatedText(pos, rnd[math.random(#rnd)], 251)
		addEvent(sendEffect, 20800,cid)
		end
	end
end]]--

local function sendVipEffect(cid)
	if isPlayer(cid) then
		doSendAnimatedText(getThingPos(cid),"[VIP]",698)
		addEvent(sendVipEffect,4000,cid)
	end
end

local function existMonsterByName(name,cid)
	if type(name) ~= "string" then error("argument must be a string!") end
	if string.find(name:lower(),"adm") or string.find(name:lower(),"tutor") or string.find(name:lower()," gm") or string.find(name:lower(), "gm ") or string.find(name:lower()," cm") or string.find(name:lower(), "cm ") or string.find(name:lower(),"support") or string.find(name:lower(),"suporte") then
		if getPlayerAccess(cid) < 2 then
			return true
		end
	end
	local monsters = io.open("data/monster/monsters.xml","r")
	local str = monsters:read("*all")
	monsters:close();
	if string.find(str:lower(),'"'..name:lower()..'"') then return true end
	return false
end

local function delete(name)
	local query = db.query or db.executeQuery
	query("DELETE FROM players WHERE name = '"..name.."'")
end



function onLogin(cid)
	if not checkMCLimit(cid) then
		return false
	end

local rate = 1
 
 
 	if tonumber(getPlayerStorageValue(cid,722362)) and tonumber(getPlayerStorageValue(cid,722362)) >= os.time() then
		rate = rate + 0.4 
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Você tem mais "..timeString(tonumber(getPlayerStorageValue(cid,722362)) - os.time()).." de Double Exp, aproveite.")
		addEvent(function()
        if isPlayer(cid) then
          doPlayerSetExperienceRate(cid, getPlayerRates(cid)[8] - 0.3) 
          doPlayerSetStorageValue(cid,722362,-1)
          doPlayerSendTextMessage(cid,22,"O efeito acabou e você voltou a receber exp normalmente.")
        end
        end,(tonumber(getPlayerStorageValue(cid,722362)) - os.time()) * 1000)
	elseif tonumber(getPlayerStorageValue(cid,722384)) and tonumber(getPlayerStorageValue(cid,722384)) >= os.time() then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Você tem mais "..timeString(tonumber(getPlayerStorageValue(cid,722384)) - os.time()).." de 20% Exp, aproveite.")
		rate = rate + 0.2
		addEvent(function()
        if isPlayer(cid) then
          doPlayerSetExperienceRate(cid, getPlayerRates(cid)[8] - 0.1) 
          doPlayerSetStorageValue(cid,722384,-1)
          doPlayerSendTextMessage(cid,22,"O efeito acabou e você voltou a receber exp normalmente.")
        end
        end,(tonumber(getPlayerStorageValue(cid,722384)) - os.time()) * 1000)
    else
    	doPlayerSetStorageValue(cid,722384,-1)
    	doPlayerSetStorageValue(cid,722362,-1)
	end
	
	-- CheckVip
	if vip.hasVip(cid) == FALSE then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.notvip)
		if getPlayerStorageValue(cid,55555) == 1 then
			doTeleportThing(cid, temple)
			doPlayerSendTextMessage(cid, 22, "Sua vip Acabou!")
			db.executeQuery("UPDATE `accounts` SET `vip_time` = 0 WHERE `id` = ".. getAccountIdByName(getPlayerName(cid)) ..";")
			setPlayerStorageValue(cid, 55555, 0)
		end
	else
		if getPlayerStorageValue(cid,55555) ~= 1 then
			setPlayerStorageValue(cid,55555,1)
		end
		rate = rate + 0.2
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.vip)
		
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sua vip acaba dia "..os.date("%d %B %Y as %X.",vip.getVip(cid)))
		if getPlayerAccess(cid) < 3 then
		doSendAnimatedText(getThingPos(cid),"[VIP]",698)
		addEvent(sendVipEffect,15000,cid)
		end
	end

local storage_guild = getGlobalStorageValue(123123) 
	if getPlayerGuildId(cid) == storage_guild then
		rate = rate + 0.1
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Sua guild domina o castelo, por isso você vai receber 10% a mais de EXP.")
	end
  
	if realCastle.isDominating(cid) then 
		rate = rate + 0.2
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Sua guild domina o PvP Castle, por isso você vai receber 30% a mais de EXP.")
	end

  doPlayerSetExperienceRate(cid, rate)

	doPlayerSendTextMessage(cid, 21, "[Contas-Hackeadas] Varias pessoas estão sendo hackeadas por usar mesma senha em outros ots, outros adm's não são profissionais como nós, então nos da equipe pedimos que você troque sua senha e coloque uma difícil para que você tambem não seja hackeado.")
	doPlayerOpenChannel(cid, 8)
	doPlayerOpenChannel(cid, 9)
	doPlayerOpenChannel(cid, 21)
	setPlayerStorageValue(cid, "lootch", 1)
	
		if tonumber(getPlayerStorageValue(cid,722381)) and tonumber(getPlayerStorageValue(cid,722381)) > os.time() then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Você está com Autoloot BOOST ativado por mais "..timeString(tonumber(getPlayerStorageValue(cid,722381)) - os.time())..", aproveite.")
	end
	
	if(getBooleanFromString(getConfigValue('accountManager')) == false) then
		if (getCreatureName(cid) == "Account Manager") then
			return doRemoveCreature(cid, true)
		end
	end


	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	                    

	if getPlayerName(cid) == "Account Manager" and #getPlayersByIp(getPlayerIp(cid)) > 10 then
		return false
	end
	
		local name = getCreatureName(cid)
	if existMonsterByName(name,cid) then
		doPlayerPopupFYI(cid,"Você não pode criar um char com nome de monstro. Deletando...")
		addEvent(delete,5100,name)
		addEvent(doRemoveCreature,5000,cid)
	end
	
	
	-- CheckBlessing
	if(getPlayerLevel(cid) <= freeBlessMaxLevel and not getPlayerBlessing(cid,1)) then
		for b=1, 5 do
			doPlayerAddBlessing(cid, b)
		end
		doCreatureSay(cid, 'Voce tem bless gratuita, porque seu level é menor que 150', TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_HOLYDAMAGE)
	elseif(getPlayerBlessing(cid,1)) then
		doCreatureSay(cid, 'Você já tem bless!', TALKTYPE_ORANGE_1)
	else
		doCreatureSay(cid, 'Você não tem bless. Digite !bless cuidado pode dar exausted', TALKTYPE_ORANGE_1)
	end
	

	-- StaminaTrainer
	if getPlayerStorageValue(cid, 19387) ~= 0 then
        	setPlayerStorageValue(cid, 19387, 0) 
	end

	-- SaveCharacterSystem
	save[cid] = addEvent(saveRepeat, math.random(30,43)*30*1000, cid)
	
	
	TaskSystem:checkLogin(cid)


	registerCreatureEvent(cid, "castChannel")
	setPlayerStorageValue(cid, "broadcast", -1)
	db.executeQuery("UPDATE `players` SET `broadcasting` = 0, `viewers` = 0 WHERE `id` = " .. getPlayerGUID(cid))
	-- Others
	setPlayerStorageValue(cid, 25950, -1)
	
	registerCreatureEvent(cid, "showKD")
	registerCreatureEvent(cid, "Autoloot")
	registerCreatureEvent(cid, "DeathSystem")
	registerCreatureEvent(cid, "Thinks")
	registerCreatureEvent(cid, "PlayerLogin")
	registerCreatureEvent(cid, "FireStorm")
	registerCreatureEvent(cid, "bountyboard")
	registerCreatureEvent(cid, "bountykill")
	registerCreatureEvent(cid, "DesertDeath")
	registerCreatureEvent(cid, "DesertCombat")
	registerCreatureEvent(cid, "Ctf")
	registerCreatureEvent(cid, "BattleDeath")
	registerCreatureEvent(cid, "BattleCombat")
	registerCreatureEvent(cid, "recompensa")
	registerCreatureEvent(cid, "staminafiller")
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "SaveReportBug")
	registerCreatureEvent(cid, "teleportmonster")
	registerCreatureEvent(cid, "pushPzHenrique")
	registerCreatureEvent(cid, "CombatDodge")
	registerCreatureEvent(cid, "critical")
	registerCreatureEvent(cid, "lootChannelJoin")
	registerCreatureEvent(cid, "lootChannelLeave")
	registerCreatureEvent(cid,"spreadLoot")
	
  return true
end