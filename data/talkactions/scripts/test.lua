function onSay(cid, words, param)
	local t,f,err = _G
	t.cid = cid
	pcall(function()
		f , err = loadstring(param)
	end)
	if f then
		setfenv(f, t)
		local ret,err = pcall(f)
		if ret == false then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,err)
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,err)
	end
return TRUE
end
