local nme = "wand"
local storage = 722656

local storages = {
	
	["ice"] = 10,
	["earth"] = 11,
	["holy"] = 12,
	["energy"] = 13,
	["cake"] = 14,
	["fire"] = 15,
	["death"] = 16

}

local effects = {
	
	[10] = {dist = CONST_ANI_ICE, hit = CONST_ME_ICEATTACK},
	[11] = {dist = CONST_ANI_EARTH, hit = CONST_ME_CARNIPHILA},
	[12] = {dist = CONST_ANI_HOLY, hit = CONST_ME_HOLYDAMAGE},
	[13] = {dist = CONST_ANI_ENERGYBALL, hit = CONST_ME_PURPLEENERGY},
	[14] = {dist = CONST_ANI_CAKE, hit = CONST_ME_CAKE},
	[15] = {dist = CONST_ANI_FIRE, hit = CONST_ME_FIREATTACK},
	[16] = {dist = CONST_ANI_SUDDENDEATH, hit = CONST_ME_MORTAREA}

}

function onSay(cid, words, param)

	if not param or param == "" then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Wand Effect] Os efeitos disponíveis para a Real Staff são:\n\n!wand ice\n!wand holy\n!wand energy\n!wand fire\n!wand cake\n!wand earth\n!wand death")
		return true
	end

	local value = storages[param:lower()]
	if value then
		if (isSorcerer(cid) or isDruid(cid)) and getPlayerItemCount(cid, 12288) > 0 then
			if value ~= getCreatureStorage(cid, storage) then
				if getCreatureStorage(cid, 722657) < os.time() then
					doCreatureSetStorage(cid, storage, value)
					doSendMagicEffect(getThingPos(cid), effects[value].hit)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Wand Effect] Você alterou o efeito da sua wand para "..param:lower().."!")
					doCreatureSetStorage(cid, 722657, os.time() + 10)
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Wand Effect] Aguarde um pouco antes de mudar o efeito novamente.")
					doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Wand Effect] O efeito da sua wand já está definido como "..param:lower()..".")
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Wand Effect] Somente sorcerers e druid que possuam uma Real Staff podem setar um efeito.")
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este efeito não está disponível, use !wand para ver todos os efeitos.")
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	end
	return true
end
