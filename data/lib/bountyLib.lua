--[[
			SISTEMA DE CAÇADOR DE RECOMPENSAS FEITO POR LEORIC [OMEGA] 
]]--

bountyReward = 7050
bountyPoints = 7051
bountyRank = 7052
bountyHire = 7053

bountyConfig = 
{
	min = 10000000, -- Mínimo aceito para adicionar uma recompensa
	fee = 10, -- Taxa para adicionar uma recompensa por algum jogador
	omegaPointSystem = false, -- [true -> cálculo automático dos pontos de acordo com a recompensa / false -> desabilitado]
	points = false, -- [false -> desabilitado / número de pontos que o jogador receberá por caçar um procurado]
}

function isHunted(cid)
	if isPlayer(cid) then
		local id = getPlayerGUID(cid)
		local bounty = db.getResult("SELECT `bounty` FROM `players` WHERE `id` = "..id..";")
		if bounty:getID() == -1 then return false end
		return bounty:getDataInt("bounty") > 0 and true or false
	end
	return false
end

function getPlayerBounty(playername)
	if playerExists(playername) then
		local id = getPlayerGUIDByName(playername)
		local bounty = db.getResult("SELECT `bounty` FROM `players` WHERE `id` = "..id..";")
		return bounty:getDataInt("bounty") ~= 0 and bounty:getDataInt("bounty") or 0
	end		
	return false
end

function doPlayerAddBounty(playername, bounty)
	if not tonumber(bounty) or tonumber(bounty) < 1 or tonumber(bounty) == nil then
		return false
	end
	if getPlayerBounty(playername) then
		local pid = getPlayerGUIDByName(playername)
		local bounty_ = bounty + getPlayerBounty(playername)
		if db.query("UPDATE `players` SET `bounty` = "..bounty_.." WHERE `id` = "..pid..";") then
			return true
		end
	end
	return false
end

function doPlayerClearBounty(playername)
	if playerExists(playername) then
		local pid = getPlayerGUIDByName(playername)
		if db.query("UPDATE `players` SET `bounty` = 0 WHERE `id` = "..pid..";") then
			return true
		end
	end
	return false
end

function getTopBounties(max)
	local query = db.getResult("SELECT `id` FROM `players` WHERE `bounty` > 0 ORDER BY `bounty` DESC;")
	if query:getID() == -1 then
		return false
	end
	local tabela = {}
	local i = 0
	repeat
		local guid = query:getDataInt("id")
		if getPlayerNameByGUID(guid) then
			table.insert(tabela, guid)		
			i = i + 1
		end
	until i >= max or not query:next()
	return tabela
end

function doPlayerAddBountyPoints(cid, bounty)
	local points = 0
	if bountyConfig.omegaPointSystem then
		points = math.ceil(bounty / 10000)
	elseif bountyConfig.points == true then
		points = 1
	elseif type(bountyConfig.points) == 'number' then
		points = bountyConfig.points
	end
	if points > 0 then
		setPlayerStorageValue(cid, bountyPoints, getPlayerStorageValue(cid, bountyPoints) + points)
	end
	return points > 0 and points or false
end

function playerExist(playername)
	exist = db.getResult("SELECT `id` FROM `players` WHERE `name` = '"..playername.."';")
	return exist:getID() ~= -1 and true or false
end