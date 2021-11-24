local config = {
    level = 2
}

local items = {9010,11337,7441,7442,7444,7445}

local SKINS = {
    -- Minotaurs
    [2830] = {55000, 5878},
    [2871] = {55000, 5878},
    [2866] = {55000, 5878},
    [2876] = {55000, 5878},
    [3090] = {55000, 5878},

    -- Lizards
    [4259] = {55000, 5876},
    [4262] = {55000, 5876},
    [4256] = {55000, 5876},

    -- Dragons
    [3104] = {55000, 5877},
    [2844] = {55000, 5877},

    -- Dragon Lords
    [2881] = {55000, 5948},

    -- Behemoths
    [2931] = {55000, 5893},

    -- Bone Beasts
    [3031] = {55000, 5925}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if(getPlayerLevel(cid) < config.level) then
        doPlayerSendCancel(cid, "You have to be at least Level " .. config.level .. " to use this tool.")
        return true
    end
    
    local skin = SKINS[itemEx.itemid]
    if(not skin) and not isInArray(items,itemEx.itemid) then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
        return true
    end    
    
    --
    if isInArray(items,itemEx.itemid) then
        if itemEx.itemid == 9010 then
            if getPlayerStorageValue(cid, 65049) <= 0 then
                doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
                doPlayerAddItem(cid, 8310, 1)
                setPlayerStorageValue(cid, 65049, 1)
            else
                doCreatureSayWithRadius(cid, "You already used your knife on the corpse.", TALKTYPE_ORANGE_1, 1, 1)
            end
        elseif itemEx.itemid == 11337 then --piece of marble
            statue = math.random(1, 100)
            if statue <= 70 then
                doItemSetAttribute(itemEx.uid, "description", "This shoddy work was made by "..getCreatureName(cid)..".")
                doTransformItem(itemEx.uid, 11338) ---rough
            elseif statue <= 99 then
                doItemSetAttribute(itemEx.uid, "description", "This little figurine made by "..getCreatureName(cid).." has some room for improvement.")
                doTransformItem(itemEx.uid, 11339) --regular
            else
                doItemSetAttribute(itemEx.uid, "description", "This little figurine of Tibiasula was masterfully sculpted by "..getCreatureName(cid)..".")
                doTransformItem(itemEx.uid, 11340) --
            end
        elseif itemEx.itemid == 7441 then --ice cube
            if math.random(1, 100) <= 30 then --30%
                doTransformItem(itemEx.uid, 7442) --1 carve
            else
                doPlayerSendDefaultCancel(cid, "You broke the ice cube")
                doRemoveItem(itemEx.uid)
            end
        elseif itemEx.itemid == 7442 then --ice cube, 1 carve
            if math.random(1, 100) <= 20 then --20%
                doTransformItem(itemEx.uid, 7444) --2 carve
            else
                doPlayerSendDefaultCancel(cid, "You broke the ice cube")
                doRemoveItem(itemEx.uid)
            end
        elseif itemEx.itemid == 7444 then --ice cube, 2 carve
            if math.random(1, 100) <= 10 then --10%
                doTransformItem(itemEx.uid, 7445) --3 carve
            else
                doPlayerSendDefaultCancel(cid, "You broke the ice cube")
                doRemoveItem(itemEx.uid)
            end
        elseif itemEx.itemid == 7445 then --ice cube, 3 carve
            if math.random(1, 100) <= 5 then --5%
                doTransformItem(itemEx.uid, 7446) --ice mammoth
            else
                doPlayerSendDefaultCancel(cid, "You broke the ice cube")
                doRemoveItem(itemEx.uid)
            end
        end
        doSendMagicEffect(toPosition, effect)
        return true
    end
    ---
    
    local random, effect = math.random(1, 100000), CONST_ME_GROUNDSHAKER
    if(random <= skin[1]) then
        doPlayerAddItem(cid, skin[2], 1)
    elseif(skin[3] and random >= skin[3]) then
        doPlayerAddItem(cid, skin[4], 1)
    else
        effect = CONST_ME_POFF
    end
    
    doSendMagicEffect(toPosition, effect)
    doTransformItem(itemEx.uid, itemEx.itemid + 1)
    return true
end