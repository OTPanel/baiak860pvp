local cfg = {

	["forgamanitation hell's"] = {topos = {x = 3017, y = 1356, z = 6}, createpos = {x = 3006, y = 1484, z = 6}},
	["boss kiling spree"] = {topos = {x = 3113, y = 1477, z = 6}, createpos = {x = 3129, y = 1414, z = 6}},
	["infernatil maximus attack"] = {topos = {x = 7046, y = 5591, z = 14}, createpos = {x = 7050, y = 5619, z = 14}},
	["fire elemental maximus"] = {topos = {x = 3722, y = 2699, z = 14}, createpos = {x = 3610, y = 2683, z = 14}},
	["pandora"] = {topos = {x = 134, y = 45, z = 8}, createpos = {x = 42264, y = 39313, z = 7}},
	["the headsplitter"] = {topos = {x = 282, y = 404, z = 7}, createpos = {x = 283, y = 396, z = 7}},
    ["the island boss"] = {topos = {x = 23519, y = 20375, z = 5}, createpos = {x = 23464, y = 20284, z = 5}},
    ["the fire boss"] = {topos = {x = 2749, y = 1949, z = 6}, createpos = {x = 2858, y = 1946, z = 5}},
    ["the death boss"] = {topos = {x = 23449, y = 20462, z = 5}, createpos = {x = 23450, y = 20456, z = 5}},
    ["hellish ghalapago"] = {topos = {x = 39385, y = 32666, z = 6}, createpos = {x = 39369, y = 32315, z = 6}},
	["scarab maximus attack"] = {topos = {x = 39385, y = 32666, z = 6}, createpos = {x = 39468, y = 32730, z = 6}},
	["demodras maximus attack"] = {topos = {x = 39564, y = 32869, z = 6}, createpos = {x = 39592, y = 32781, z = 6}},
	["latrivan expert"] = {topos = {x = 3077, y = 1673, z = 5}, createpos = {x = 3122, y = 1658, z = 5}},
	["the sound attack"] = {topos = {x = 6884, y = 5533, z = 13}, createpos = {x = 6882, y = 5537, z = 13}},
	["the bossing ice brutus"] = {topos = {x = 39379, y = 32666, z = 6}, createpos = {x = 23829, y = 19654, z = 4}},

}

local function removeTeleport(pos)

	local tp = getTileItemById(pos,1387)

	if tp and tp.uid > 0 then
		doRemoveItem(tp.uid)
	end
end

function onDeath(cid, corpse, deathList)

    local nme = getCreatureName(cid):lower()

    if nme == "nether spook" or nme == "nether spawn" then
        local other = nme == "nether spook" and "nether spawn" or "nether spook"
        if getCreatureByName(other) then
            doCreatureSay(cid, "Vocês ainda devem derrotar "..other.." para prosseguir!", TALKTYPE_ORANGE_1)
        else
            doCreateTeleport(1387, {x = 2863, y = 1910, z = 5}, {x = 2716, y = 1880, z = 5})
            addEvent(removeTeleport,60000,{x = 2716, y = 1880, z = 5})
            doCreatureSay(cid,"O teleport abriu e vai sumir em 1 minuto",TALKTYPE_ORANGE_1)
        end
        return true
    end

    if nme == "the headsplitter" then
    	local parea = getPlayersInArea({x=273,y=387,z=7},{x=290,y=400,z=7})
    	if parea then
    		for _, pid in pairs(parea) do
    			doTeleportThing(pid,cfg[nme].topos)
    		end
    	end
    	return true
    end

    if cfg[nme] then
    	doCreateTeleport(1387,cfg[nme].topos, cfg[nme].createpos)
		countDownTeleport(cfg[nme].createpos, 60)
    	addEvent(removeTeleport,60000,cfg[nme].createpos)
    	doCreatureSay(cid,"O teleport abriu e vai sumir em 1 minuto",TALKTYPE_ORANGE_1)
    end

    return true
end

