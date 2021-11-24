function onSay(cid, words, param)
	if(not checkExhausted(cid, 666, 5)) then
		return false
	end
file = io.open('surprise.txt','r')
notice = file:read(-1)
doShowTextDialog(cid,7528,notice)
file:close()
end