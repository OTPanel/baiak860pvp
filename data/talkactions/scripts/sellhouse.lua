local nme = "Sell House"

local function removeEscritura(cid)
	if isPlayer(cid) then
		local escritura = getPlayerItemById(cid,true,12632)
		if escritura and escritura.uid and escritura.uid > 0 then
			doRemoveItem(escritura.uid)
		end
	end
end

function onSay(cid, words, param)

	if not getHouseFromPos(getThingPos(cid)) then
		doPlayerSendCancel(cid,gTm(cid,nme,1))
		return true
	end

	if not param then
		doPlayerSendCancel(cid,gTm(cid,nme,2))
		return true
	end

	if getPlayerStorageValue(cid,666123) >= os.time() then
		doPlayerSendCancel(cid,gTm(cid,nme,3))
		return true
	end

	local tid = getPlayerByName(param)
	if tid then
		if tid ~= cid then
			if getDistanceBetween(getThingPos(cid), getThingPos(tid)) <= 2 then
				if getHouseOwner(getHouseFromPos(getThingPos(cid))) == getPlayerGUID(cid) then
					if not getHouseByPlayerGUID(getPlayerGUID(tid)) then
						local escritura = doPlayerAddItem(cid,12632,1)
						doItemSetAttribute(escritura,"description",gTm(tid,nme,4).." "..getCreatureName(cid)..""..gTm(tid,nme,5).." "..getCreatureName(tid))
						doStartTrade(cid,tid,escritura)
						doPlayerSetStorageValue(cid,666123,os.time()+60)
						doPlayerSetStorageValue(tid,666123,os.time()+60)
						addEvent(removeEscritura,40000,cid)
						addEvent(removeEscritura,40000,tid)
						doPlayerSendTextMessage(cid,22,gTm(cid,nme,6))
					else
						doPlayerSendCancel(cid,getCreatureName(tid).." "..gTm(cid,nme,7))
					end
				else
					doPlayerSendCancel(cid,gTm(cid,nme,8))
				end
			else
				doPlayerSendCancel(cid,gTm(cid,nme,9).." "..param)
			end
		else
			doPlayerSendCancel(cid,gTm(cid,nme,10))
		end
	else
		doPlayerSendCancel(cid,param.." "..gTm(cid,nme,11))
	end
	return true
end
