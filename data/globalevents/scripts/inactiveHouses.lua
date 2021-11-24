function getHouseOwnerLastLogin(ownerID)
	local Query = db.getResult("SELECT `lastlogin` FROM `players` WHERE id = '".. ownerID .."'")
	if(Query:getID() == -1) then
		return 0
	end
	local Result = Query:getDataInt("lastlogin")
	Query:free()
	return Result 
end

function onStartup()
	print(">> Checking inactive houses")
	for _, townID in pairs(getTownList()) do
		for _, houseID in pairs(getTownHouses(townID.id)) do
			local houseInfo = getHouseInfo(houseID)
			if houseInfo.owner ~= 0 then
				if not houseInfo.guildHall and getHouseOwnerLastLogin(houseInfo.owner) < os.time() - (60 * 60 * 24 * 7) then
					setHouseOwner(houseID, false, true)
				end
			end
		end
	end
	return true
end