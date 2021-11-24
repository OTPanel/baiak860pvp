function onStepIn(cid, item, position, fromPosition)

level = 150

if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
doPlayerSendCancel(cid,"You Need level " .. level .. " or more this pass.")
end
return TRUE
end