local function getTops()
	local tops = {}
	local player = db.getResult("SELECT `name` FROM `players` WHERE group_id < '2' ORDER BY `level` DESC LIMIT 2;")    
	if(player:getID() ~= -1) then
		local index = 0
		while (true) do
			local name = player:getDataString("name")
			tops[index+1] = name
			index = index + 1
			if not(player:next()) then
				break
			end
		end
		player:free()
	end
	return tops
end


local qry = db.query or db.executeQuery
local gp = function (kills)
    for i, v in pairs(patente) do
        if kills >= v[1] and kills < v[2] then
        	return v[3]
        end
    end
end


function onThink(interval, lastExecution, thinkInterval)
	local tops = getTops()
	if type(tops) == "table" then
		setGlobalTableStorage(722351,tops)
	end
	
	local rank,relate = {},{}
	local query = db.getResult("SELECT `player_id`, `value` FROM `player_storage` WHERE `key` = 722500 and `value` > 0 ORDER BY `value` DESC")
	if query:getID() ~= -1 then
		qry("DELETE FROM top_killers")
		repeat
			relate[query:getDataInt("player_id")] = tonumber(query:getDataInt("value"))
			table.insert(rank,tonumber(query:getDataInt("value")))
		until not query:next()
		table.sort(rank)
		table.sort(relate)
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
			local name = guid > 0 and guid or false
			if name then
				qry('INSERT INTO top_killers (player_id,kills,patente) VALUES ("'..name..'","'..rank[i]..'","'.. gp(rank[i]) ..'")')
				j = j + 1
			end
		end
		query:free()
	end	
	return true
end
