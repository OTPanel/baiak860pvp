local Configs = {
	Time_To_Back_Wall = 20, -- Tempo em segundos
	Levers_AID = {
		[12500] = {Wall = {Position = {x = 9044, y = 8987, z = 7}, ID = 10649}},
		[12501] = {Wall = {Position = {x = 9096, y = 9087, z = 8}, ID = 8020}},
		[12502] = {Wall = {Position = {x = 8757, y = 8928, z = 8}, ID = 7131}},
		[12503] = {Wall = {Position = {x = 8502, y = 8787, z = 8}, ID = 4471}},
		[12504] = {Wall = {Position = {x = 8594, y = 8795, z = 9}, ID = 903}},
	},
}


local function createWall(actionID)
	local Wall = getTileItemById(Configs.Levers_AID[actionID].Wall.Position, Configs.Levers_AID[actionID].Wall.ID).uid
	if Wall <= 0 then
		doCreateItem(Configs.Levers_AID[actionID].Wall.ID, 1, Configs.Levers_AID[actionID].Wall.Position)
	end
end

local function removeWall(actionID)
	local Wall = getTileItemById(Configs.Levers_AID[actionID].Wall.Position, Configs.Levers_AID[actionID].Wall.ID).uid
	if Wall and Wall > 0 then
		doRemoveItem(Wall)
		addEvent(createWall, Configs.Time_To_Back_Wall *60*1000, actionID)
		return true
	end
	return false
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray({1945, 1946}, item.itemid) and Configs.Levers_AID[item.actionid] then
		if removeWall(item.actionid) then
			doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Wall openned, run you has 20 minutes!")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Wall already open, run before to close.")
		end
	end
	return true
end