function onStepIn(cid, item, position, fromPosition)
 
level = 100
if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendCancel(cid,"Somente level " .. level .. " ou mais podem passar aqui.")
end
return TRUE
end