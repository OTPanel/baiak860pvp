function onUse(cid, item, frompos, item2, topos)

    if (isPlayerPzLocked(cid)) then

	    return doPlayerSendCancel(cid, "Você não pode se teletransportar agora!")

    end


    local msg = "Voce foi teleportado!"

    pos = {x=2478, y=992, z=7}

    doTeleportThing(cid, pos)

    doPlayerSendTextMessage(cid,22, msg)

    return doRemoveItem(item.uid, 1)

end