function onUse(cid, item, frompos, item2, topos)
pos = {x=1894, y=1937, z=6}
if item.itemid == 6575 then

doPlayerSendCancel(cid,"Abra o bau para se tornar vip3!")
doTeleportThing(cid,pos)
doRemoveItem(item.uid,1)
else

doPlayerSendCancel(cid,"Fail !")


end

return 1

end 