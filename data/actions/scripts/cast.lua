function getPlayerList(cid)

	local result_plr = db.getResult("SELECT `name` FROM `players` WHERE `broadcasting` > 0")
	local names = ""
	local tabela = {}
    if(result_plr:getID() ~= -1) then
        while(true) do
		

			local name = result_plr:getDataString("name")
			local id = getCreatureByName(name)
			
			if id ~= nil then
			

				if  name ~= getCreatureName(cid) then
						--names = "-"..names..name .."{Lv. "..getPlayerLevel(id).."}"
						table.insert(tabela, name)


				end
			end
			if not result_plr:next() then
				break
			end
			--[[
			if teste == false then
				names = names.."-"
			end
			]]--
		end
		result_plr:free()
	end
	
	return tabela
end

function getPlayerVocString(cid)


	if not isPlayer(cid) then
		return false
	end

	local id = getPlayerVocation(cid)

		if id == 0  then
			return "Ro"
		elseif id == 1 then
			return "S"
		elseif id == 2 then
			return "D"
		elseif id == 3 then
			return "P"
		elseif id == 4 then
			return "K"
		elseif id == 5 then
			return "MS"
		elseif id == 6 then
			return "ED"
		elseif id == 7 then
			return "RP"
		elseif id == 8 then
			return "EK"
		end

end

function setChannelString(cid, tabela)

local names = ""
local qtd = 0
	for i = 1,#tabela do

		local name = tabela[i]
		local id = getCreatureByName(name)
		
		if id ~= nil then

			if  name ~= getCreatureName(cid) then
				if i == 1 then
					qtd = qtd +1
					names = names..name .."{"..getPlayerLevel(id).. " "..(getPlayerVocString(id) or "").. " "..#getPlayerSpectators(cid).."/50".."}"
				else
					names = names.."-"..name .."{"..getPlayerLevel(id).. " "..(getPlayerVocString(id) or "").. " "..#getPlayerSpectators(cid).."/50".."}"
					qtd = qtd +1
				end

				end
		end

	end
return names, qtd
end


function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid, "broadcast") == 1 then
			doPlayerSendCancel(cid, "Você não pode assistir a outros players enquanto tiver com seu cast ligado!")
		return true
	end

	local storage = "watchsys"
	local waittime = 3
	if exhaustion.check(cid, storage) then
		if isPlayer(cid) then
			if exhaustion.get(cid, storage) then
				doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " antes de usar o watch novamente.")
			end
		end
	return false
	end

	local tabela = getPlayerList(cid)
	if #tabela == 0 then
		doPlayerSendCancel(cid, "Cast não disponível.")
		return true
	end
	
	local str, numero = setChannelString(cid, tabela)
	if str == "" then
		doPlayerSendCancel(cid, "Cast não disponível.")
		return true
	end
	
	exhaustion.set(cid, storage, waittime)
	
	local result = {}
	
	if numero > 1 then
		result = string.explode(str, "-")
	else
		result[1] = str
	end
	
local strings = ""
	for i = 1,#result do

		local name = string.explode(result[i], "{")
		local number = getPlayerGUID(getPlayerByName(name[1])) + 1000
		
		
			strings = strings.. tostring(number)..";"..tostring(result[i])
		
		if i ~= #result then
			strings = strings..";"
		end
end

doPlayerOpenCustomDialog(cid, strings)

	return false
end