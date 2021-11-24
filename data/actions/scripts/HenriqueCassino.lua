local positions = {{x = 144, y = 54, z = 7}, {x = 145, y = 54, z = 7}, {x = 146, y = 54, z = 7}} -- Posicao q os items nascem
local price = 250 -- Preco para jogar
local eventcoins = 6527
local items = {7407, 12288, 5907, 2443, 7429}
local rand = math.random(1, #items)
--local test = items[math.random(1, #items)]

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local first = items[math.random(1, #items)]
    local second = items[math.random(1, #items)]
    local third = items[math.random(1, #items)]
    local tab = {}
    local recheck = 0
        
    if getGlobalStorageValue(722404) > os.time() then
        doPlayerSendCancel(cid, "Aguarde um pouco para apostar.")
        return true
    end
    
     if getPlayerItemCount(cid,eventcoins) < price then
        doPlayerSendCancel(cid, "Você precisa de " .. price .. " event coins para jogar.")
        return true
    end

    if getPlayerStorageValue(cid,722406) > os.time() then
        doPlayerSendCancel(cid,"Aguarde um poco para jogar.")
        return true
    end
    doPlayerSetStorageValue(cid,722406,os.time()+6)
    
    setGlobalStorageValue(722404, os.time() + 6)
    for i = 1, (#positions) do
        doSendMagicEffect(positions[i], 22)
    end
    
    doTransformItem(item.uid, item.itemid == 9825 and 9826 or 9825)
    doPlayerRemoveItem(cid,eventcoins,price)
    doCreateItem(first, 1, positions[1])
    doSendMagicEffect(positions[1], 26)
    addEvent(doSendMagicEffect, 100, positions[1], 31)
    table.insert(tab, first) 
	setGlobalStorageValue(items[first], getGlobalStorageValue(items[first])+1) 
    addEvent(function()
        doCreateItem(second, positions[2])             
		setGlobalStorageValue(items[second], getGlobalStorageValue(items[second])+1) 
        doSendMagicEffect(positions[2], 26)
        addEvent(doSendMagicEffect, 100, positions[2], 31)
        table.insert(tab, second)
    end, 1700)
    addEvent(function()
        doCreateItem(third, 1, positions[3])
        doSendMagicEffect(positions[3], 26)
        addEvent(doSendMagicEffect, 100, positions[3], 31)
        setGlobalStorageValue(items[third], getGlobalStorageValue(items[third])+1)
        table.insert(tab, third)
    end, 2000)
    addEvent(function()
        doCleanTile(positions[1])
        doCleanTile(positions[2])
        doCleanTile(positions[3])
            doSendMagicEffect(positions[1], 54)
            doSendMagicEffect(positions[2], 54)
            doSendMagicEffect(positions[3], 54)
        if tab[1] == tab[2] and tab[1] == tab[3] then
            doPlayerAddItem(cid, tab[1])
			doPlayerSendTextMessage(cid, 27, "O Item que você ganhou é "..getItemNameById(first)..". Parabéns!" )
			doBroadcastMessage("o Jogador "..getCreatureName(cid).." ganhou o item "..getItemNameById(first).." no cassino!")
            doSendAnimatedText(getThingPos(cid), "Você", 25)
            addEvent(doSendAnimatedText, 800, getThingPos(cid), "Ganhou", 25)
            addEvent(doSendAnimatedText, 1600, getThingPos(cid), "Um item!", 25)
            doSendMagicEffect(getThingPos(cid), 30)
            doSendMagicEffect(positions[1], 30)
            doSendMagicEffect(positions[2], 30)
            doSendMagicEffect(positions[3], 30)
            addEvent(doSendMagicEffect, 800, getThingPos(cid), 29)
            addEvent(doSendMagicEffect, 800, positions[1], 29)
            addEvent(doSendMagicEffect, 800, positions[2], 29)
            addEvent(doSendMagicEffect, 800, positions[3], 29)
            addEvent(doSendMagicEffect, 1600, getThingPos(cid), 28)
            addEvent(doSendMagicEffect, 1600, positions[1], 28)
            addEvent(doSendMagicEffect, 1600, positions[2], 28)
            addEvent(doSendMagicEffect, 1600, positions[3], 28)
        else
            doSendAnimatedText(getThingPos(cid), "Você", 9)
            addEvent(doSendAnimatedText, 800, getThingPos(cid), "Perdeu", 40)
            addEvent(doSendAnimatedText, 1600, getThingPos(cid), "=(", 40)
        end
    end, 4200)
    return true
end
