 
--[[
Slot system 100% by mock \o
]]
---Config
local conf = {
maxSlotCount=2,
ignoredIds={}
}
--End
function choose(...) --- Function by mock.
    local arg = {...}
    return arg[math.random(1,#arg)]
end
if not getItemAttack then
    function getItemAttack(uid)
        return getItemAttribute(uid,'attack')
    end
    function getItemDefense(uid)
        return getItemAttribute(uid,'defense')
    end
end
local function isArmor(uid) -- Function by Mock the bear.
    if (getItemInfo(uid.itemid).armor ~= 0) and (getItemWeaponType(uid.uid) == 0) then
        return true
    end
    return false
end
local function isWeapon(uid) -- Function by Mock the bear.
    uid = uid or 0
    local f = getItemWeaponType(uid)
    if f == 1 or f == 2 or f == 3 then
        return true
    end
    return false
end
local function isShield(uid) -- Function by Mock the bear.
    uid = uid or 0
    if getItemWeaponType(uid) == 4 then
        return true
    end
    return false
end
local function isBow(uid) -- Function by Mock the bear.
    uid = uid or 0
    if getItemWeaponType(uid) == 5 and not isItemStackable(uid) then
        return true
    end
    return false
end
function onUse(cid, item, fromPosition, itemEx, toPosition) -- Script by mock the bear (MTB)
    if item.uid == 0 or item.itemid == 0 then return false end
    toPosition.stackpos = 255
    if item.uid == 0 or item.itemid == 0 then return false end
    toPosition.stackpos = 255
    if isInArray(conf.ignoredIds, itemEx.itemid)
        or (not getItemWeaponType(itemEx.uid) or getItemWeaponType(itemEx.uid) > 5)
        or (getItemWeaponType(itemEx.uid) == 0 and not isArmor(itemEx))
        or itemEx.itemid == 0 or itemEx.type > 1 or isItemStackable(itemEx.uid) then
        doPlayerSendTextMessage(cid, 24,"You cant open a slot on this item.")
        return TRUE
    end
    if isCreature(itemEx.uid) then
        return FALSE
    end
    local nam = getItemName(itemEx.uid)
    function getper()
        local n = 1
        for i=1,10 do
            n = n+math.random(0,10)
            if n < 8*i then
                break
            end
        end
        return n
    end
    function getSlotCount(nam)
        local c = 0
        for _ in nam:gmatch('%[(.-)%]') do
            c = c+1
        end
        return c
    end
    if getSlotCount(nam) < conf.maxSlotCount then
        local l = choose('hp','mp','ml','cas','shield','dist')
        local p = getper()
 
        doSendMagicEffect(toPosition,30)
        nam = nam..' ['..l..'.+'..p..'%]'
        doSendAnimatedText(toPosition,l..' '..p..'%',120)
        doItemSetAttribute(itemEx.uid,'name',nam)
        doRemoveItem(item.uid,1)
    else
        doPlayerSendTextMessage(cid, 24,"You cant open a slot on this item.")
    end
    return true
end
 