local bosses = {"Boss Stremoxy"}
local postpstremoxy = {x = 126, y = 59, z = 7}

local function choosePos(pos,cid)
	local newPos = pos
	newPos.x = pos.x + (math.random(-2,2))
	newPos.y = pos.y + (math.random(-2,2))
	if not isWalkable(cid,pos,false) then
		while not isWalkable(cid,pos,false) do
			newPos.x = pos.x + (math.random(-2,2))
			newPos.y = pos.y + (math.random(-2,2))
		end
	end
	return newPos
end


local function removeTp()
  local t = getTileItemById(postpstremoxy, 1387).uid
  return t > 0 and doRemoveItem(t) and doSendMagicEffect(postpstremoxy, CONST_ME_POFF)
end

local function spreadLoot(pos,cid)
	local corpse, check = {}, false
	for i = 1,10 do
		pos.stackpos = i
		corpse = getThingFromPos(pos)
		if corpse.uid and corpse.uid > 0 and isContainer(corpse.uid) then
			check = true
			break;
		end
	end
	if check then
		local itens = getContainerItemsInfo(corpse.uid)
		if countTable(itens) < 1 then return end
		for _, item in pairs(itens) do
			local newPos = choosePos(pos,cid)
			doSendDistanceShoot(pos, newPos, 40)
			doSendMagicEffect(newPos, 30)
			doCreateItem(item.itemid, item.quant, newPos)
			doRemoveItem(item.uid)
		end
	end
end

function onKill(cid, target, lastHit)
	if isInArray(bosses, getCreatureName(target)) then
		local pos = getThingPos(target)
		addEvent(spreadLoot, 400, pos, cid)
		
		if getGlobalStorageValue("bossSys") > 0 then
			doBroadcastMessage("O Boss Stremoxy morreu, e deu um belo loot a sociedade! O teleport no templo foi fechado.")
		end
		setGlobalStorageValue("bossSys", -1)
		removeTp()
		
	end
	return true
end
