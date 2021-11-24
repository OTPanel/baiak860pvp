--- Slot removal system
--- Based on Mock the bear (MTB)'s upgrade, slot systems.
--- compatible with Cyko's random stats
local function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
 
if not setItemName then
    function setItemName(uid,name)
        return doItemSetAttribute(uid,'name',name)
    end
end
 
local function getWeaponLevel(uid) -- Function by Mock the bear.
   uid = uid or 0
   local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
   local lvl = string.match(name,'%s%+(%d+)%s*')
   return tonumber(lvl) or 0
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
local word = "" -- keep it for random items stats mod compatibility
         if item.uid == 0 or item.itemid == 0 then return false end
         toPosition.stackpos = 255
         if isCreature(itemEx.uid) == TRUE then
            return FALSE
         end
         
        -- keep it for random items stats mod compatibility
        if stringstarts(getItemName(itemEx.uid),"rare") then
        word = "rare "
        elseif stringstarts(getItemName(itemEx.uid),"special") then
        word = "special "
        elseif stringstarts(getItemName(itemEx.uid),"legendary") then
        word = "legendary "
        end
       
 
        local level = getWeaponLevel(itemEx)
        if level > 0 then
            setItemName(itemEx.uid, word..getItemNameById(itemEx.itemid)..' +'..(level))
        else
            setItemName(itemEx.uid, word..getItemNameById(itemEx.itemid))
        end
            addEvent(doPlayerSendTextMessage,500,cid, MESSAGE_LOOT,"All slots on your item are clear now.")
            doSendMagicEffect(toPosition, 12)
            doRemoveItem(item.uid,1)
    return true
end