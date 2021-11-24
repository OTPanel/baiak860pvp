function onUse(cid, item, frompos, item2, topos)
if getPlayerAccess(cid) >= 0 then
doSendMagicEffect(frompos, 67)
end
return true
end