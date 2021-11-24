function onUse(cid, item, fromPosition, itemEx, toPosition)
	surprisebox = math.random(1, 15)
	if surprisebox == 1 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 9693, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 2 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 2346, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 3 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 5897, 10)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 4 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 11249, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 5 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 7443, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 6 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 5468, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 7 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 12396, 10)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 8 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 12575, 10)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 9 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 9693, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 10 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 2346, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 11 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 5906, 10)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 12 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 11249, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 13 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 7443, 1)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 14 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 6527, 300)
		doRemoveItem(item.uid, 1)
	elseif surprisebox == 15 then
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerAddItem(cid, 5468, 1)
		doRemoveItem(item.uid, 1)
	end
	return TRUE
end