local talkState = {}
local focus, old_focus = 0, 0 
local dice_pos = {x=32465,y=32497,z=7,stackpos=255}
local player_pos = {x=32464,y=32499,z=7}
local nme = "Dice"

function msgcontains(txt, str) 
	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)')) 
end 
 
function onCreatureSay(cid, type, msg) 
	local msg = string.lower(msg) 
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid 

	local function rollDice(cid,ammount)
		local value = math.random(5792, 5797)

		local item = getThingFromPos(dice_pos)
		if item and item.uid and item.uid > 0 and item.itemid >= 5792 and item.itemid <= 5797 then

			doTransformItem(item.uid, value)

		end
		doSendMagicEffect(dice_pos, CONST_ME_CRAPS)
		local rolled = value - 5791
		doCreatureSay(getNpcId(), getCreatureName(getNpcId()) .. ' rolled a ' .. rolled .. '.', TALKTYPE_ORANGE_1)
		if rolled == ammount then
			local backpack = doCreateItemEx(10521)
	   		doAddContainerItem(backpack,12627,3)
	   		doAddContainerItem(backpack,12626,3)
	   		doAddContainerItem(backpack,10310,1)
	   		doAddContainerItem(backpack,7488,1)
	   		doPlayerAddItemEx(cid,backpack)
	   		doSendMagicEffect(getThingPos(cid),29)
	   		doCreatureSay(cid,gm(cid,nme,1),TALKTYPE_ORANGE_1)
	   	else
	   		doCreatureSay(cid,gm(cid,nme,2),TALKTYPE_ORANGE_1)
	   		doSendMagicEffect(getThingPos(cid),CONST_ME_POFF)
	   	end
	   	addEvent(function()
	   		doPlayerSetStorageValue(cid,722522,-1)
	   		doTeleportThing(cid,{x=160,y=50,z=4})
	   	end,2000)
	end

 
	if isInArray({1,2,3,4,5,6},tonumber(msg)) and focus == cid then
		local storage = getPlayerStorageValue(cid,722522)
		if storage == -1 then
			doPlayerSetStorageValue(cid,722522,1)
			rollDice(cid,tonumber(msg))
		end
	end 
end

function onThink()

	local player = getTopCreature(player_pos)
	if player and player.uid and player.uid > 0 and isPlayer(player.uid) then
		if focus ~= player.uid then
			focus = player.uid
			selfSay(gm(cid,nme,3).." "..getCreatureName(player.uid)..".")
			addEvent(function()
				if isPlayer(player.uid) then
					doSendMagicEffect(getThingPos(player.uid),CONST_ME_POFF)
					doPlayerSetStorageValue(player.uid,722522.-1)
					doTeleportThing(player.uid,{x=160,y=50,z=4})
				end
			end,10000)
		end
	end
end
