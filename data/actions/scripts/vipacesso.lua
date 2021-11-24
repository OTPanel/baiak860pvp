function onUse(cid, item, fromPosition, itemEx, toPosition)

a = 33335
id = 2349

if getPlayerStorageValue(cid, a) < 1 then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a "..getItemNameById(id)..".")
doPlayerAddItem(cid, id, 1)
doPlayerSetStorageValue(cid, a, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
end

return TRUE
end
