--[[
            SISTEMA DE CAÇADOR DE RECOMPENSAS FEITO POR LEORIC [OMEGA]
]]--

local function getIndexByValue(tab,value)
	for a,b in pairs(tab) do
		if b == value then
			tab[a] = 0
			return a
		end
	end
end

function onLook(cid, thing, position, lookDistance)
	if thing.actionid == 35500 then
		local hunted = {}
		for _,pid in ipairs(getPlayersOnline()) do
			if isHunted(pid) then
				local bounty = getPlayerBounty(getCreatureName(pid))
				table.insert(hunted, getCreatureName(pid)..' [Prêmio: '.. bounty ..'kk] <Level '..getPlayerLevel(pid)..'>')
			end
		end
		if #hunted < 1 then			
			doPlayerSendTextMessage(cid,25,'Nenhum jogador online está hunted.')
			return false
		end
		local str = ""
		for _, string in ipairs(hunted) do
			str = str..''..string..'\n'
		end
		str = str ~= '' and 'Players Hunted Online:\n'..str or false
		if str then
			doPlayerPopupFYI(cid, str)
		end		
		return false
	elseif thing.actionid == 3551 then
		local rank, relate = {}, {}
		local query = db.getResult("SELECT `player_id`, `value` FROM `player_storage` WHERE `key` = 7052 and `value` > 0 ORDER BY `value` DESC")
		if query:getID() == -1 then
			doPlayerSendTextMessage(cid, 25, 'Não tem nenhum caçador de recompensas regitrado.')
			return false
		end
		repeat
			relate[query:getDataInt("player_id")] = tonumber(query:getDataInt("value"))
			table.insert(rank,tonumber(query:getDataInt("value")))
		until not query:next()
		table.sort(rank)
		table.sort(relate)
		local str = "RANKING CAÇADORES DE RECOMPENSA\n"
		local j = 1
		local comp = #rank - 30 > 0 and #rank - 30 or 1
		for i = #rank,comp,-1 do
			local guid = 0
			for a,b in pairs(relate) do
				if b == rank[i] then
					guid = a
					relate[a] = 0
					break;
				end
			end
			local gid = guid > 0 and guid or false
			if gid then
				local name = getPlayerNameByGUID(gid) or false
				if name then
					str = str..j.." - ".. name .." ["..rank[i].."kk]\n"
					j = j + 1
				end
			end
		end
		doShowTextDialog(cid,9969,str)
		return false
	end
	return true
end