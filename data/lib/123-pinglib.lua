---Pinglib by mock the bear
ping = {
	_VERSION = "1.0";
	_AUTHOR = "Mock the bear";
    test = function()
        if not getPlayerLastPong then
            print('Error! Cannot run this lib without source changes.')
            return false
        else
            return true
        end
    end,
    CONST_WATING_RESPONSE = -3,
	CONST_DISCONECTED = -1,
}
 
function ping.CheckPing(cid) -- getPlayerPing By mock
    local c = getPlayerLastPong(cid)
    local l = getPlayerLastPing(cid)
	if not c or not 1 then
        return -2
	end
    local ping = math.floor((c-l))
    if ping < 0 then
        if ping*-1 > 2000 then
            return -2
        end
        return -3
    end
    return ping
end
 
function ping.loop(cid,storage,f,...) -- check
    if not isPlayer(cid) then
        return false
    end
    local ping = ping.CheckPing(cid)
    if ping ~= CONST_WATING_RESPONSE then
        if not tonumber(ping) then
            doPlayerSetStorageValue(cid,storage,ping.CONST_DISCONECTED)
            return
        else
            doPlayerSetStorageValue(cid,storage,ping)
                        f(cid,storage,ping,...)
            return
        end
    end
    addEvent(ping.loop,100,cid,storage,f,...)
end
 
function ping.getPing(cid,storage,f,...) --- This function will send a ping request and wait the response, so then will add an value on a storage.
    if ping.test() then
        doPlayerSetStorageValue(cid,storage,ping.CONST_WATING_RESPONSE)
        doPlayerSendPing(cid)
        ping.loop(cid,storage,f,...)
    end
end