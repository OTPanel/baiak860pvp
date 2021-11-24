function onUse(cid, item, fromPosition, itemEx, toPosition)
    if doRemoveItem(item.uid, 1) then
	doPlayerPopupFYI(cid, " O Pigglet foi retirado do servidor. Vc recebeu 100kk no seu banco para compensar.")
	doPlayerSetBalance(cid, getPlayerBalance(cid) + 100000000)
end
return true
end
